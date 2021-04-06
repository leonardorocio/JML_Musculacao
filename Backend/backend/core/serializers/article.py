from backend.core.serializers.user import UserSerializer
from backend.core.models.user import User
from rest_framework import serializers
from backend.core.models.article import Article

class ArticleSerializer(serializers.HyperlinkedModelSerializer):
    autor_post = serializers.ReadOnlyField(source='autor_post.email')
    category = serializers.ReadOnlyField(source='category.name')

    class Meta:
        model = Article
        fields = ['id', 'title', 'text', 'category', 'autor_post']
