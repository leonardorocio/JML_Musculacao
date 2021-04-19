from rest_framework import viewsets
from backend.core.serializers.user import UserSerializer, LogoutSerializer
from backend.core.models import User
from rest_framework.permissions import AllowAny
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework import status


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    permission_classes = [
        AllowAny
    ]
    serializer_class = UserSerializer

    def get_serializer_class(self):
        if self.action == 'logout':
            return LogoutSerializer
        return UserSerializer

    @action(detail=False, methods=['GET'])
    def get_user_checked(self, request, pk=None):
        return Response({'msg': 'Usuário autenticado com sucesso'})

    @action(detail=False, methods=['POST'])
    def logout(self, request, pk=None):
        try:
            refresh_token = request.data['refresh_token']
            token = RefreshToken(refresh_token)
            token.blacklist()
            return Response(status=status.HTTP_205_RESET_CONTENT)
        except Exception:
            return Response(status=status.HTTP_400_BAD_REQUEST)
