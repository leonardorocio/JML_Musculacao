from django.db import models
from backend.core.models.user import User

bio_sex = (
    ('M', 'Masculino'),
    ('F', 'Feminino')
)


class Profile(models.Model):
    owner = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name='owner', unique=True)
    age = models.IntegerField(blank=True, null=True)
    height = models.FloatField(max_length=100, blank=True, null=True)
    weight = models.FloatField(max_length=100, blank=True, null=True)
    biosex = models.CharField(
        choices=bio_sex, max_length=101, blank=True, null=True)
    image = models.TextField(blank=True, null=True)
    
