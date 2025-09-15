# EdocTApp - Intégration Django et Angular

Ce projet intègre un backend Django avec un frontend Angular pour créer une application web complète.

## Structure du projet

- `backend/` : API Django avec Django REST Framework
- `frontend/EdoctApp/` : Application Angular

## Configuration

### Backend (Django)

1. Activer l'environnement virtuel :
   ```
   cd venv/Scripts
   activate
   ```

2. Lancer le serveur Django :
   ```
   cd ../../backend
   python manage.py runserver
   ```
   Le serveur sera accessible à l'adresse http://localhost:8000/

### Frontend (Angular)

1. Installer les dépendances (si ce n'est pas déjà fait) :
   ```
   cd frontend/EdoctApp
   npm install
   ```

2. Lancer le serveur de développement Angular :
   ```
   ng serve
   ```
   L'application sera accessible à l'adresse http://localhost:4200/

## Test de la connexion API

1. Assurez-vous que les deux serveurs (Django et Angular) sont en cours d'exécution
2. Accédez à http://localhost:4200/api-test dans votre navigateur
3. Cliquez sur le bouton "Tester la connexion"
4. Si tout est correctement configuré, vous devriez voir la réponse de l'API Django

## Points d'API disponibles

- `GET /api/hello/` : Point de terminaison de test qui renvoie un message simple

## Dépannage

Si vous rencontrez des problèmes de connexion :

1. Vérifiez que les deux serveurs sont en cours d'exécution
2. Assurez-vous que CORS est correctement configuré dans Django
3. Vérifiez les erreurs dans la console du navigateur
4. Vérifiez les logs du serveur Django