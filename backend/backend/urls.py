from django.contrib import admin
from django.urls import path, include
from django.shortcuts import redirect

urlpatterns = [
    path('', lambda request: redirect('admin/')),  # Redirection vers admin
    path('admin/', admin.site.urls),
    path('api/', include('api.urls')),
]
