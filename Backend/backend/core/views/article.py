from django.db.models.query import QuerySet
from rest_framework import viewsets
from rest_framework.permissions import AllowAny
from backend.core.serializers.article import Article, ArticleSerializer


class ArticleViewSet(viewsets.ModelViewSet):
    permission_classes = (AllowAny, )
    queryset = Article.objects.all()
    serializer_class = ArticleSerializer

    def get_queryset(self) -> QuerySet:
        qs = super().get_queryset()
        if self.action == "list":
            qs = Article.objects.order_by('-id').all()
        return qs
