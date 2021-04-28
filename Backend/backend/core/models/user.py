from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.
# Provavelmente vou ter que passar a parte de nome e sobrenome pra cá


class User(AbstractUser):
    email = models.EmailField(unique=True)
    workout = models.JSONField(blank=True, null=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username']
