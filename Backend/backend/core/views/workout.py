from rest_framework import viewsets
from backend.core.serializers import TreinoSerializer
from rest_framework.permissions import AllowAny
from backend.core.models import Treino


class WorkoutViewSet(viewsets.ModelViewSet):
    queryset = Treino.objects.all()
    permission_classes = [
        AllowAny
    ]
    serializer_class = TreinoSerializer

    def get_queryset(self):
        qs = super().get_queryset()
        if self.action == "list":
            qs = Treino.objects.order_by('-id').all()
        return qs

