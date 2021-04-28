from django.db import models
from .category import Category
from .user import User

# Create your models here.


class Article(models.Model):
    title = models.CharField(max_length=120, verbose_name='Título')
    image_post = models.ImageField(
        upload_to='images/',
        verbose_name='Imagem',
        null=True, blank=True)
    text = models.TextField(verbose_name='Texto do artigo')
    autor_post = models.ForeignKey(User, verbose_name='Autor',
                                   on_delete=models.DO_NOTHING)
    category = models.ForeignKey(Category, verbose_name='Categoria',
                                 on_delete=models.DO_NOTHING)

    def __str__(self) -> str:
        return self.title

    class Meta:
        verbose_name = 'Artigo'
        verbose_name_plural = 'Artigos'
