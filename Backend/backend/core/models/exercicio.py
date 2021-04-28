from django.db import models

levels = (
    ('Iniciante', 'Iniciante'),
    ('Moderado', 'Moderado'),
    ('Avançado', 'Avançado')
)


class Exercicio(models.Model):
    name = models.CharField(max_length=80, verbose_name='Nome')
    level = models.CharField(
        max_length=10, verbose_name='Dificuldade', choices=levels)
    n_series = models.PositiveSmallIntegerField(
        verbose_name="Número de Séries")
    n_reps = models.PositiveSmallIntegerField(
        verbose_name="Número de Repetições")
    avg_interval = models.PositiveIntegerField(verbose_name="Intervalo médio")
    # Verificar a adição de variações

    def __str__(self) -> str:
        return self.name
