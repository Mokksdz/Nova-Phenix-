# Guide de Déploiement - O2Switch

Ce guide vous explique comment mettre en ligne votre site sur votre hébergement O2Switch.

## Préparation
J'ai préparé un dossier **`dist`** dans votre projet. Ce dossier contient uniquement les fichiers nécessaires pour le site (le fichier HTML et les images). C'est le contenu de ce dossier qu'il faudra envoyer.

## Méthode 1 : Via cPanel (Recommandé)
C'est la méthode la plus simple, sans logiciel à installer.

1.  Connectez-vous à votre compte **cPanel** O2Switch (le lien est généralement dans votre mail de bienvenue, ex: `https://votre-domaine.com/cpanel`).
2.  Cherchez l'icône **"Gestionnaire de fichiers"** (File Manager) et cliquez dessus.
3.  Dans la colonne de gauche, cliquez sur le dossier **`public_html`**.
    *   *Note : Si vous voulez que le site soit sur `votre-domaine.com`, mettez les fichiers ici.*
    *   *Si vous voulez un sous-domaine (ex: `nova.votre-domaine.com`), créez un dossier correspondant.*
4.  Cliquez sur le bouton **"Charger"** (Upload) dans la barre d'outils en haut.
5.  Glissez-déposez tous les fichiers qui sont dans le dossier **`dist`** (le fichier `index.html` et toutes les images).
6.  Une fois l'upload terminé, revenez au gestionnaire de fichiers.
7.  C'est tout ! Votre site devrait être accessible.

## Méthode 2 : Via FTP (FileZilla)
Si vous préférez utiliser un logiciel FTP.

1.  Ouvrez **FileZilla**.
2.  Entrez vos identifiants FTP (Hôte, Identifiant, Mot de passe, Port 21) fournis par O2Switch.
3.  Dans la fenêtre de droite (Serveur), ouvrez le dossier **`public_html`**.
4.  Dans la fenêtre de gauche (Votre ordinateur), naviguez vers le dossier **`dist`** du projet.
5.  Sélectionnez tous les fichiers du dossier `dist` et glissez-les vers le dossier `public_html` à droite.

## Vérification
Allez sur votre nom de domaine avec votre navigateur. Si vous ne voyez pas les changements immédiatement, essayez de vider le cache de votre navigateur (Ctrl+F5 ou Cmd+Shift+R).
