from rest_framework.permissions import BasePermission, SAFE_METHODS

class VideoPermission(BasePermission):
    def has_permission(self, request, view):
        if view.action == 'list':
            return True  # Public access

        if view.action == 'retrieve':
            return request.user and request.user.is_authenticated

        return request.user and request.user.is_authenticated
