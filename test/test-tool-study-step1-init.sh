#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

echo "-----------------------------------------------------";
echo "Test start studay";
echo "-----------------------------------------------------";

cd ${vdo_root}/${doc_name}/;

echo "-----------------------------------------------------";
echo "Varbase 8.x-8.x-dev varbase8c1";
echo "-----------------------------------------------------";
bash cmd-vdo-varbase8-project.sh varbase8c1;

echo "-----------------------------------------------------";
echo "Varbase 8.x-8.x-dev varbase8c2";
echo "-----------------------------------------------------";
bash cmd-vdo-varbase8-project.sh varbase8c2;

echo "-----------------------------------------------------";
echo "Varbase 8.x-8.x-dev varbase8c3";
echo "-----------------------------------------------------";
bash cmd-vdo-varbase8-project.sh varbase8c3;

echo "-----------------------------------------------------";
echo "Varbase 8.x-8.x-dev varbase8c4";
echo "-----------------------------------------------------";
bash cmd-vdo-varbase8-project.sh varbase8c4;

echo "-----------------------------------------------------";
echo "Varbase 8.x-8.x-dev varbase8c5";
echo "-----------------------------------------------------";
bash cmd-vdo-varbase8-project.sh varbase8c5;
