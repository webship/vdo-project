#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev test1";
echo "-----------------------------------------------------";
cd ${vdo_root}/test/varbase7test1;
composer update  ;

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev test2";
echo "-----------------------------------------------------";
cd ${vdo_root}/test/varbase7test2;
composer update  ;

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev test3";
echo "-----------------------------------------------------";
cd ${vdo_root}/test/varbase7test3;
composer update ;

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev test4";
echo "-----------------------------------------------------";
cd ${vdo_root}/test/varbase7test4;
composer update ;

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev test5";
echo "-----------------------------------------------------";
cd ${vdo_root}/test/varbase7test5;
composer update ;
