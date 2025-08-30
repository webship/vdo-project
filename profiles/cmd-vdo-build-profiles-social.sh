#!/bin/usr/env bash

echo "*-------------------------------------------------*";
echo "| Build Open Social                               |";
echo "*-------------------------------------------------*";
echo "| From: https://www.drupal.org/project/social     |";
echo "*-------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

composer create-project goalgorilla/social_template:dev-master social --no-interaction;

full_database_name="${database_prefix}social";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"

