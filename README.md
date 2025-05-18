# YouTube Lite  

## Overview  
YouTube Lite is a minimalistic video-sharing platform inspired by the core functionalities of YouTube. Built with a modern hybrid architecture, it leverages **Next.js 13** for the frontend, **Django** for the backend, and **PostgreSQL** for data storage. The application is fully containerized with Docker, utilizing **NGINX** for routing and **Traefik** as the gateway.

---

## 📌 **Features**  

---

### 🎥 **Channel & Channel Analytics 📊**  

#### 🔸 **Channel Management**  
- Create, edit, and delete channels  
- Channel-specific settings (public, private, unlisted)  
- Manage playlists and video collections  
- Invite collaborators to manage the channel  

#### 🔸 **Channel Interactions**  
- Subscribe and unsubscribe  
- View subscriber lists  
- Send notifications to subscribers for new content  
- Private channel invitations (invite-only access)  

#### 🔸 **Channel Analytics**  
- View counts, like/dislike ratios  
- Watch time and engagement metrics  
- Subscriber growth statistics  
- Video performance statistics  
- Channel growth over time  
- Audience retention and click-through rates  

---

### 🎬 **Videos & Interactions**  

#### 🔸 **Video Management**  
- Upload, edit, and delete videos  
- Video player with theater mode, fullscreen, and mini-player  
- Subtitles and quality adjustments  
- Video privacy settings (Public, Private, Unlisted)  
- Thumbnails generation during upload  
- FFmpeg-based encoding for multiple resolutions (240p, 480p, 720p)  

#### 🔸 **Video Interactions**  
- Like, dislike, and view counters  
- Add to playlists  
- Comment and reply threads  
- Video sharing options (direct link, embed code, social share)  
- Report video for inappropriate content  

---

### 👤 **User Profiles**  

#### 🔸 **Profile Management**  
- Basic profile information (name, bio, avatar)  
- User activity (comments, likes, subscriptions)  
- Privacy settings (public profile, private profile)  
- Manage watch history and liked videos  

#### 🔸 **User Subscriptions**  
- Subscribe and unsubscribe to channels  
- Manage subscription list  
- Notification preferences for new content  

---

### 🔍 **Search & Discovery**  

#### 🔸 **Search**  
- Video search by title, description, tags  
- Channel search by name  
- User search by name  
- Search suggestions (autocomplete)  

#### 🔸 **Discovery**  
- Trending videos by region and category  
- Personalized recommendations based on watch history  
- Most liked and most viewed videos of the week  
- Suggested channels based on interests  

---

## 🚀 **Future Enhancements (To-Dos)**  
- Adaptive bitrate streaming (HLS or DASH)  
- Live chat during video premieres  
- WebSocket support for real-time updates (views, comments, likes)  
- Algorithmic Search for personalized recommendations  
- Trending algorithms for surfacing popular content  
- Infinite Scrolling for smooth feed updates  
- Analytics Dashboard for views, interactions, and storage usage  

---

## 🏗️ **Architecture**  
- **Frontend** → Next.js 13 (React, TailwindCSS, Axios, Prisma)  
- **Backend** → Django (DRF, Celery, Redis, PostgreSQL)  
- **Database** → PostgreSQL  
- **Message Broker** → Redis (for background tasks and real-time updates)  
- **Reverse Proxy** → NGINX  
- **Gateway** → Traefik (Load balancing and SSL termination)  

---

## 🔧 **Deployment**  
YouTube Lite is fully containerized with Docker Compose and Traefik for easy deployment. Simply run:  

    docker-compose up --build  

**Access the application:**  
- [Frontend](http://localhost)  
- [Backend API](http://localhost/api)  
- [Traefik Dashboard](http://localhost:8080)  

---

## 📜 **License**  
MIT License. Open for contributions and improvements.  
