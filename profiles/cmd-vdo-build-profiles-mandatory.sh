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
ddev composer create-project drupal/recommended-project:~9 mandatory --stability dev --no-interaction ;
cd "${vdo_root}/${doc_name}/mandatory" ;
ddev composer config minimum-stability dev
ddev composer require drupal/mandatory ;
cd "${vdo_root}/${doc_name}";


