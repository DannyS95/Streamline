# backend/videos/domain/models/video.py

from django.db import models

class VideoModel(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField()
    upload_date = models.DateTimeField(auto_now_add=True)
    video_file = models.FileField(upload_to='videos/')
    thumbnail = models.ImageField(upload_to='thumbnails/')
    views = models.IntegerField(default=0)
    likes = models.IntegerField(default=0)
    dislikes = models.IntegerField(default=0)
    is_public = models.BooleanField(default=True)

    class Meta:
        ordering = ['-upload_date']

    def __str__(self):
        return self.title
