#!/bin/usr/env bash

echo '*--------------------------------------------------*';
echo '*   Install VDO default configs                    *';
echo '*--------------------------------------------------*';

echo ' ' >> $HOME/.bashrc ;
echo '# *--------------------------------------------------*' >> $HOME/.bashrc ;
echo '# *  VDO default configs                             *' >> $HOME/.bashrc ;
echo '# *--------------------------------------------------*' >> $HOME/.bashrc ;


echo 'VDO Root working HTML';
echo '# VDO Root working HTML'>> $HOME/.bashrc ;
vdo_root="/var/www/html";
export vdo_root="/var/www/html" ;
echo 'export vdo_root="/var/www/html";' >> $HOME/.bashrc  ;
echo 'vdo_root="/var/www/html";' >> $HOME/.bashrc  ;

echo 'VDO path where we keep all Configs and scripts';
echo '# VDO path where we keep all Configs and scripts'>> $HOME/.bashrc ;
vdo_path="/var/www/html/vdo" ;
export vdo_path="/var/www/html/vdo" ;
echo 'vdo_path="/var/www/html/vdo";' >> $HOME/.bashrc ;
echo 'export vdo_path="/var/www/html/vdo";' >> $HOME/.bashrc ;

echo 'VDO Scripts';
echo '# VDO Scripts'>> $HOME/.bashrc ;
vdo_scripts="/var/www/html/vdo/scripts" ;
export vdo_scripts="/var/www/html/vdo/scripts" ;
echo 'vdo_scripts="/var/www/html/vdo/scripts";' >> $HOME/.bashrc ;
echo 'export vdo_scripts="/var/www/html/vdo/scripts";' >> $HOME/.bashrc ;

echo 'VDO Configs';
echo '# VDO Configs'>> $HOME/.bashrc ;
vdo_config="/var/www/html/vdo/config" ;
export vdo_config="/var/www/html/vdo/config" ;
echo 'vdo_config="/var/www/html/vdo/config";' >> $HOME/.bashrc ;
echo 'export vdo_config="/var/www/html/vdo/config";' >> $HOME/.bashrc ;

echo 'VDO Database username';
echo '# VDO Database username'>> $HOME/.bashrc ;
database_username="DATABASE_USERNAME" ;
export database_username="DATABASE_USERNAME" ;
echo 'database_username="DATABASE_USERNAME";' >> $HOME/.bashrc ;
echo 'export database_username="DATABASE_USERNAME";' >> $HOME/.bashrc ;

echo 'VDO Database password';
echo '# VDO Database password'>> $HOME/.bashrc ;
database_password="DATABASE_PASSWORD" ;
export database_password="DATABASE_PASSWORD" ;
echo 'database_password="DATABASE_PASSWORD";' >> $HOME/.bashrc ;
echo 'export database_password="DATABASE_PASSWORD";' >> $HOME/.bashrc ;

echo 'VDO Database host';
echo '# VDO Database host'>> $HOME/.bashrc ;
database_host="DATABASE_HOST" ;
export database_host="DATABASE_HOST" ;
echo 'database_host="DATABASE_HOST";' >> $HOME/.bashrc ;
echo 'export database_host="DATABASE_HOST";' >> $HOME/.bashrc ;

echo 'VDO account name';
echo '# VDO account name'>> $HOME/.bashrc ;
account_name="DRUPAL_WEBMASTER_NAME" ;
export account_name="DRUPAL_WEBMASTER_NAME" ;
echo 'account_name="DRUPAL_WEBMASTER_NAME";' >> $HOME/.bashrc ;
echo 'export account_name="DRUPAL_WEBMASTER_NAME";' >> $HOME/.bashrc ;

echo 'VDO account pass';
echo '# VDO account pass'>> $HOME/.bashrc ;
account_pass="DRUPAL_WEBMASTER_PASSWORD" ;
export account_pass="DRUPAL_WEBMASTER_PASSWORD" ;
echo 'account_pass="DRUPAL_WEBMASTER_PASSWORD";' >> $HOME/.bashrc ;
echo 'export account_pass="DRUPAL_WEBMASTER_PASSWORD";' >> $HOME/.bashrc ;

echo 'VDO account mail';
echo '# VDO account mail'>> $HOME/.bashrc ;
account_mail="DRUPAL_WEBMASTER_EMIL" ;
export account_mail="DRUPAL_WEBMASTER_EMIL" ;
echo 'account_mail="DRUPAL_WEBMASTER_EMIL";' >> $HOME/.bashrc ;
echo 'export account_mail="DRUPAL_WEBMASTER_EMIL";' >> $HOME/.bashrc ;
