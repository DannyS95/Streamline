from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .video_api_adapter import VideoApiAdapter

router = DefaultRouter()
router.register(r'videos', VideoApiAdapter, basename='video')

urlpatterns = [
    path('', include(router.urls)),
]
