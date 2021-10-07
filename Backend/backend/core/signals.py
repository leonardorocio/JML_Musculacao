import requests
from backend.core.models.user import User
from django.db.models.signals import pre_save, post_save
from django.dispatch import receiver
from backend.core.models import Article, Profile
from backend.core.utils.resizer import resize_image
from backend.core.utils import firebase, clear_media
from django.db.utils import IntegrityError


@receiver(pre_save, sender=Article)
def correct_html_and_path(sender, instance, **kwargs):
    instance.text = instance.text.replace("\"", "\'")
    img_tag = instance.text.split("img ")
    print(img_tag)
    if 'firebase' in instance.text or len(img_tag) == 1:
        return
    else:
        img = img_tag[1].split(' ')
        source = img[0][4:]
        firebase.storage.child(
            f'media/{instance.title}').put(fr'{source[2:-1]}')
        firebase_url = firebase.storage.child(
            f'media/{instance.title}').get_url(None)
        instance.text = instance.text.replace(source, f"'{firebase_url}'")


@receiver(post_save, sender=Article)
def remake_image(sender, instance, **kwargs):
    if 'firebase' not in instance.image_post.name:
        url = firebase.storage.child(
            f'media/{instance.image_post.name}').get_url(None)
        request = requests.get(url=url)
        if not request.status_code == 200:
            resize_image(instance.image_post)
            firebase.storage.child(
                f'media/{instance.image_post.name}').put(
                fr'{instance.image_post.path}')
            Article.objects.filter(id=instance.id).update(
                image_post=url
            )


@receiver(post_save, sender=User)
def create_profile_for_user(sender, instance, **kwargs):
    try:
        if not Profile.objects.filter(owner_id=instance.id):
            Profile.objects.create(
                owner_id=instance.id
            )
    except IntegrityError as e:
        print(f'Erro: {e}')


clear_media.delete_local_images()
