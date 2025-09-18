from django.urls import path, include
from rest_framework.routers import DefaultRouter
from . import views

# Configuration du routeur REST
router = DefaultRouter()
router.register(r'utilisateurs', views.UtilisateurViewSet)
router.register(r'patients', views.PatientViewSet)
router.register(r'docteurs', views.DocteurViewSet)
router.register(r'rendezvous', views.RendezVousViewSet)
router.register(r'messages', views.MessageViewSet)
router.register(r'ordonnances', views.OrdonnanceViewSet)
router.register(r'paiements', views.PaiementViewSet)

urlpatterns = [
    # API Info
    path('', views.hello_world, name='api_info'),
    
    # Authentification
    path('auth/login/', views.login_view, name='login'),
    path('auth/register/', views.register_view, name='register'),
    
    # Test de connexion
    path('hello/', views.hello_world, name='hello_world'),
    
    # Routes REST automatiques
    path('', include(router.urls)),
]