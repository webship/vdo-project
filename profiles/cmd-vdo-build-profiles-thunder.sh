#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Thunder                                     |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/thunder            |";
echo "*---------------------------------------------------*";


# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

if [ -d "${vdo_root}/${doc_name}/thunder" ]; then
  rm -rf ${vdo_root}/${doc_name}/thunder;
fi

ddev composer create-project thunder/thunder-project thunder --no-interaction;


