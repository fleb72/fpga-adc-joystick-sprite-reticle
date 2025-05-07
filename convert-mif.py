from PIL import Image  # https://pypi.org/project/Pillow/
import os
import mif  # https://pypi.org/project/mif/
import numpy as np

# Définition des fichiers
image_source = 'viseur.jpg'  # Image source
mif_file = 'viseur.mif'  # Fichier de sortie .mif

# Définition des chemins
dir_path = os.path.dirname(os.path.abspath(__file__))
image_source = os.path.join(dir_path, image_source)
mif_file = os.path.join(dir_path, mif_file)

# Ouvrir l'image et la convertir en mode RGB
im = Image.open(image_source)
im = im.convert('RGB')
L, H = im.size  # Largeur et hauteur de l’image

tab = np.empty((0, 1), dtype=np.uint16)  # Tableau 2D vide

# Traitement des pixels
for y in range(H):
    for x in range(L):
        r, g, b = im.getpixel((x, y))

        # Conversion en 4 bits (division par 16)
        r_4bit = (r >> 4) & 0xF
        g_4bit = (g >> 4) & 0xF
        b_4bit = (b >> 4) & 0xF

        # Assemblage en une donnée 12 bits
        color_pixel = (r_4bit << 8) | (g_4bit << 4) | b_4bit

        # Ajout dans le tableau
        tab = np.append(tab, np.uint16([[color_pixel]]), axis=0)

# Conversion pour l'export MIF
mem = np.unpackbits(tab.view(np.uint8), axis=1, bitorder='little')

# Écriture du fichier .mif
fp = open(mif_file, 'w')
mif.dump(mem, fp, packed=False, width=12)

print(f"Fichier {mif_file} généré avec succès !")
