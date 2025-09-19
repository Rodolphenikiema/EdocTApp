from rest_framework import serializers
from .models import Utilisateur, Patient, Docteur, Admin, RendezVous, Message, Ordonnance, Paiement

class UtilisateurSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)
    
    class Meta:
        model = Utilisateur
        fields = ['id', 'prenom', 'nom', 'age', 'mail', 'password', 'is_active']
        extra_kwargs = {
            'password': {'write_only': True}
        }
    
    def create(self, validated_data):
        password = validated_data.pop('password')
        user = Utilisateur.objects.create_user(**validated_data)
        user.set_password(password)
        user.save()
        return user

class PatientSerializer(serializers.ModelSerializer):
    utilisateur = UtilisateurSerializer(read_only=True)
    
    class Meta:
        model = Patient
        fields = ['utilisateur', 'profil', 'dossier_patient', 'historique']

class DocteurSerializer(serializers.ModelSerializer):
    utilisateur = UtilisateurSerializer(read_only=True)
    
    class Meta:
        model = Docteur
        fields = ['utilisateur', 'specialite', 'planning', 'nom_hopital_type']

class RendezVousSerializer(serializers.ModelSerializer):
    patient = PatientSerializer(read_only=True)
    docteur = DocteurSerializer(read_only=True)
    patient_id = serializers.IntegerField(write_only=True)
    docteur_id = serializers.IntegerField(write_only=True)
    
    class Meta:
        model = RendezVous
        fields = ['id', 'date', 'heure', 'statut', 'patient', 'docteur', 'patient_id', 'docteur_id']

class MessageSerializer(serializers.ModelSerializer):
    expediteur = UtilisateurSerializer(read_only=True)
    destinataire = UtilisateurSerializer(read_only=True)
    
    class Meta:
        model = Message
        fields = ['id', 'contenu', 'date_envoi', 'date_reception', 'expediteur', 'destinataire']

class OrdonnanceSerializer(serializers.ModelSerializer):
    docteur = DocteurSerializer(read_only=True)
    patient = PatientSerializer(read_only=True)
    
    class Meta:
        model = Ordonnance
        fields = ['id', 'informations_types', 'date_validite', 'docteur', 'patient']

class PaiementSerializer(serializers.ModelSerializer):
    patient = PatientSerializer(read_only=True)
    
    class Meta:
        model = Paiement
        fields = ['id', 'options_types', 'montant', 'date', 'statut', 'patient']