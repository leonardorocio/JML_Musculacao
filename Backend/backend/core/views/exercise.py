from backend.core.models.exercicio import Exercicio
from rest_framework import viewsets
from rest_framework.permissions import AllowAny
from backend.core.serializers import ExercicioSerializer


class ExerciseViewSet(viewsets.ModelViewSet):
    queryset = Exercicio.objects.all()
    permission_classes = [
        AllowAny
    ]
    serializer_class = ExercicioSerializer
