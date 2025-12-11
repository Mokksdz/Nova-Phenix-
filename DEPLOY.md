# Guide de Publication (Déploiement)

Comme je n'ai pas accès direct à vos comptes d'hébergement, voici les méthodes les plus simples pour mettre votre site en ligne gratuitement.

## Option 1 : Netlify Drop (Le plus simple)
Idéal pour une mise en ligne immédiate sans configuration technique.
1.  Allez sur [app.netlify.com/drop](https://app.netlify.com/drop).
2.  Ouvrez le dossier **`dist`** qui se trouve dans votre projet `Nova Phénix Site`.
3.  **Glissez-déposez** le dossier `dist` (ou son contenu) dans la zone indiquée sur la page web.
4.  Votre site sera en ligne en quelques secondes ! Vous pourrez ensuite changer le nom du lien (ex: `novaphenix.netlify.app`).

> [!NOTE]
> **Si Netlify vous demande un mot de passe :**
> Cela peut arriver selon les réglages de votre compte. Pour l'enlever :
> 1. Allez dans le tableau de bord Netlify du site.
> 2. Cliquez sur **Site configuration** > **Access control**.
> 3. Dans la section **Visitor access**, choisissez **Open access** (ou désactivez le mot de passe).

## Option 2 : GitHub Pages
Si vous utilisez déjà GitHub.

1.  Créez un nouveau dépôt (repository) sur GitHub.
2.  Poussez vos fichiers (`index.html`, images, etc.) sur ce dépôt.
3.  Allez dans **Settings** > **Pages**.
4.  Sous "Source", choisissez `main` branch et cliquez sur **Save**.

## Option 3 : Vercel
Similaire à Netlify, très performant.

1.  Installez Vercel CLI : `npm i -g vercel` (si vous avez Node.js).
2.  Tapez `vercel` dans le terminal à la racine du projet.
3.  Suivez les instructions à l'écran.

---
**Note :** Assurez-vous que votre fichier principal s'appelle bien `index.html` (c'est déjà le cas).
