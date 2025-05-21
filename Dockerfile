# Utilise une image de base Python officielle
FROM python:3.9-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier requirements.txt pour installer les dépendances
COPY requirements.txt .

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Copier tous les fichiers du projet dans le répertoire de travail
COPY . .

# Exposer le port 5000 (port utilisé par Flask)
EXPOSE 5000

# Commande pour démarrer l'application
CMD ["python", "app.py"]
