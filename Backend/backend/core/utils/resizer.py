from PIL import Image
from django.conf import settings
import os


def resize_image(path, max_width=800):
    try:
        if path.name:
            full_path = os.path.join(settings.MEDIA_ROOT, path.name)
    except AttributeError:
        full_path = os.path.join(settings.MEDIA_ROOT, path)
    pil = Image.open(full_path)
    print(full_path)

    width, height = pil.size
    if width <= max_width:
        print('A imagem não será redimensionada')
        pil.close()
        return

    new_height = (max_width * height) // width
    save_img = pil.resize((max_width, new_height), Image.LANCZOS)
    save_img.save(
        full_path,
        optimize=True,
        quality=50
    )
    print('Redimensionamento feito com sucesso')
    print(
        f'A imagem tinha {width}x{height}, agora tem {max_width}x{new_height}')
    pil.close()
