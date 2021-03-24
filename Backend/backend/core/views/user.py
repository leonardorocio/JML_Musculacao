from rest_framework import viewsets
from backend.core.serializers.user import User, UserSerializer
from rest_framework.permissions import AllowAny
from rest_framework.decorators import action
from rest_framework.response import Response



class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    permission_classes = [
        AllowAny
    ]
    serializer_class = UserSerializer

    @action(detail=False, methods=['GET'])
    def get_user_checked(self, request, pk=None):
        return Response({'msg': 'Usuário autenticado com sucesso'})