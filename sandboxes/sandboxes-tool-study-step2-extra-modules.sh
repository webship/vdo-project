#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.sandboxes.settings.yml);

echo "-----------------------------------------------------";
echo "Varbase 8.x-8.x-dev varbase8c1";
echo "-----------------------------------------------------";
cd ${vdo_backups}/${doc_name}/varbase8c1;
composer require 'drupal/varbase_faqs:~6.0' \
'drupal/varbase_reports:~6.0' \
'drupal/varbase_media_header:7.x-dev' \
'vardot/varbase_vmi_demo:dev-8.x-8.x' \
'vardot/varbase_story_demo:dev-8.x-8.x';


echo "-----------------------------------------------------";
echo "Varbase 8.x-8.x-dev varbase8c2";
echo "-----------------------------------------------------";
cd ${vdo_backups}/${doc_name}/varbase8c2;
composer require 'drupal/varbase_faqs:~6.0' \
'drupal/varbase_reports:~6.0' \
'drupal/varbase_media_header:7.x-dev' \
'vardot/varbase_vmi_demo:dev-8.x-8.x' \
'vardot/varbase_story_demo:dev-8.x-8.x';


echo "-----------------------------------------------------";
echo "Varbase 8.x-8.x-dev varbase8c3";
echo "-----------------------------------------------------";
cd ${vdo_backups}/${doc_name}/varbase8c3;
composer require 'drupal/varbase_faqs:~6.0' \
'drupal/varbase_reports:~6.0' \
'drupal/varbase_media_header:7.x-dev' \
'vardot/varbase_vmi_demo:dev-8.x-8.x' \
'vardot/varbase_story_demo:dev-8.x-8.x';

echo "-----------------------------------------------------";
echo "Varbase 8.x-8.x-dev varbase8c4";
echo "-----------------------------------------------------";
cd ${vdo_backups}/${doc_name}/varbase8c4;
composer require 'drupal/varbase_faqs:~6.0' \
'drupal/varbase_reports:~6.0' \
'drupal/varbase_media_header:7.x-dev' \
'vardot/varbase_vmi_demo:dev-8.x-8.x' \
'vardot/varbase_story_demo:dev-8.x-8.x';


echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev varbase8c5";
echo "-----------------------------------------------------";
cd ${vdo_backups}/${doc_name}/varbase8c5;
composer require 'drupal/varbase_faqs:~6.0' \
'drupal/varbase_reports:~6.0' \
'drupal/varbase_media_header:7.x-dev' \
'vardot/varbase_vmi_demo:dev-8.x-8.x' \
'vardot/varbase_story_demo:dev-8.x-8.x';
