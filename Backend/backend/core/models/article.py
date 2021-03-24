from django.db import models

# Create your models here.
class Article(models.Model):
    title = models.CharField(max_length=120)
    text = models.TextField()
    category = models.CharField(max_length=80)