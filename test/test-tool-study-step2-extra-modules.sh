#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev varbase8c1";
echo "-----------------------------------------------------";
cd ${vdo_root}/${doc_name}/varbase8c1;
composer require 'drupal/varbase_reports:6.x-dev' \
                  'drupal/varbase_media_header:7.x-dev' \
                  'vardot/varbase_vmi_demo:dev-8.x-8.x' \
                  'vardot/varbase_story_demo:dev-8.x-8.x' \
                  'drupal/varbase_faqs:6.x-dev' ;


echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev varbase8c2";
echo "-----------------------------------------------------";
cd ${vdo_root}/${doc_name}/varbase8c2;
composer require 'drupal/varbase_reports:6.x-dev' \
                  'drupal/varbase_media_header:7.x-dev' \
                  'vardot/varbase_vmi_demo:dev-8.x-8.x' \
                  'vardot/varbase_story_demo:dev-8.x-8.x' \
                  'drupal/varbase_faqs:6.x-dev' ;


echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev varbase8c3";
echo "-----------------------------------------------------";
cd ${vdo_root}/${doc_name}/varbase8c3;
composer require 'drupal/varbase_reports:6.x-dev' \
                  'drupal/varbase_media_header:7.x-dev' \
                  'vardot/varbase_vmi_demo:dev-8.x-8.x' \
                  'vardot/varbase_story_demo:dev-8.x-8.x' \
                  'drupal/varbase_faqs:6.x-dev' ;

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev varbase8c4";
echo "-----------------------------------------------------";
cd ${vdo_root}/${doc_name}/varbase8c4;
composer require 'drupal/varbase_reports:6.x-dev' \
                  'drupal/varbase_media_header:7.x-dev' \
                  'vardot/varbase_vmi_demo:dev-8.x-8.x' \
                  'vardot/varbase_story_demo:dev-8.x-8.x' \
                  'drupal/varbase_faqs:6.x-dev' ;


echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev varbase8c5";
echo "-----------------------------------------------------";
cd ${vdo_root}/${doc_name}/varbase8c5;
composer require 'drupal/varbase_reports:6.x-dev' \
                  'drupal/varbase_media_header:7.x-dev' \
                  'vardot/varbase_vmi_demo:dev-8.x-8.x' \
                  'vardot/varbase_story_demo:dev-8.x-8.x' \
                  'drupal/varbase_faqs:6.x-dev' ;



