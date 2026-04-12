#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Crypto Distribution                         |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/crypto_distribution|";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev drush dl crypto_distribution --drupal-project-rename=crypto_distribution;


