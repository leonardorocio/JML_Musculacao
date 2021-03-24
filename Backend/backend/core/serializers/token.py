from rest_framework import serializers
from rest_framework_simplejwt.serializers import RefreshToken, TokenObtainPairSerializer
from backend.core.serializers.user import User, UserSerializer
from datetime import datetime

class MyTokenObtainPairIdSerializer(TokenObtainPairSerializer):
    # token = serializers.SerializerMethodField()

    @classmethod
    def get_token(cls, user):
        print(user)
        token = super().get_token(user)

        token['email'] = user.email
        return token

    def get_id(self, user):
        print(user)
        user = UserSerializer(user)
        return user.data['id']

    class Meta:
        model = User
        fields = ['id']
