#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

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
echo "| Build ${theme_name}";
echo "*-----------------------------------------------------------*";

cp -r ${vdo_drupal_template_drupal_theme_name} ${vdo_root}/themes/${theme_name} ;
cd ${vdo_root}/themes/${theme_name} ;
composer require drupal/${theme_name} ;
