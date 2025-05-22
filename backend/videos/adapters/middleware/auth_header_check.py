# backend/videos/adapters/middleware/auth_header_check.py

from django.utils.deprecation import MiddlewareMixin
from django.http import JsonResponse

class EnforceAuthHeaderMiddleware(MiddlewareMixin):
    def process_request(self, request):
        if request.path.startswith('/api/') and not request.headers.get('Authorization'):
            return JsonResponse({'detail': 'Authorization header required'}, status=401)
