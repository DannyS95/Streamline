# backend/videos/adapters/persistence/video_repository_adapter.py

from videos.models import VideoModel

class VideoRepository:
    def get_public_videos(self):
        return VideoModel.objects.filter(is_public=True)

    def create(self, **kwargs):
        return VideoModel.objects.create(**kwargs)
