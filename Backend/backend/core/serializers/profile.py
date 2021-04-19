from backend.core.serializers.user import UserSerializer
from backend.core.models.user import User
from backend.core.models.profile import Profile
from rest_framework import serializers


class ProfileSerializer(serializers.ModelSerializer):
    owner_id = serializers.PrimaryKeyRelatedField(queryset=User.objects.all())

    def create(self, validated_data):
        prof = Profile.objects.create(
            first_name=validated_data['first_name'],
            last_name=validated_data['last_name'],
            age=validated_data['age'],
            height=validated_data['height'],
            weight=validated_data['weight'],
            biosex=validated_data['biosex'],
            owner_id=UserSerializer(validated_data['owner_id']).data['id'],
            image=validated_data['image']
        )
        prof.save()
        return prof

    class Meta:
        model = Profile
        fields = ['id', 'first_name', 'last_name', 'age',
                  'height', 'weight', 'biosex', 'owner_id', 'image']


class GetProfileIdSerializer(serializers.ModelSerializer):
    owner_id = serializers.IntegerField()

    class Meta:
        model = Profile
        fields = ['id', 'owner_id']
