from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.
bio = (
    ('M', 'Masculino'),
    ('F', 'Feminino')
)


class User(AbstractUser):
    email = models.EmailField(unique=True)
    # age = models.IntegerField(blank=True, default=0)
    # height = models.IntegerField(blank=True, null=True)
    # weight = models.IntegerField(blank=True, null=True)
    # biosex = models.CharField(choices=bio, max_length=10, blank=True,)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username']

