from rest_framework import serializers
from backend.core.models.article import Article

class ArticleSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Article
        fields = ['id', 'title', 'text', 'category']