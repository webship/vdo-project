#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Spectra Analytics Server                    |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/spectra_server     |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

drush dl spectra_server --drupal-project-rename=spectra_server;

full_database_name="${database_prefix}spectra_server";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
