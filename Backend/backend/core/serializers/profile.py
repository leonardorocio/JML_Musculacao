from backend.core.models.user import User
from backend.core.models.profile import Profile
from rest_framework import serializers


class ProfileSerializer(serializers.ModelSerializer):
    owner_id = serializers.PrimaryKeyRelatedField(queryset=User.objects.all())

    def create(self, validated_data: dict) -> dict:
        validated_data["owner_id"] = validated_data['owner_id'].id
        return super().create(validated_data)

    class Meta:
        model = Profile
        fields = ['id', 'first_name', 'last_name', 'age',
                  'height', 'weight', 'biosex', 'owner_id', 'image']


class GetProfileIdSerializer(serializers.ModelSerializer):
    owner_id = serializers.IntegerField()

    class Meta:
        model = Profile
        fields = ['id', 'owner_id']
