from backend.core.models.comentario import Comentario
from rest_framework import viewsets
from backend.core.serializers import ComentarioSerializer
from rest_framework.permissions import AllowAny
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import status


class ComentarioViewSet(viewsets.ModelViewSet):
    serializer_class = ComentarioSerializer
    queryset = Comentario.objects.order_by(
        '-id').filter(publicado_comentario=True)
    permission_classes = [
        AllowAny
    ]

    def get_queryset(self, pk=None):
        qs = super().get_queryset()
        if self.action == 'get_article_comments':
            qs = Comentario.objects.order_by('-id').filter(
                publicado_comentario=True,
                artigo_comentario_id=pk
            )
        return qs

    @action(methods=["GET"], detail=True)
    def get_article_comments(self, request, pk):
        comments = self.get_queryset(pk=pk)
        if comments is not None:
            serial_comms = [ComentarioSerializer(com).data for com in comments]
            return Response(data={"comments": serial_comms},
                            status=status.HTTP_200_OK,
                            content_type='application/json')
        return Response(data={"error": "Erro ao buscar os comentários"},
                        status=status.HTTP_400_BAD_REQUEST,
                        content_type='application/json')
