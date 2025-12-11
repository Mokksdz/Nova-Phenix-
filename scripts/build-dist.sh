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
cp "logo-nova-phenix-events.png" dist/ 2>/dev/null || true
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
cp "adel-chabane-ceo-fondateur.jpeg" dist/ 2>/dev/null || true
cp "hero-background.png" dist/ 2>/dev/null || true
cp "affiche-immigration-canada.png" dist/ 2>/dev/null || true
cp "logo-eman-travel.jpg" dist/ 2>/dev/null || true
cp "logo-innovation-way-canada.jpeg" dist/ 2>/dev/null || true
cp "logo-innovation-way-medical.jpeg" dist/ 2>/dev/null || true
cp "logo-medical-tourism.jpg" dist/ 2>/dev/null || true
cp "logo-maison-savon-alt.png" dist/ 2>/dev/null || true

echo "📁 Copie des galeries..."
mkdir -p "dist/Dercavo Réalisations"
cp -r "Dercavo Réalisations/"* "dist/Dercavo Réalisations/" 2>/dev/null || true

mkdir -p "dist/Image Event"
cp -r "Image Event/"* "dist/Image Event/" 2>/dev/null || true

mkdir -p "dist/Image Home"
cp -r "Image Home/"* "dist/Image Home/" 2>/dev/null || true

mkdir -p "dist/Image Travel"
cp -r "Image Travel/"* "dist/Image Travel/" 2>/dev/null || true

# Copier les fichiers SEO
echo "🔍 Copie des fichiers SEO..."
cp sitemap.xml dist/ 2>/dev/null || true
cp robots.txt dist/ 2>/dev/null || true

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
