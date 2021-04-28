from django.db import models
from . import Article
from . import User
from django.utils import timezone


class Comentario(models.Model):
    titulo_comentario = models.CharField(max_length=100)
    autor_comentario = models.ForeignKey(
        User, on_delete=models.DO_NOTHING, related_name="creator")
    texto_comentario = models.TextField()
    artigo_comentario = models.ForeignKey(
        Article, on_delete=models.CASCADE, related_name="article")
    data_comentario = models.DateField(default=timezone.now)
    publicado_comentario = models.BooleanField(default=False)

    def __str__(self) -> str:
        return self.titulo_comentario
