#!/bin/usr/env bash

current_path=$(pwd);
user_name="$USER";

database_username="root";
database_host="localhost";
database_password="123___";

# Usefull must have utils.
apt install -y vim;
apt install -y links;
apt install -y lynx;
apt install -y git;
apt install -y diffutils;
apt install -y htop;
apt install -y curl;
apt install -y wget;
apt install -y p7zip-full;
apt install -y unzip;
apt install -y zip;
apt install -y sed;
apt install -y gcc;
apt install -y g++;
apt install -y make;
apt install -y python;
apt install -y python3;

# PHP
add-apt-repository ppa:ondrej/php ;
apt update;
apt install -y apache2;
apt install -y php7.4;
apt install -y libapache2-mod-php7.4;
apt install -y php7.4-mbstring;
apt install -y php7.4-mysql;
apt install -y php7.4-xml;
apt install -y php7.4-cgi;
apt install -y php7.4-cli;
apt install -y php7.4-common;
apt install -y php7.4-curl;
apt install -y php7.4-gd;
apt install -y php7.4-imap;
apt install -y php7.4-intl;
apt install -y php7.4-pspell;
apt install -y php7.4-sqlite3;
apt install -y php7.4-tidy;
apt install -y php7.4-opcache;
apt install -y php7.4-json;
apt install -y php7.4-bz2;
apt install -y php7.4-readline;
apt install -y php7.4-xmlrpc;
apt install -y php7.4-enchant;
apt install -y php7.4-xsl;
apt install -y php-all-dev;
apt install -y php7.4-zip;
apt install -y php7.4-bcmath;
apt install -y php-pear;

# Set the Apache2 enable mode to php7.4
a2enmod php7.4 ;
update-alternatives --set php /usr/bin/php7.4 ;
service apache2 restart ;

# Make sure important apache modules are enabled.
a2enmod headers rewrite env mime expires ssl;

# Change PHP variables.
echo 'max_execution_time = 1200' >> /etc/php/7.4/apache2/php.ini ;
echo 'max_input_time = 180' >> /etc/php/7.4/apache2/php.ini ;
echo 'max_input_vars = 10000' >> /etc/php/7.4/apache2/php.ini ;
echo 'memory_limit = -1' >> /etc/php/7.4/apache2/php.ini ;
echo 'error_reporting = E_ALL' >> /etc/php/7.4/apache2/php.ini ;
echo 'post_max_size = 64M' >> /etc/php/7.4/apache2/php.ini ;
echo 'upload_max_filesize = 32M' >> /etc/php/7.4/apache2/php.ini ;
echo 'max_file_uploads = 40' >> /etc/php/7.4/apache2/php.ini ;

service apache2 restart ;


# Set the virtual host.
sed -i -e 's/<\/VirtualHost>/\t<Directory \/var\/www\/html >\n\t\tOptions Indexes FollowSymLinks MultiViews\n\t\tAllowOverride All\n\t\tOrder allow,deny\n\t\tallow from all\n\t\tRequire all granted\n\t<\/Directory>\n<\/VirtualHost>/g' /etc/apache2/sites-available/000-default.conf ;

service apache2 restart ;

# Install node js;
curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -
apt install -y nodejs ;
apt install -y build-essential ;

# Install node npm.
# ------------------------------------------------------------------------------
curl -L https://npmjs.com/install.sh | sh ;

# Install LESS + grunt.
# ------------------------------------------------------------------------------
apt install -y npm ;
npm install -g less grunt grunt-cli ;

# Install Yarn as a global by npm.
# ------------------------------------------------------------------------------
npm install -g yarn

# Install Gulp : Helps compiling SASS to CSS.
# ------------------------------------------------------------------------------
npm install gulp-cli -g ;
npm install gulp -D ;

# Install composer ~2.0.
sudo curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin/ --filename=composer --2;

# Drush install latest (10.x).
# ------------------------------------------------------------------------------
git clone https://github.com/drush-ops/drush.git /usr/local/src/drush ;
cd /usr/local/src/drush ;
git checkout 10.3.6 ;
ln -s /usr/local/src/drush/drush /usr/bin/drush ;
composer install ;

# Install a global Drush via Composer.
composer global require drush/drush:~10 ;
export PATH="$HOME/.config/composer/vendor/bin:$PATH" ;

# Install Drupal Console.
# ------------------------------------------------------------------------------
cd ${current_path} ;

# Run this in your terminal to get the latest Console version:
curl https://drupalconsole.com/installer -L -o drupal.phar ;

# Or if you don't have curl:
php -r "readfile('https://drupalconsole.com/installer');" > drupal.phar ;

# Accessing from anywhere on your system:
mv drupal.phar /usr/local/bin/drupal ;

# Apply executable permissions on the downloaded file:
chmod +x /usr/local/bin/drupal ;

# Copy configuration files to user home directory.
drupal init [--override] ;
drupal self-update ;


# Install MySQL 8 server.
# ------------------------------------------------------------------------------
apt install mysql-client mysql-server ;

echo "[mysqld]" >> /etc/mysql/my.cnf
echo "default-authentication-plugin=mysql_native_password" >> /etc/mysql/my.cnf ;
echo "max_allowed_packet = 32M" >> /etc/mysql/my.cnf ;

# Restart MySQL service.
service mysql restart ;

# To change the password for root user.
sudo mysql -u ${database_username} -e "use mysql;SET PASSWORD FOR '${database_username}'@'${database_host}' = '${database_password}';update user set plugin=\"mysql_native_password\" where User='${database_username}';flush privileges;quit" ;

# Restart MySQL service.
service mysql restart ;
