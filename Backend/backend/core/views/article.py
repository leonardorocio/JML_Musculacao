from django.db.models.query import QuerySet
from rest_framework import viewsets
from rest_framework.permissions import AllowAny
from backend.core.serializers.article import Article, ArticleSerializer
from django_filters.rest_framework import DjangoFilterBackend
from django.db.models import Q


class ArticleViewSet(viewsets.ModelViewSet):
    permission_classes = (AllowAny, )
    queryset = Article.objects.all()
    serializer_class = ArticleSerializer
    filter_backends = [DjangoFilterBackend]

    def get_queryset(self) -> QuerySet:
        qs = super().get_queryset()
        if self.action == "list":
            qs = Article.objects.order_by('-id').all()
            search_term = self.request.GET.get('searcher')
            if search_term is not None:
                qs = qs.filter(
                    Q(title__icontains=search_term) |
                    Q(text__icontains=search_term) |
                    Q(category__name__icontains=search_term) |
                    Q(autor_post__first_name__icontains=search_term) |
                    Q(autor_post__last_name__icontains=search_term)
                )
        return qs


