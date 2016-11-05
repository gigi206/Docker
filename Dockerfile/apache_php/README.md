# APACHE2 + PHP5

## VARS :
* **APACHE2_START_ARG      :** Arguments pour le daemon Apache2
* **INSTALL_PKGS           :** Paquets à installer (separés par une virgule)
* **LOAD_MODULES_APACHE2   :** Module à charger dans Apache2 (separés par une virgule)
* **UNLOAD_MODULES_APACHE2 :** Module à decharger d'Apache2 (separés par une virgule)
* **LOAD_MODULES_PHP5      :** Module à charger dans PHP5 (separés par une virgule)
* **UNLOAD_MODULES_PHP5    :** Module à decharger de PHP5 (separés par une virgule)

## BUILD :
Si vous souhaitez construire votre image à partir des sources :
```
$ docker build -t gigi206/apache2_php5:v1 .
```

## PULL :
Si vous souhaitez télécharger l'image à partir du Docker HUB :
```
$ docker pull gigi206/apache2_php5
```

## RUN :
Exemple pour lancer son conteneur (penser à mettre à jour votre fichier **ENV**) :
```
$ docker run -d -p <myport>:80 -p <myport>:443 -v $PWD/App/sites-enabled:/etc/apache2/sites-enabled -v $PWD/App/log:/var/log/apache -v $PWD/App/www:/var/www --name <container_name> --env-file ENV gigi206/apache2_php5
```

Si vous montez les répertoires comme dans l'exemple ci-dessus :
* **App/log           :** logs Apache2
* **App/sites-enabled :** vhosts Apache2
* **App/www           :** Répertoire des applications

## UPDATES :
Supprimer le fichier */etc/update-startup* pour désactiver les mises à jour automatiques au boot du conteneur.

## GITHUB clone :
Si vous souhaitez cloner à partir de github :
```
git init
git remote add -f origin https://github.com/gigi206/docker/
git config core.sparsecheckout true
echo "Dockerfile/apache_php/*" >> .git/info/sparse-checkout
git pull origin master
```
