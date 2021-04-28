from backend.core.models.user import User
from backend.core.models.article import Article
from rest_framework import serializers
from backend.core.models import Comentario


class ComentarioSerializer(serializers.ModelSerializer):
    autor_comentario_id = serializers.PrimaryKeyRelatedField(
        queryset=User.objects.all()
    )
    artigo_comentario_id = serializers.PrimaryKeyRelatedField(
        queryset=Article.objects.all()
    )

    def create(self, validated_data: dict) -> dict:
        vd = validated_data.copy()
        vd['artigo_comentario_id'] = vd['artigo_comentario_id'].id
        vd['autor_comentario_id'] = vd['autor_comentario_id'].id
        return super().create(vd)

    class Meta:
        model = Comentario
        fields = [
            'id', 'titulo_comentario', 'texto_comentario',
            'autor_comentario_id', 'artigo_comentario_id',
            'publicado_comentario', 'autor_comentario_id', 'data_comentario',
        ]
