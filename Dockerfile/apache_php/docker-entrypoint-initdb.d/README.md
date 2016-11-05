# Script lancés au démarrage du conteneur
Ces scripts sont intégrés au moment du **docker build**. Vous pouvez en ajouter un à tout moment avec **docker cp**.

## 000-update.sh
Ce script met à jour l'OS au démarrage du contenur si le fichier **_/etc/update-startup__** est présent. Vous pouvez le supprimer pour ne pas mettre à jour votre conteneur lors de son lancement.

## 001-pkgs.sh
Installe les paquets spécifiés par la variable **_INSTALL_PKGS_** du fichier **ENV**.

## 002-modules-apache2.sh
Configure les modules **Apache2** spécifiés par les variables **_LOAD_MODULES_APACHE2_** et **_UNLOAD_MODULES_APACHE2_** du fichier **ENV**.

## 003-modules-php5.sh
Configure les modules **PHP5** spécifiés par les variables **_LOAD_MODULES_PHP5_** et **_UNLOAD_MODULES_PHP5_** du fichier **ENV**.
