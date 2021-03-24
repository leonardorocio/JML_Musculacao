from rest_framework_simplejwt.views import TokenViewBase
from backend.core.serializers.token import MyTokenObtainPairIdSerializer

class MyTokenObtainPairView(TokenViewBase):
    serializer_class = MyTokenObtainPairIdSerializer