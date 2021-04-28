from rest_framework import viewsets
from rest_framework.serializers import Serializer, SerializerMetaclass
from backend.core.serializers import ProfileSerializer
from backend.core.serializers.profile import GetProfileIdSerializer
from backend.core.models import Profile
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.permissions import AllowAny


class ProfileViewSet(viewsets.ModelViewSet):
    queryset = Profile.objects.all()
    serializer_class = ProfileSerializer
    permission_classes = [
        AllowAny
    ]

    def get_serializer_class(self) -> Serializer:
        if self.action == 'get_profile_id':
            return GetProfileIdSerializer
        return ProfileSerializer

    @action(detail=False, methods=['POST'])
    def get_profile_id(self, request, pk=None) -> Response:
        owner_id = request.data['owner_id']
        try:
            id = Profile.objects.get(owner_id=owner_id)
            if id is not None:
                serialized = ProfileSerializer(id)
                return Response(data=serialized.data['id'],
                                content_type='application/json')
        except Exception as e:
            return Response({'msg': f'Ocorreu um erro: {e}'},
                            content_type='application/json')
