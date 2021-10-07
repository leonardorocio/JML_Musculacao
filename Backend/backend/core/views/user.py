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

    @action(detail=False, methods=['POST'])
    def logout(self, request, pk=None) -> Response:
        try:
            refresh_token = request.data['refresh_token']
            token = RefreshToken(refresh_token)
            token.blacklist()
            return Response(status=status.HTTP_205_RESET_CONTENT)
        except Exception:
            return Response(status=status.HTTP_400_BAD_REQUEST)

    @action(methods=["GET"], detail=True)
    def get_user_workout(self, request, pk) -> Response:
        instance = User.objects.get(id=pk)
        if instance is not None:
            workout = UserSerializer(instance).data["workout"]
            return Response(data={"workout": workout},
                            content_type='application/json',
                            status=status.HTTP_200_OK)
        return Response(data={"error": "Não foi possível pegar o treino."},
                        content_type='application/json',
                        status=status.HTTP_400_BAD_REQUEST)


