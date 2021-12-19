#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Thunder                                     |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/thunder            |";
echo "*---------------------------------------------------*";


# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

if [ -d "${vdo_root}/${doc_name}/thunder" ]; then
  sudo rm -rf ${vdo_root}/${doc_name}/thunder;
fi

composer create-project thunder/thunder-project thunder --no-interaction;

full_database_name="${database_prefix}thunder";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
