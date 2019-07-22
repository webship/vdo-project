#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.dev.settings.yml);

sudo rm -rf drupal -v ;
composer create-project drupal/drupal -v ;
cd drupal;
sudo chmod 775 -R .;sudo chown www-data:$USER -R .;
composer require drupal/varbase_reports:6.x-dev ;
composer require drupal/devel ;
composer require drupal/features ;
sudo chmod 775 -R .;sudo chown www-data:$USER -R .;
