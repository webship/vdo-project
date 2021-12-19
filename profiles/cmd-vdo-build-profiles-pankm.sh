#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build PanKM                                       |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/pankm              |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

drush dl pankm --drupal-project-rename=pankm;

full_database_name="${database_prefix}pankm";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
