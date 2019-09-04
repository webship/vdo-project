#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Mandatory                                   |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/mandatory          |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

cd "${vdo_root}/${doc_name}"
composer create-project drupal-composer/drupal-project:8.x-dev mandatory --stability dev --no-interaction
cd mandatory
composer require drupal/mandatory ;
cd "${vdo_root}/${doc_name}";

full_database_name="${database_prefix}mandatory";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
