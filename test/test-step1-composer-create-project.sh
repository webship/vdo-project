#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

echo "*-----------------------------------------------------*";
echo "| Test Step1 composer create-project for all Varbase versions";
echo "*-----------------------------------------------------*";

echo "*-----------------------------------------------------*";
echo "| Delete test Varbase folders";
echo "*-----------------------------------------------------*";

sudo rm -rf ${vdo_root}/${doc_name}/v80700 ;

sudo rm -rf ${vdo_root}/${doc_name}/v80612 ;
sudo rm -rf ${vdo_root}/${doc_name}/v80611 ;
sudo rm -rf ${vdo_root}/${doc_name}/v80610 ;
sudo rm -rf ${vdo_root}/${doc_name}/v80609 ;
sudo rm -rf ${vdo_root}/${doc_name}/v80609 ;
sudo rm -rf ${vdo_root}/${doc_name}/v80608 ;
sudo rm -rf ${vdo_root}/${doc_name}/v80607 ;
sudo rm -rf ${vdo_root}/${doc_name}/v80606 ;
sudo rm -rf ${vdo_root}/${doc_name}/v80605 ;
sudo rm -rf ${vdo_root}/${doc_name}/v80604 ;
sudo rm -rf ${vdo_root}/${doc_name}/v80603 ;
sudo rm -rf ${vdo_root}/${doc_name}/v80602 ;
sudo rm -rf ${vdo_root}/${doc_name}/v80601 ;
sudo rm -rf ${vdo_root}/${doc_name}/v80600 ;
sudo rm -rf ${vdo_root}/${doc_name}/v80505 ;
sudo rm -rf ${vdo_root}/${doc_name}/v80428 ;

cd ${vdo_root}/test;

# echo "*-----------------------------------------------------*";
# echo "| Varbase VERSION";
# echo "*-----------------------------------------------------*";
# composer create-project vardot/varbase-project:VERSION vVERSION_CODE;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.7.0";
echo "*-----------------------------------------------------*";
composer create-project vardot/varbase-project:8.7.0 v80700;


echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.12";
echo "*-----------------------------------------------------*";
composer create-project vardot/varbase-project:8.6.12 v80612;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.11";
echo "*-----------------------------------------------------*";
composer create-project vardot/varbase-project:8.6.11 v80611;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.10";
echo "*-----------------------------------------------------*";
composer create-project vardot/varbase-project:8.6.10 v80610;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.9";
echo "*-----------------------------------------------------*";
composer create-project vardot/varbase-project:8.6.9 v80609;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.8";
echo "*-----------------------------------------------------*";
composer create-project vardot/varbase-project:8.6.8 v80608;

echo "| Varbase 8.6.7";
echo "*-----------------------------------------------------*";
composer create-project vardot/varbase-project:8.6.7 v80607;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.6";
echo "*-----------------------------------------------------*";
composer create-project vardot/varbase-project:8.6.6 v80606;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.5";
echo "*-----------------------------------------------------*";
composer create-project vardot/varbase-project:8.6.5 v80605;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.4";
echo "*-----------------------------------------------------*";
composer create-project vardot/varbase-project:8.6.4 v80604;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.3";
echo "*-----------------------------------------------------*";
composer create-project vardot/varbase-project:8.6.3 v80603;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.2";
echo "*-----------------------------------------------------*";
composer create-project vardot/varbase-project:8.6.2 v80602;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.1";
echo "*-----------------------------------------------------*";
composer create-project vardot/varbase-project:8.6.1 v80601;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.0";
echo "*-----------------------------------------------------*";
composer create-project vardot/varbase-project:8.6.0 v80600;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.5.5";
echo "*-----------------------------------------------------*";
composer create-project vardot/varbase-project:8.5.5 v80505;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.4.28";
echo "*-----------------------------------------------------*";
composer create-project vardot/varbase-project:8.4.28 v80428;

cd ${vdo_root}/test;
sudo chmod 775 -R .;sudo chown www-data:${USER} -R .;

echo "*-----------------------------------------------------*";
echo " Done : Test Step1 composer create-project for all Varbase versions";
echo "*-----------------------------------------------------*";
