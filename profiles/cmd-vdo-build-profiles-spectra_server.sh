#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Spectra Analytics Server                    |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/spectra_server     |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev drush dl spectra_server --drupal-project-rename=spectra_server;


