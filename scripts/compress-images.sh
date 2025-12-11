#!/bin/bash
# ============================================
# Script de compression d'images - Nova Phénix Site
# ============================================
# Ce script compresse les images lourdes en WebP
# Nécessite: brew install imagemagick webp

echo "🖼️  Compression des images lourdes..."
echo ""

cd "$(dirname "$0")/.." || exit 1

# Vérifier si les outils sont installés
if ! command -v convert &> /dev/null; then
    echo "❌ ImageMagick n'est pas installé."
    echo "   Installez-le avec: brew install imagemagick"
    exit 1
fi

if ! command -v cwebp &> /dev/null; then
    echo "❌ WebP n'est pas installé."
    echo "   Installez-le avec: brew install webp"
    exit 1
fi

# Fonction de compression
compress_to_webp() {
    local input="$1"
    local quality="${2:-80}"
    local output="${input%.*}.webp"
    
    if [ -f "$input" ]; then
        echo "📦 Compression: $input"
        local size_before=$(du -h "$input" | cut -f1)
        
        # Convertir en WebP
        cwebp -q "$quality" "$input" -o "$output" 2>/dev/null
        
        if [ -f "$output" ]; then
            local size_after=$(du -h "$output" | cut -f1)
            echo "   ✅ $size_before → $size_after ($output)"
        else
            echo "   ❌ Échec de la compression"
        fi
    else
        echo "   ⚠️ Fichier non trouvé: $input"
    fi
}

# Redimensionner et compresser une image
resize_and_compress() {
    local input="$1"
    local max_width="${2:-1920}"
    local quality="${3:-80}"
    local output="${input%.*}.webp"
    
    if [ -f "$input" ]; then
        echo "📦 Redimensionnement + Compression: $input"
        local size_before=$(du -h "$input" | cut -f1)
        
        # Redimensionner puis convertir en WebP
        convert "$input" -resize "${max_width}>" -quality 85 png:- | cwebp -q "$quality" -o "$output" -- -
        
        if [ -f "$output" ]; then
            local size_after=$(du -h "$output" | cut -f1)
            echo "   ✅ $size_before → $size_after ($output)"
        else
            echo "   ❌ Échec"
        fi
    fi
}

echo "=========================================="
echo "Images identifiées comme lourdes :"
echo "=========================================="
echo ""

# Liste des images lourdes à compresser
echo "1. affiche-immigration-canada.png (~4.1 MB)"
resize_and_compress "affiche-immigration-canada.png" 1200 75

echo ""
echo "2. hero-background.png (~720 KB)"
resize_and_compress "hero-background.png" 1920 80

echo ""
echo "3. logo-maison-savon-alt.png (~935 KB)"
resize_and_compress "logo-maison-savon-alt.png" 800 80

echo ""
echo "=========================================="
echo "Compression terminée !"
echo "=========================================="
echo ""
echo "⚠️  IMPORTANT: Mettez à jour vos fichiers HTML pour utiliser les nouvelles images .webp"
echo "   Exemple: affiche-immigration-canada.png → affiche-immigration-canada.webp"
echo ""
echo "💡 Pour une compatibilité maximale, utilisez la balise <picture>:"
echo '   <picture>'
echo '     <source srcset="image.webp" type="image/webp">'
echo '     <img src="image.png" alt="Description">'
echo '   </picture>'
