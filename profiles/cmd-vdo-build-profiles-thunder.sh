#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Thunder                                     |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/thunder            |";
echo "*---------------------------------------------------*";


# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

composer create-project thunder/thunder-project thunder --no-interaction --no-install ;
cd ${vdo_root}/${doc_name}/thunder ;
composer install ;
composer drupal:scaffold ;
cd ${vdo_root}/${doc_name} ;

full_database_name="${database_prefix}thunder";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
