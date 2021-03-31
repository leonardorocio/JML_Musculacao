"""backend URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include

from drf_spectacular.views import SpectacularAPIView, SpectacularRedocView, SpectacularSwaggerView
from rest_framework_simplejwt.views import TokenRefreshView, TokenObtainPairView

from django.conf.urls.static import static


from backend import settings
from backend.core.router import router

admin.autodiscover()
admin.site.enable_nav_sidebar = False

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/docs/', SpectacularSwaggerView.as_view(), name='swagger-ui'),
    path('api/docs/redoc/', SpectacularRedocView.as_view(), name='redoc'),
    path('api/docs/schema/', SpectacularAPIView.as_view(), name='schema'),
    path('auths/login/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('auths/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('summernote/', include('django_summernote.urls')),
    path('', include(router.urls), name='create-user'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)
