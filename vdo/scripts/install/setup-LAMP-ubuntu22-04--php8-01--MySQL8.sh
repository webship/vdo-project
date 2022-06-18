#!/bin/usr/env bash

current_path=$(pwd);
user_name="$USER";

database_username="root";
database_host="localhost";
database_password="123___";

# Usefull must have utils.
sudo apt install -y vim;
sudo apt install -y links;
sudo apt install -y lynx;
sudo apt install -y git;
sudo apt install -y diffutils;
sudo apt install -y htop;
sudo apt install -y curl;
sudo apt install -y wget;
sudo apt install -y p7zip-full;
sudo apt install -y unzip;
sudo apt install -y zip;
sudo apt install -y sed;
sudo apt install -y gcc;
sudo apt install -y g++;
sudo apt install -y make;
sudo apt install -y python3;
sudo apt install -y python-is-python3;

# PHP
sudo add-apt-repository ppa:ondrej/php ;
sudo apt update;
sudo apt install -y apache2;
sudo apt install -y php8.1;
sudo apt install -y libapache2-mod-php8.1;
sudo apt install -y php8.1-mbstring;
sudo apt install -y php8.1-mysql;
sudo apt install -y php8.1-xml;
sudo apt install -y php8.1-cgi;
sudo apt install -y php8.1-cli;
sudo apt install -y php8.1-common;
sudo apt install -y php8.1-curl;
sudo apt install -y php8.1-gd;
sudo apt install -y php8.1-imap;
sudo apt install -y php8.1-intl;
sudo apt install -y php8.1-pspell;
sudo apt install -y php8.1-sqlite3;
sudo apt install -y php8.1-tidy;
sudo apt install -y php8.1-opcache;
sudo apt install -y php8.1-json;
sudo apt install -y php8.1-bz2;
sudo apt install -y php8.1-readline;
sudo apt install -y php8.1-xmlrpc;
sudo apt install -y php8.1-enchant;
sudo apt install -y php8.1-xsl;
sudo apt install -y php8.1-zip;
sudo apt install -y php8.1-bcmath;
sudo apt install -y php-pear;

# Set the Apache2 enable mode to php8.1
sudo a2enmod php8.1 ;
sudo update-alternatives --set php /usr/bin/php8.1 ;
sudo service apache2 restart ;

# Make sure important apache modules are enabled.
sudo a2enmod headers rewrite env mime expires ssl;

# Change PHP variables.
sudo echo 'max_execution_time = 1200' >> /etc/php/8.1/apache2/php.ini ;
sudo echo 'max_input_time = 180' >> /etc/php/8.1/apache2/php.ini ;
sudo echo 'max_input_vars = 10000' >> /etc/php/8.1/apache2/php.ini ;
sudo echo 'memory_limit = -1' >> /etc/php/8.1/apache2/php.ini ;
sudo echo 'error_reporting = E_ALL' >> /etc/php/8.1/apache2/php.ini ;
sudo echo 'post_max_size = 64M' >> /etc/php/8.1/apache2/php.ini ;
sudo echo 'upload_max_filesize = 32M' >> /etc/php/8.1/apache2/php.ini ;
sudo echo 'max_file_uploads = 40' >> /etc/php/8.1/apache2/php.ini ;

sudo service apache2 restart ;


# Set the virtual host.
sudo sed -i -e 's/<\/VirtualHost>/\t<Directory \/var\/www\/html >\n\t\tOptions Indexes FollowSymLinks MultiViews\n\t\tAllowOverride All\n\t\tOrder allow,deny\n\t\tallow from all\n\t\tRequire all granted\n\t<\/Directory>\n<\/VirtualHost>/g' /etc/apache2/sites-available/000-default.conf ;

sudo service apache2 restart ;

# Install node js;
curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -
sudo apt update
sudo apt install -y nodejs ;
sudo apt install -y build-essential ;

# Install node npm.
# ------------------------------------------------------------------------------
curl -L https://npmjs.com/install.sh | sudo -E bash -
sudo apt update
sudo apt install npm

# Install Yarn as a global by npm.
# ------------------------------------------------------------------------------
sudo npm install -g yarn

# Install Gulp : Helps compiling SASS to CSS.
# ------------------------------------------------------------------------------
sudo npm install gulp-cli -g ;
sudo npm install gulp -D ;

# Install composer ~2.0.
sudo curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin/ --filename=composer --2;

# Drush install latest (11.x).
# ------------------------------------------------------------------------------
sudo git clone https://github.com/drush-ops/drush.git /usr/local/src/drush ;
cd /usr/local/src/drush ;
git checkout 11.0.4 ;
sudo ln -s /usr/local/src/drush/drush /usr/bin/drush ;
sudo composer install ;

# Install a global Drush via Composer.
sudo composer global require drush/drush:~11.0 ;
sudo export PATH="$HOME/.config/composer/vendor/bin:$PATH" ;

# Install MySQL 8 server.
# ------------------------------------------------------------------------------
sudo apt install mysql-client mysql-server ;

sudo echo "[mysqld]" >> /etc/mysql/my.cnf
sudo echo "default-authentication-plugin=mysql_native_password" >> /etc/mysql/my.cnf ;
sudo echo "max_allowed_packet = 32M" >> /etc/mysql/my.cnf ;

# Restart MySQL service.
sudo service mysql restart ;


# Change the Password for the Root MySQL User.
sudo mysql -u root
use mysql;
SET PASSWORD FOR 'root'@'localhost' = '123___';
update user set plugin="mysql_native_password" where User='root';
flush privileges;
quit;

# Restart MySQL service.
sudo service mysql restart ;

# In case of facing issues with 'root'@'localhost' login in the terminal or when Drupal is connecting to the MySQL database
# Set the better MySQL native password by
sudo mysql_secure_installation

# Do not change the old password from the last step, If the command asks to change the password.
