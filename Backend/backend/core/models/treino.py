from __future__ import annotations
from django.db import models
from backend.core.models.exercicio import Exercicio

levels = (
    ('Iniciante', 'Iniciante'),
    ('Moderado', 'Moderado'),
    ('Avançado', 'Avançado')
)


class Treino(models.Model):
    avg_level = models.CharField(
        choices=levels, max_length=10, verbose_name="Dificuldade média")
    body_part = models.CharField(max_length=100, verbose_name="Parte do Corpo")
    exercise = models.ManyToManyField(Exercicio, related_name="exercise")

    def __str__(self) -> str:
        return f'Treino de {self.body_part}'
