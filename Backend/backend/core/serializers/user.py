from django.contrib.auth.hashers import make_password
import django.contrib.auth.password_validation as validators
from backend.core.models import User
from django.core import exceptions
from rest_framework import serializers
from rest_framework_simplejwt.tokens import RefreshToken


class UserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)
    token = serializers.SerializerMethodField()

    def get_token(self, user: User) -> dict:
        refresh = RefreshToken.for_user(user)
        token = {
            'refresh': str(refresh),
            'access': str(refresh.access_token)
        }
        return token

    def validate(self, data: dict) -> dict:
        # Falta validar outras informações
        if not ('PATCH' in str(self.context['request']) and
                self.initial_data.get("password") is None):
            password = data.get('password')
            errors = dict()
            try:
                validators.validate_password(password=password)
            except exceptions.ValidationError as e:
                errors['password'] = list(e.messages)

            if errors:
                raise serializers.ValidationError(errors)

        return super(UserSerializer, self).validate(data)

    def create(self, validated_data: dict) -> dict:
        user = User.objects.create_user(
            username=validated_data['email'],
            email=validated_data['email']
            # first_name=validated_data['first_name'],
            # last_name=validated_data['last_name']
        )
        user.set_password(validated_data['password'])
        user.save()
        return user

    def update(self, instance, validated_data):
        if not ('PATCH' in str(self.context['request']) and
                self.initial_data.get("password") is None):
            validated_data['password'] = make_password(validated_data['password'])
            return super().update(instance, validated_data)
        return super().update(instance, validated_data)

    class Meta:
        model = User
        fields = ['id', 'email', 'password', 'token', 'workout']


class LogoutSerializer(serializers.ModelSerializer):
    refresh_token = serializers.CharField()

    class Meta:
        model = User
        fields = ['refresh_token']
