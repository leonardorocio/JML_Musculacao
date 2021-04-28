from rest_framework_simplejwt.settings import api_settings
from django.contrib.auth.models import User, update_last_login
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework_simplejwt.serializers import TokenObtainSerializer
from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework import serializers


class MyTokenObtainPairSerializer(TokenObtainSerializer):
    user_id = serializers.SerializerMethodField()

    @classmethod
    def get_token(cls, user: User) -> dict:
        return RefreshToken.for_user(user)

    @classmethod
    def get_user_info(cls, user: User) -> tuple:
        return user.id, user.workout

    @classmethod
    def get_user_id(cls):
        pass

    def validate(self, attrs: dict) -> dict:
        data = super().validate(attrs)

        refresh = self.get_token(self.user)

        data['refresh'] = str(refresh)
        data['access'] = str(refresh.access_token)
        data['email'] = self.initial_data['email']
        id, workout = self.get_user_info(self.user)
        data['id'] = id
        data['workout'] = workout

        if api_settings.UPDATE_LAST_LOGIN:
            update_last_login(None, self.user)

        return data


class MyTokenObtainPairView(TokenObtainPairView):
    serializer_class = MyTokenObtainPairSerializer
