#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Opigno LMS                                  |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/opigno_lms         |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev composer create-project opigno/opigno-composer opigno_lms --no-interaction;


