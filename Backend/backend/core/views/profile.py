from rest_framework import viewsets
from backend.core.serializers import ProfileSerializer
from backend.core.models import Profile
from rest_framework.permissions import AllowAny


class ProfileViewSet(viewsets.ModelViewSet):
    queryset = Profile.objects.all()
    serializer_class = ProfileSerializer
    permission_classes = [
        AllowAny
    ]
