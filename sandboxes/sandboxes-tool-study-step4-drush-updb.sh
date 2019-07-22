#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.sandboxes.settings.yml);

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev test1";
echo "-----------------------------------------------------";
cd ${vdo_root}/sandboxes/varbase7test1/docroot/;
drush updb;

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev test2";
echo "-----------------------------------------------------";
cd ${vdo_root}/sandboxes/varbase7test2/docroot/;
drush updb;

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev test3";
echo "-----------------------------------------------------";
cd ${vdo_root}/sandboxes/varbase7test3/docroot/;
drush updb;

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev test4";
echo "-----------------------------------------------------";
cd ${vdo_root}/sandboxes/varbase7test4/docroot/;
drush updb;

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev test5";
echo "-----------------------------------------------------";
cd ${vdo_root}/sandboxes/varbase7test5/docroot/;
drush updb;
