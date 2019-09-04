#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build agov                                        |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/agov               |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

composer create-project drupal/drupal:* agov --stability dev --no-interaction
cd ${vdo_root}/${doc_name}/agov ;
composer require previousnext/agov:dev-8.x-2.x ;

cd ${vdo_root}/${doc_name} ;
full_database_name="${database_prefix}agov";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
