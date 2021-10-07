from rest_framework import serializers
from backend.core.models import Treino


class TreinoSerializer(serializers.ModelSerializer):
    exercise = serializers.StringRelatedField(many=True)

    class Meta:
        model = Treino
        fields = ['id', 'avg_level', 'body_part', 'exercise', 'descricao']
