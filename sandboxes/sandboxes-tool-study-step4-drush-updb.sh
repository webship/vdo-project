#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.sandboxes.settings.yml);

echo "-----------------------------------------------------";
echo "Varbase 8.x-8.x-dev varbase8c1";
echo "-----------------------------------------------------";
cd ${vdo_backups}/${doc_name}/varbase8c1/docroot/;
drush updb;

echo "-----------------------------------------------------";
echo "Varbase 8.x-8.x-dev varbase8c2";
echo "-----------------------------------------------------";
cd ${vdo_backups}/${doc_name}/varbase8c2/docroot/;
drush updb;

echo "-----------------------------------------------------";
echo "Varbase 8.x-8.x-dev varbase8c3";
echo "-----------------------------------------------------";
cd ${vdo_backups}/${doc_name}/varbase8c3/docroot/;
drush updb;

echo "-----------------------------------------------------";
echo "Varbase 8.x-8.x-dev varbase8c4";
echo "-----------------------------------------------------";
cd ${vdo_backups}/${doc_name}/varbase8c4/docroot/;
drush updb;

echo "-----------------------------------------------------";
echo "Varbase 8.x-8.x-dev varbase8c5";
echo "-----------------------------------------------------";
cd ${vdo_backups}/${doc_name}/varbase8c5/docroot/;
drush updb;
