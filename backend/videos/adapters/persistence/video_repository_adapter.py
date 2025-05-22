# backend/videos/adapters/persistence/video_repository_adapter.py

from videos.domain.entities.video import Video

class VideoRepository:
    def get_public_videos(self):
        return Video.objects.filter(is_public=True)

    def create(self, **kwargs):
        return Video.objects.create(**kwargs)
