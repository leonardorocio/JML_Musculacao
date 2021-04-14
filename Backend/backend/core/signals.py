from django.db.models.signals import pre_save, post_save
from django.dispatch import receiver
from backend.core.models import Article, Profile
from backend.core.utils.resizer import resize_image
from backend.core.utils import firebase, clear_media
from django.conf import settings

@receiver(pre_save, sender=Article)
def correct_html_and_path(sender, instance, **kwargs):
    instance.text = instance.text.replace("\"", "\'")
    img_tag = instance.text.split("img ")
    if len(img_tag) == 1:
        return
    else:
        img = img_tag[1].split(' ')
        source = img[0][4:]
        firebase.storage.child(f'media/{instance.title}').put(fr'{source[2:-1]}')
        firebase_url = firebase.storage.child(f'media/{instance.title}').get_url(None)
        instance.text = instance.text.replace(source, f"'{firebase_url}'")

@receiver(post_save, sender=Article)
def remake_image(sender, instance, **kwargs):
    resize_image(instance.image_post)
    firebase.storage.child('media/').put(fr'{instance.image_post.path}')
    clear_media.delete_local_images()

@receiver(post_save, sender=Profile)
def resize_profile_img(sender, instance, **kwargs):
    if instance.image.startswith('http'):
        name = instance.image[82:instance.image.index('?')]
        name = name.replace('%20', ' ')
        firebase.storage.child(f'images/{name}').download(settings.MEDIA_ROOT, fr'{settings.MEDIA_ROOT}/{name}')
        resize_image(name)
        clear_media.delete_local_images()

