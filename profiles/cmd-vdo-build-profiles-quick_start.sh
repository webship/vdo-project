#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Quick Start                                 |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/quick_start        |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);


ddev composer create-project drupalcoders/quick_start_distribution:dev-master quick_start --no-dev --no-interaction --prefer-dist;



