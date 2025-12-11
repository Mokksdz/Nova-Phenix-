#!/bin/bash
# ============================================
# Script de nettoyage - Nova Phénix Site
# ============================================
# Ce script supprime les fichiers parasites macOS
# et optimise la structure du projet

echo "🧹 Nettoyage du projet Nova Phénix..."
echo ""

# Aller dans le répertoire du projet
cd "$(dirname "$0")/.." || exit 1

# Compter les fichiers avant
COUNT_BEFORE=$(find . -name "._*" -o -name ".DS_Store" | wc -l)
echo "📊 Fichiers parasites trouvés : $COUNT_BEFORE"

# Supprimer les fichiers macOS parasites
echo ""
echo "🗑️  Suppression des fichiers ._* ..."
find . -name "._*" -type f -delete

echo "🗑️  Suppression des fichiers .DS_Store ..."
find . -name ".DS_Store" -type f -delete

# Compter les fichiers après
COUNT_AFTER=$(find . -name "._*" -o -name ".DS_Store" | wc -l)

echo ""
echo "✅ Nettoyage terminé !"
echo "   Fichiers supprimés : $((COUNT_BEFORE - COUNT_AFTER))"
echo ""

# Afficher les gros fichiers
echo "📁 Images volumineuses (> 1 Mo) à optimiser :"
find . -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) -size +1M -exec ls -lh {} \; | awk '{print "   " $5 " - " $9}'

echo ""
echo "💡 Conseil : Utilisez https://squoosh.app pour compresser les images."
