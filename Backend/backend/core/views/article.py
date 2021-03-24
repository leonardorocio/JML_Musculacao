from rest_framework import viewsets
from rest_framework.permissions import AllowAny, IsAuthenticated
from backend.core.serializers.article import Article, ArticleSerializer

class ArticleViewSet(viewsets.ModelViewSet):
    permission_classes = (AllowAny, )
    queryset = Article.objects.all()
    serializer_class = ArticleSerializer
