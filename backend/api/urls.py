from django.urls import path
from . import views

urlpatterns = [
    # Exemple d'endpoint API
    path('hello/', views.hello_world, name='hello_world'),
    # Ajoutez d'autres endpoints selon vos besoins
]