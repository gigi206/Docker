VARS :
* INSTALL_PKGS           : Paquets a installer (separe par une virgule)
* LOAD_MODULES_APACHE2   : Module a charger dans Apache2
* UNLOAD_MODULES_APACHE2 : Module a decharger d'Apache2
* LOAD_MODULES_PHP5      : Module a charger dans PHP5
* UNLOAD_MODULES_PHP5    : Module a decharger de PHP5

BUILD :
$ docker build -t gigi206/apache2_php5:v1 .

PULL :
$ docker pull gigi206/apache2_php5

RUN :
$ docker run -d -p <myport>:80 -p <myport>:443 -v $PWD/App/sites-enabled:/etc/apache2/sites-enabled -v $PWD/App/log:/var/log/apache -v $PWD/App/www:/var/www--name <container_name> --env-file ENV gigi206/apache2_php5:v1

MOUNT :
* App/log           : logs Apache2
* App/sites-enabled : vhosts
* App/www           : Repertoire des applications
