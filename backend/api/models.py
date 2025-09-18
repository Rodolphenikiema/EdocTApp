from django.db import models
from django.contrib.auth.models import AbstractUser, BaseUserManager
from django.core.validators import EmailValidator

# Gestionnaire personnalisé pour le modèle Utilisateur
class UtilisateurManager(BaseUserManager):
    def create_user(self, mail, prenom, nom, password=None, **extra_fields):
        if not mail:
            raise ValueError('L\'adresse email est obligatoire')
        
        mail = self.normalize_email(mail)
        user = self.model(
            mail=mail,
            prenom=prenom,
            nom=nom,
            username=mail,  # Utiliser l'email comme username
            **extra_fields
        )
        user.set_password(password)
        user.save(using=self._db)
        return user
    
    def create_superuser(self, mail, prenom, nom, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        
        if extra_fields.get('is_staff') is not True:
            raise ValueError('Le superuser doit avoir is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Le superuser doit avoir is_superuser=True.')
        
        return self.create_user(mail, prenom, nom, password, **extra_fields)

# Modèle de base Utilisateur
class Utilisateur(AbstractUser):
    prenom = models.CharField(max_length=100)
    nom = models.CharField(max_length=100)
    age = models.IntegerField(null=True, blank=True)
    mail = models.EmailField(unique=True, validators=[EmailValidator()])
    
    # Éviter les conflits avec les champs par défaut
    username = models.CharField(max_length=150, unique=True)
    email = models.EmailField(blank=True)  # Utiliser 'mail' à la place
    
    USERNAME_FIELD = 'mail'  # Utiliser mail comme identifiant
    REQUIRED_FIELDS = ['prenom', 'nom']
    
    # Ajouter le gestionnaire personnalisé
    objects = UtilisateurManager()
    
    def verification_infos_connec(self):
        """Vérifie les informations de connexion"""
        pass
    
    def se_connecter(self):
        """Méthode de connexion"""
        pass
    
    def se_deconnecter(self):
        """Méthode de déconnexion"""
        pass

# Modèle Patient
class Patient(models.Model):
    utilisateur = models.OneToOneField(Utilisateur, on_delete=models.CASCADE, primary_key=True)
    profil = models.IntegerField(null=True, blank=True)
    dossier_patient = models.CharField(max_length=255, unique=True)
    historique = models.TextField(blank=True)
    
    def creation_compte_profil(self):
        """Création du compte et profil patient"""
        pass
    
    def reserver_rdv(self):
        """Réserver un rendez-vous"""
        pass
    
    def analyser(self):
        """Analyser les données patient"""
        pass
    
    def envoie_message(self):
        """Envoyer un message"""
        pass
    
    def appel_vocal(self):
        """Passer un appel vocal"""
        pass
    
    def consultation_video(self):
        """Démarrer une consultation vidéo"""
        pass
    
    def payer(self):
        """Effectuer un paiement"""
        pass

# Modèle Docteur
class Docteur(models.Model):
    utilisateur = models.OneToOneField(Utilisateur, on_delete=models.CASCADE, primary_key=True)
    specialite = models.CharField(max_length=100)
    planning = models.BinaryField(null=True, blank=True)
    nom_hopital_type = models.CharField(max_length=255)
    
    def designer_date_rdv(self):
        """Désigner une date de rendez-vous"""
        pass
    
    def validation_rdv(self):
        """Valider un rendez-vous"""
        pass
    
    def prescription_ord(self):
        """Prescrire une ordonnance"""
        pass

# Modèle Admin
class Admin(models.Model):
    utilisateur = models.OneToOneField(Utilisateur, on_delete=models.CASCADE, primary_key=True)
    role = models.BooleanField(default=False)
    permissions = models.IntegerField()
    
    def manage_system(self):
        """Gérer le système"""
        pass

# Modèle Rendez-vous
class RendezVous(models.Model):
    STATUS_CHOICES = [
        ('pending', 'En attente'),
        ('confirmed', 'Confirmé'),
        ('completed', 'Terminé'),
        ('cancelled', 'Annulé'),
    ]
    
    date = models.DateField()
    heure = models.TimeField()
    statut = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending')
    patient = models.ForeignKey(Patient, on_delete=models.CASCADE)
    docteur = models.ForeignKey(Docteur, on_delete=models.CASCADE)
    
    def confirmer(self):
        """Confirmer le rendez-vous"""
        self.statut = 'confirmed'
        self.save()
    
    def annuler(self):
        """Annuler le rendez-vous"""
        self.statut = 'cancelled'
        self.save()

# Modèle Consultation Vidéo
class ConsultationVideo(models.Model):
    VIDEO_TYPES = [
        ('video', 'Vidéo'),
        ('audio', 'Audio seulement'),
    ]
    
    type_video = models.CharField(max_length=20, choices=VIDEO_TYPES, default='video')
    note = models.TextField(blank=True)
    rendezvous = models.OneToOneField(RendezVous, on_delete=models.CASCADE)
    
    def lancer(self):
        """Lancer la consultation vidéo"""
        pass
    
    def terminer(self):
        """Terminer la consultation vidéo"""
        pass

# Modèle Message
class Message(models.Model):
    contenu = models.TextField()
    date_envoi = models.DateTimeField(auto_now_add=True)
    date_reception = models.DateTimeField(null=True, blank=True)
    expediteur = models.ForeignKey(Utilisateur, on_delete=models.CASCADE, related_name='messages_envoyes')
    destinataire = models.ForeignKey(Utilisateur, on_delete=models.CASCADE, related_name='messages_recus')
    
    def envoyer(self):
        """Envoyer le message"""
        pass
    
    def recevoir(self):
        """Recevoir le message"""
        pass

# Modèle Appel Vocal
class AppelVocal(models.Model):
    APPEL_TYPES = [
        ('audio', 'Audio'),
        ('conference', 'Conférence'),
    ]
    
    appel_type = models.CharField(max_length=20, choices=APPEL_TYPES, default='audio')
    rendezvous = models.OneToOneField(RendezVous, on_delete=models.CASCADE)
    
    def lancer(self):
        """Lancer l'appel vocal"""
        pass
    
    def terminer(self):
        """Terminer l'appel vocal"""
        pass

# Modèle Ordonnance
class Ordonnance(models.Model):
    INFORMATION_TYPES = [
        ('medical', 'Médical'),
        ('prescription', 'Prescription'),
        ('diagnostic', 'Diagnostic'),
    ]
    
    informations_types = models.CharField(max_length=20, choices=INFORMATION_TYPES)
    date_validite = models.DateField()
    docteur = models.ForeignKey(Docteur, on_delete=models.CASCADE)
    patient = models.ForeignKey(Patient, on_delete=models.CASCADE)
    
    def ordonnance_numerique_livret(self):
        """Générer l'ordonnance numérique"""
        pass
    
    def renouveler(self):
        """Renouveler l'ordonnance"""
        pass

# Modèle Paiement
class Paiement(models.Model):
    STATUS_CHOICES = [
        ('pending', 'En attente'),
        ('completed', 'Terminé'),
        ('failed', 'Échoué'),
        ('refunded', 'Remboursé'),
    ]
    
    options_types = models.BooleanField(default=False)  # True pour carte, False pour espèces
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    date = models.DateTimeField(auto_now_add=True)
    statut = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending')
    patient = models.ForeignKey(Patient, on_delete=models.CASCADE)
    
    def payer(self):
        """Effectuer le paiement"""
        pass

# Modèle Assistant IA
class AssistantAI(models.Model):
    ASSISTANCE_TYPES = [
        ('symptom_analysis', 'Analyse des symptômes'),
        ('recommendation', 'Recommandation'),
        ('diagnostic_aid', 'Aide au diagnostic'),
    ]
    
    type_assistance = models.CharField(max_length=50, choices=ASSISTANCE_TYPES)
    patient = models.ForeignKey(Patient, on_delete=models.CASCADE)
    
    def analyser_symptomes(self):
        """Analyser les symptômes du patient"""
        pass
    
    def recommandation_solution(self):
        """Fournir des recommandations"""
        pass

# Modèle Compte Patient (relation avec Patient)
class ComptePatient(models.Model):
    dossier_patient = models.CharField(max_length=255)
    patient = models.OneToOneField(Patient, on_delete=models.CASCADE)
    
    def gestion_compte(self):
        """Gérer le compte patient"""
        pass

    def __str__(self):
        return f"Compte de {self.patient.utilisateur.prenom} {self.patient.utilisateur.nom}"

# Méthodes __str__ pour une meilleure représentation
class Meta:
    def __str__(self):
        return f"{self.prenom} {self.nom}"

Utilisateur.__str__ = lambda self: f"{self.prenom} {self.nom}"
Patient.__str__ = lambda self: f"Patient: {self.utilisateur.prenom} {self.utilisateur.nom}"
Docteur.__str__ = lambda self: f"Dr. {self.utilisateur.prenom} {self.utilisateur.nom} - {self.specialite}"
Admin.__str__ = lambda self: f"Admin: {self.utilisateur.prenom} {self.utilisateur.nom}"
RendezVous.__str__ = lambda self: f"RDV {self.date} {self.heure} - {self.patient} avec {self.docteur}"
