from rest_framework.routers import DefaultRouter
from backend.core.views import (
    UserViewSet, ProfileViewSet, ArticleViewSet, CategoryViewSet,
    ExerciseViewSet, WorkoutViewSet, ComentarioViewSet)

router = DefaultRouter()
router.register(r'auths', UserViewSet, 'auth')
router.register(r'profiles', ProfileViewSet, 'profile')
router.register(r'articles', ArticleViewSet, 'article')
router.register(r'categories', CategoryViewSet, 'category')
router.register(r'workouts', WorkoutViewSet, 'workout')
router.register(r'exercises', ExerciseViewSet, 'exercise')
router.register(r'comments', ComentarioViewSet, 'comment')
