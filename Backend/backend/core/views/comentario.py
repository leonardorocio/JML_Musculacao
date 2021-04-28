from backend.core.models.comentario import Comentario
from rest_framework import viewsets
from backend.core.serializers import ComentarioSerializer
from rest_framework.permissions import AllowAny


class ComentarioViewSet(viewsets.ModelViewSet):
    serializer_class = ComentarioSerializer
    queryset = Comentario.objects.order_by(
        '-id').filter(publicado_comentario=True)
    permission_classes = [
        AllowAny
    ]
