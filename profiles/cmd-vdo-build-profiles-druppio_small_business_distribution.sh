#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Druppio small business distribution         |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/druppio_small_business_distribution |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

drush dl druppio_small_business_distribution --drupal-project-rename=druppio_small_business_distribution;

full_database_name="${database_prefix}druppio_small_business_distribution";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
