VARS :
* INSTALL_PKGS           : Paquets à installer (separe par une virgule)
* LOAD_MODULES_APACHE2   : Module à charger dans Apache2
* UNLOAD_MODULES_APACHE2 : Module à decharger d'Apache2
* LOAD_MODULES_PHP5      : Module à charger dans PHP5
* UNLOAD_MODULES_PHP5    : Module à decharger de PHP5

BUILD :
$ docker build -t gigi206/apache2_php5:v1 .

PULL :
$ docker pull gigi206/apache2_php5

RUN : (Mettez à jour votre fichier ENV)
$ docker run -d -p <myport>:80 -p <myport>:443 -v $PWD/App/sites-enabled:/etc/apache2/sites-enabled -v $PWD/App/log:/var/log/apache -v $PWD/App/www:/var/www --name <container_name> --env-file ENV gigi206/apache2_php5:v1

MOUNT :
* App/log           : logs Apache2
* App/sites-enabled : vhosts
* App/www           : Répertoire des applications

GITHUB clone :
git init
git remote add -f origin https://github.com/gigi206/docker/
git config core.sparsecheckout true
echo "Dockerfile/apache_php/*" >> .git/info/sparse-checkout
git pull origin master
