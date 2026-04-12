#!/bin/usr/env bash

echo "*-----------------------------------------------------------*";
echo "|  Build Drupal template                                    |";
echo "*-----------------------------------------------------------*";

current_path=$(pwd);

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.themes.settings.yml);

cd ${vdo_root}/themes/ ;

rm -rf ${vdo_root}/themes/${vdo_drupal_template_drupal_theme_name} ;
ddev composer create-project drupal/recommended-project:~9.0 ${vdo_drupal_template_drupal_theme_name} --stability dev --no-interaction ;


