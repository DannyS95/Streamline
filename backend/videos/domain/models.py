# backend/videos/domain/models.py

from dataclasses import dataclass
from datetime import datetime

@dataclass
class Video:
    id: int
    title: str
    description: str
    upload_date: datetime
    video_file: str
    thumbnail: str
    views: int = 0
    likes: int = 0
    dislikes: int = 0
    is_public: bool = True
