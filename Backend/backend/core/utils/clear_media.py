import os

from django.conf import settings

def delete_local_images():
    root_media = settings.MEDIA_ROOT
    for root, dirs, files in os.walk(root_media):
        for file in files:
            to_del = os.path.join(root, file)
            os.remove(to_del)