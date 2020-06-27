#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev varbase8c1";
echo "-----------------------------------------------------";
cd ${vdo_root}/${doc_name}/varbase8c1/docroot/;
drush updb;

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev varbase8c2";
echo "-----------------------------------------------------";
cd ${vdo_root}/${doc_name}/varbase8c2/docroot/;
drush updb;

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev varbase8c3";
echo "-----------------------------------------------------";
cd ${vdo_root}/${doc_name}/varbase8c3/docroot/;
drush updb;

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev varbase8c4";
echo "-----------------------------------------------------";
cd ${vdo_root}/${doc_name}/varbase8c4/docroot/;
drush updb;

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev varbase8c5";
echo "-----------------------------------------------------";
cd ${vdo_root}/${doc_name}/varbase8c5/docroot/;
drush updb;
