# backend/videos/adapters/api/video_api_adapter.py

from rest_framework import viewsets, permissions
from videos.infrastructure.orm.video_model import VideoModel
from .video_serializer_adapter import VideoSerializer

class VideoApiAdapter(viewsets.ModelViewSet):
    queryset = VideoModel.objects.all()
    serializer_class = VideoSerializer

    def get_permissions(self):
        if self.action == 'retrieve':
            return [permissions.IsAuthenticated()]
        if self.action == 'list':
            return [permissions.AllowAny()]
        return super().get_permissions()
