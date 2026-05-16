#!/bin/bash
# ============================================
# Script de build pour dist - Nova Phénix Site
# ============================================
# Ce script copie les fichiers nécessaires dans dist/

echo "🏗️  Build du dossier dist..."
echo ""

# Aller dans le répertoire du projet
cd "$(dirname "$0")/.." || exit 1

# Créer/nettoyer le dossier dist
rm -rf dist
mkdir -p dist

# Copier les fichiers essentiels
echo "📄 Copie des fichiers HTML..."
cp index.html dist/
cp mentions-legales.html dist/ 2>/dev/null || true
cp politique-confidentialite.html dist/ 2>/dev/null || true

echo "🖼️  Copie des logos Nova Phénix..."
cp "logo-nova-phenix-groupe.png" dist/ 2>/dev/null || true
cp "logo-nova-phenix-events.svg" dist/ 2>/dev/null || true
cp "logo-nova-phenix-consulting.png" dist/ 2>/dev/null || true
cp "logo-nova-phenix-trade.png" dist/ 2>/dev/null || true
cp "logo-nova-phenix-home.png" dist/ 2>/dev/null || true
cp "logo-nova-phenix-travel.png" dist/ 2>/dev/null || true

echo "🖼️  Copie des logos partenaires..."
cp "logo-dercavo.webp" dist/ 2>/dev/null || true
cp "logo-maison-savon.webp" dist/ 2>/dev/null || true
cp "logo-innovation-way.webp" dist/ 2>/dev/null || true
cp "logo-arizona.webp" dist/ 2>/dev/null || true
cp "logo-biova.webp" dist/ 2>/dev/null || true
cp "logo-elkader-plast.webp" dist/ 2>/dev/null || true

echo "🖼️  Copie des autres images..."
cp "hero-background.png" dist/ 2>/dev/null || true
cp "affiche-immigration-canada.png" dist/ 2>/dev/null || true
cp "logo-iman-travel.svg" dist/ 2>/dev/null || true
cp "logo-innovation-way-canada.jpeg" dist/ 2>/dev/null || true
cp "logo-innovation-way-medical.jpeg" dist/ 2>/dev/null || true
cp "logo-medical-tourism.jpg" dist/ 2>/dev/null || true
cp "logo-maison-savon-alt.png" dist/ 2>/dev/null || true

echo "🎨 Build + copie du CSS compilé..."
npm run build:css >/dev/null 2>&1 || (echo "   ⚠️  build:css a échoué — installez npm puis 'npm install'"; exit 1)
mkdir -p dist/css
cp css/styles.css dist/css/

echo "📄 Copie de la version EN..."
cp index-en.html dist/ 2>/dev/null || true

echo "📁 Copie des galeries..."
mkdir -p dist/dercavo-realisations
cp -r dercavo-realisations/* dist/dercavo-realisations/ 2>/dev/null || true

mkdir -p dist/image-event
cp -r image-event/* dist/image-event/ 2>/dev/null || true

mkdir -p dist/image-home
cp -r image-home/* dist/image-home/ 2>/dev/null || true

mkdir -p dist/image-travel
cp -r image-travel/* dist/image-travel/ 2>/dev/null || true

# Copier les fichiers SEO + déploiement
echo "🔍 Copie des fichiers SEO + config..."
cp sitemap.xml dist/ 2>/dev/null || true
cp robots.txt dist/ 2>/dev/null || true
cp netlify.toml dist/ 2>/dev/null || true

# Nettoyer les fichiers parasites du dist
echo "🧹 Nettoyage des fichiers parasites..."
find dist -name "._*" -type f -delete
find dist -name ".DS_Store" -type f -delete

# Afficher les stats
echo ""
echo "✅ Build terminé !"
echo ""
echo "📊 Statistiques :"
echo "   Fichiers : $(find dist -type f | wc -l)"
echo "   Taille : $(du -sh dist | cut -f1)"
echo ""
echo "📁 Le dossier dist/ est prêt pour le déploiement."
