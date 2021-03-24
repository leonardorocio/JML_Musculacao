from rest_framework.routers import DefaultRouter
from backend.core.views import UserViewSet, ProfileViewSet, ArticleViewSet

router = DefaultRouter()
router.register(r'auths', UserViewSet, 'auth')
router.register(r'profiles', ProfileViewSet, 'profile')
router.register(r'articles', ArticleViewSet, 'article')