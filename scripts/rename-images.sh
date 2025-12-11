#!/bin/bash
# ============================================
# Script de renommage des images - Nova Phénix
# Noms SEO-friendly: minuscules, tirets, descriptifs
# ============================================

cd "$(dirname "$0")/.." || exit 1

echo "🖼️  Renommage des images avec noms SEO optimisés..."
echo ""

# Compteur pour les galeries
declare -i count_dercavo=1
declare -i count_event=1
declare -i count_home=1

# ============================================
# LOGOS ET IMAGES PRINCIPALES (racine)
# ============================================
echo "📁 Renommage des logos et images principales..."

# Logos Nova Phénix
mv "Logo Nova Phenix Groupe.png" "logo-nova-phenix-groupe.png" 2>/dev/null
mv "Logo Nova Phenix Event.png" "logo-nova-phenix-events.png" 2>/dev/null
mv "Logo Nova Phenix Consulting.png" "logo-nova-phenix-consulting.png" 2>/dev/null
mv "Logo Nova Phenix Trade.png" "logo-nova-phenix-trade.png" 2>/dev/null
mv "Logo Nova Phenix Home.png" "logo-nova-phenix-home.png" 2>/dev/null
mv "Logo Nova Phenix Travel.png" "logo-nova-phenix-travel.png" 2>/dev/null

# Logos partenaires
mv "Dercavo logo.webp" "logo-dercavo.webp" 2>/dev/null
mv "Arizona logo.webp" "logo-arizona.webp" 2>/dev/null
mv "Biova logo.webp" "logo-biova.webp" 2>/dev/null
mv "El Kader plast logo.webp" "logo-elkader-plast.webp" 2>/dev/null
mv "Innovation way logo.webp" "logo-innovation-way.webp" 2>/dev/null
mv "Maison du savon logo.webp" "logo-maison-savon.webp" 2>/dev/null
mv "Maison du savon Logo.png" "logo-maison-savon-alt.png" 2>/dev/null
mv "Logo Eman Travel.jpg" "logo-eman-travel.jpg" 2>/dev/null
mv "Logo Medical.jpg" "logo-medical-tourism.jpg" 2>/dev/null
mv "Logo Innovation way consulting Canada.jpeg" "logo-innovation-way-canada.jpeg" 2>/dev/null
mv "Logo Innovation way consulting Medical.jpeg" "logo-innovation-way-medical.jpeg" 2>/dev/null

# Images spéciales
mv "Photo CEO.jpeg" "adel-chabane-ceo-fondateur.jpeg" 2>/dev/null
mv "Affiche Canada.png" "affiche-immigration-canada.png" 2>/dev/null
mv "hero-bg.png" "hero-background.png" 2>/dev/null

# ============================================
# GALERIE DERCAVO (aménagement intérieur)
# ============================================
echo "📁 Renommage de la galerie Dercavo..."

cd "Dercavo Réalisations" || exit 1

# Renommer tous les fichiers avec un compteur
for file in *.jpg *.jpeg *.png; do
    if [ -f "$file" ] && [[ ! "$file" == dercavo-* ]]; then
        ext="${file##*.}"
        printf -v newname "dercavo-realisation-%02d.%s" $count_dercavo "$ext"
        mv "$file" "$newname" 2>/dev/null && echo "  $file → $newname"
        count_dercavo+=1
    fi
done

cd ..

# ============================================
# GALERIE EVENTS
# ============================================
echo ""
echo "📁 Renommage de la galerie Events..."

cd "Image Event" || exit 1

# Images principales (hors sous-dossier)
for file in *.jpg *.jpeg *.png; do
    if [ -f "$file" ] && [[ ! "$file" == nova-phenix-event-* ]]; then
        ext="${file##*.}"
        printf -v newname "nova-phenix-event-%02d.%s" $count_event "$ext"
        mv "$file" "$newname" 2>/dev/null && echo "  $file → $newname"
        count_event+=1
    fi
done

# Sous-dossier Fii (salon FII)
if [ -d "Fii" ]; then
    cd "Fii"
    local_count=1
    for file in *.jpg *.jpeg *.png; do
        if [ -f "$file" ] && [[ ! "$file" == salon-fii-* ]]; then
            ext="${file##*.}"
            printf -v newname "salon-fii-%02d.%s" $local_count "$ext"
            mv "$file" "$newname" 2>/dev/null && echo "  Fii/$file → Fii/$newname"
            local_count=$((local_count + 1))
        fi
    done
    cd ..
fi

cd ..

# ============================================
# GALERIE HOME (rénovation)
# ============================================
echo ""
echo "📁 Renommage de la galerie Home..."

cd "Image Home" || exit 1

for file in *.jpg *.jpeg *.png; do
    if [ -f "$file" ] && [[ ! "$file" == nova-phenix-home-* ]]; then
        ext="${file##*.}"
        printf -v newname "nova-phenix-home-%02d.%s" $count_home "$ext"
        mv "$file" "$newname" 2>/dev/null && echo "  $file → $newname"
        count_home+=1
    fi
done

cd ..

# ============================================
# GALERIE TRAVEL
# ============================================
echo ""
echo "📁 Renommage de la galerie Travel..."

cd "Image Travel" || exit 1

mv "canada affiche.jpg" "affiche-voyage-canada.jpg" 2>/dev/null && echo "  canada affiche.jpg → affiche-voyage-canada.jpg"

cd ..

echo ""
echo "✅ Renommage terminé !"
echo ""
echo "⚠️  N'oubliez pas de mettre à jour les références dans index.html"
