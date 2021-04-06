from backend.core.serializers import CategorySerializer
from rest_framework import viewsets
from backend.core.models import Category

class CategoryViewSet(viewsets.ModelViewSet):
    serializer_class = CategorySerializer
    queryset = Category.objects.all()