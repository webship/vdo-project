#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Mandatory                                   |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/mandatory          |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

cd "${vdo_root}/${doc_name}"
composer create-project drupal/recommended-project:~9 mandatory --stability dev --no-interaction ;
cd "${vdo_root}/${doc_name}/mandatory" ;
composer config minimum-stability dev
composer require drupal/mandatory ;
cd "${vdo_root}/${doc_name}";

full_database_name="${database_prefix}mandatory";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
