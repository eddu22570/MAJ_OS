# Auteur: Elvis DELORMEAU
# Titre: MAJ_OS.sh
# Description: Ce script met à jour un OS de type Linux et désinstalle les packages obsolètes.
# Date de création: 22/09/2024
# Version v1

#!/bin/bash

# Script de mise à jour automatique

# Mettre à jour la liste des paquets
apt update

# Mettre à jour les paquets installés
apt upgrade -y

# Nettoyer les paquets obsolètes
apt autoremove -y

# Nettoyer le cache
apt clean

# Redémarrer si nécessaire
if [ -f /var/run/reboot-required ]; then
  reboot
fi

# Enregistrer un log de la mise à jour
echo "Mise à jour effectuée le $(date)" >> /var/log/auto-update.log