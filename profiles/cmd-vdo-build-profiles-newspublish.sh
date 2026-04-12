#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Newspublish                                 |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/newspublish        |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev drush dl newspublish --drupal-project-rename=newspublish;


