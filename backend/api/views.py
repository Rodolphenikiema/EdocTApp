from django.shortcuts import render
from rest_framework import viewsets, status
from rest_framework.decorators import api_view, action
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated, AllowAny
from django.contrib.auth import authenticate, login
from .models import Utilisateur, Patient, Docteur, Admin, RendezVous, Message, Ordonnance, Paiement
from .serializers import (
    UtilisateurSerializer, PatientSerializer, DocteurSerializer,
    RendezVousSerializer, MessageSerializer, OrdonnanceSerializer, PaiementSerializer
)

# Vue de test existante
@api_view(['GET'])
def hello_world(request):
    return Response({"message": "Hello from Django API!"})

# Authentification
@api_view(['POST'])
def login_view(request):
    mail = request.data.get('mail')
    password = request.data.get('password')
    
    if mail and password:
        user = authenticate(request, username=mail, password=password)
        if user:
            serializer = UtilisateurSerializer(user)
            return Response({
                'success': True,
                'user': serializer.data,
                'message': 'Connexion réussie'
            })
        else:
            return Response({
                'success': False,
                'message': 'Identifiants invalides'
            }, status=status.HTTP_401_UNAUTHORIZED)
    
    return Response({
        'success': False,
        'message': 'Email et mot de passe requis'
    }, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def register_view(request):
    serializer = UtilisateurSerializer(data=request.data)
    if serializer.is_valid():
        user = serializer.save()
        return Response({
            'success': True,
            'user': UtilisateurSerializer(user).data,
            'message': 'Inscription réussie'
        }, status=status.HTTP_201_CREATED)
    
    return Response({
        'success': False,
        'errors': serializer.errors
    }, status=status.HTTP_400_BAD_REQUEST)

# ViewSets pour les modèles
class UtilisateurViewSet(viewsets.ModelViewSet):
    queryset = Utilisateur.objects.all()
    serializer_class = UtilisateurSerializer
    permission_classes = [AllowAny]  # À ajuster selon vos besoins de sécurité

class PatientViewSet(viewsets.ModelViewSet):
    queryset = Patient.objects.all()
    serializer_class = PatientSerializer
    permission_classes = [AllowAny]

class DocteurViewSet(viewsets.ModelViewSet):
    queryset = Docteur.objects.all()
    serializer_class = DocteurSerializer
    permission_classes = [AllowAny]

class RendezVousViewSet(viewsets.ModelViewSet):
    queryset = RendezVous.objects.all()
    serializer_class = RendezVousSerializer
    permission_classes = [AllowAny]
    
    @action(detail=False, methods=['get'])
    def by_patient(self, request):
        patient_id = request.query_params.get('patient_id')
        if patient_id:
            rdvs = self.queryset.filter(patient_id=patient_id)
            serializer = self.get_serializer(rdvs, many=True)
            return Response(serializer.data)
        return Response({'error': 'patient_id requis'}, status=400)
    
    @action(detail=False, methods=['get'])
    def by_doctor(self, request):
        docteur_id = request.query_params.get('docteur_id')
        if docteur_id:
            rdvs = self.queryset.filter(docteur_id=docteur_id)
            serializer = self.get_serializer(rdvs, many=True)
            return Response(serializer.data)
        return Response({'error': 'docteur_id requis'}, status=400)

class MessageViewSet(viewsets.ModelViewSet):
    queryset = Message.objects.all()
    serializer_class = MessageSerializer
    permission_classes = [AllowAny]

class OrdonnanceViewSet(viewsets.ModelViewSet):
    queryset = Ordonnance.objects.all()
    serializer_class = OrdonnanceSerializer
    permission_classes = [AllowAny]

class PaiementViewSet(viewsets.ModelViewSet):
    queryset = Paiement.objects.all()
    serializer_class = PaiementSerializer
    permission_classes = [AllowAny]
