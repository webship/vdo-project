#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.sandboxes.settings.yml);

echo "-----------------------------------------------------";
echo "Test start studay";
echo "-----------------------------------------------------";

cd ${vdo_backups}/${doc_name}/;

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev test1";
echo "-----------------------------------------------------";
bash cmd-vdo-varbase7-project-composer.sh varbase7test1;

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev test2";
echo "-----------------------------------------------------";
bash cmd-vdo-varbase7-project-composer.sh varbase7test2;

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev test3";
echo "-----------------------------------------------------";
bash cmd-vdo-varbase7-project-composer.sh varbase7test3;

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev test4";
echo "-----------------------------------------------------";
bash cmd-vdo-varbase7-project-composer.sh varbase7test4;

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev test5";
echo "-----------------------------------------------------";
bash cmd-vdo-varbase7-project-composer.sh varbase7test5;
