#!/bin/usr/env bash

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.themes.settings.yml);

# GET the project name argument.
if [ "$1" != "" ]; then
    theme_name=$1;
else
  echo "Please add the name of your theme.";
  exit 1;
fi

echo "*-----------------------------------------------------------*";
echo "| Install ${theme_name}";
echo "*-----------------------------------------------------------*";

full_database_name="${database_prefix}${theme_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

cd "${vdo_root}/themes/${theme_name}/web";

drush site-install standard --yes \
--site-name="Theme ${theme_name}" \
--account-name="${account_name}" \
--account-pass="${account_pass}" \
--account-mail="${account_mail}" \
--db-url="mysql://${database_username}:${database_password}@${database_host}/${full_database_name}" ;

drush config-set system.performance css.preprocess 0 --yes ;
drush config-set system.performance js.preprocess 0 --yes ;
drush config-set system.logging error_level all --yes ;
drush cr ;

drush theme-enable ${theme_name} ;
drush config-set system.theme default ${theme_name} --yes ;
drush config-set system.theme admin seven --yes ;




