from rest_framework import serializers
from backend.core.models.article import Article

class ArticleSerializer(serializers.HyperlinkedModelSerializer):

    def create(self, validated_data):
        # TODO RESOLVER A STRING DE UPLOAD
        print(validated_data)
        return super().create(validated_data)

    class Meta:
        model = Article
        fields = ['id', 'title', 'text', 'category']