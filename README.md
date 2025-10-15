# 🛍️ E-Commerce App — Flutter + DRF (JWT Auth)

Ce dépôt est une **preuve de faisabilité technique** démontrant comment prendre un **template Flutter open-source** et y intégrer une **logique métier minimale** connectée à une **API Django REST Framework** sécurisée avec **JWT**.

L’objectif est de personnaliser une base existante pour poser une **architecture claire et fonctionnelle** (authentification + affichage dynamique de données).

---

## ✨ Fonctionnalités principales

- 🔐 Authentification **JWT** avec DRF  
- 🧑 Connexion utilisateur depuis Flutter  
- 🛍️ Liste dynamique de produits affichée depuis une API REST  
- 🧭 Basée sur un template open-source Flutter  
- 🧪 Simple, modulaire et extensible

---

## 🧱 Stack Technique

| Côté | Technologie | Rôle |
|------|-------------|------|
| Frontend | [Flutter](https://flutter.dev/) | Interface utilisateur mobile |
| Backend | [Django REST Framework](https://www.django-rest-framework.org/) | API REST |
| Auth | [djangorestframework-simplejwt](https://django-rest-framework-simplejwt.readthedocs.io/en/latest/) | Sécurisation des endpoints |
| Service API | `api_service.dart` | Gestion des requêtes HTTP et du token |

---

## 📂 Structure du projet Flutter

lib/
├─ api_service.dart # Gestion des appels API et Auth JWT
├─ constants.dart # Constantes globales (URL de base...)
├─ models/
│ └─ product.dart # Modèle de données produit
├─ screens/
│ ├─ login_page.dart # Page de connexion
│ └─ home/ # Liste des produits
│ └─ details/ # Details d'un produits
├─ main.dart


---

## 🧰 Exemple de modèle Product (DRF)

```python
# pakapaka_api/pakapaka_api/models.py

from django.db import models

class Product(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    image = models.ImageField(upload_to='products/', default='products/default_product.jpeg')

    def __str__(self):
        return self.name
```
🔐 Authentification JWT

Endpoints utilisés côté backend :

    POST /api/token/ — Obtenir un token JWT

    POST /api/token/refresh/ — Rafraîchir le token

    GET /api/products/ — Accéder aux produits (authentification requise)


## 📸 UI (Template utilisé)

### Pages principales

| Accueil produits | Authentification |
| ---------------- | ---------------- |
| ![Accueil](https://github.com/djalehambode/pakapaka/blob/dev/screenshots/home.png) | ![Auth](https://github.com/djalehambode/pakapaka/blob/dev/screenshots/auth.png) |
| ![Details](https://github.com/djalehambode/pakapaka/blob/dev/screenshots/detail.png) |  |

---

### Exemple de données et backend

J'ai utilisé **django-seed** pour peupler la base de données côté Django.  
Pour les images des produits, j'ai utilisé l'image suivante de Kilichi obtenue sur Google :  

| Image produit par défaut | Screenshot Seed DB | DRF Server Endpoints |
| ----------------------- | ----------------- | ------------------ |
| ![Produit par défaut](https://github.com/djalehambode/pakapaka/blob/dev/screenshots/default_product.jpeg) | ![Screenshot 1](https://github.com/djalehambode/pakapaka/blob/dev/screenshots/Screenshot_from_2025-10-15_10-18-21.png) | ![DRF Endpoints](https://github.com/djalehambode/pakapaka/blob/dev/screenshots/drf_server_endpoints.png) |


🤝 Remerciements

- Template UI : [E-commerce-App-UI-Flutter](https://github.com/abuanwar072/E-commerce-App-UI-Flutter)
- Backend : [Django REST Framework](https://https://www.django-rest-framework.org/)
- Frontend : [Flutter](https://flutter.dev/)
