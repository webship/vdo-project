#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev test1";
echo "-----------------------------------------------------";
cd ${vdo_root}/test/varbase7test1;
composer require 'drupal/varbase_faqs:~6.0' \
'drupal/varbase_reports:~6.0' \
'drupal/varbase_media_header:7.x-dev' \
'vardot/varbase_vmi_demo:dev-8.x-7.x' \
'vardot/varbase_story_demo:dev-8.x-7.x' \
'drupal/claro:~1.0' \
'drupal/image_sizes:~1.0' \
'drupal/entity_reference_layout:~1.0' \
'drupal/paragraphs_ee:~1.0' \
'drupal/paragraphs_sets:~2.0';


echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev test2";
echo "-----------------------------------------------------";
cd ${vdo_root}/test/varbase7test2;
composer require 'drupal/varbase_faqs:~6.0' \
'drupal/varbase_reports:~6.0' \
'drupal/varbase_media_header:7.x-dev' \
'vardot/varbase_vmi_demo:dev-8.x-7.x' \
'vardot/varbase_story_demo:dev-8.x-7.x' \
'drupal/claro:~1.0' \
'drupal/image_sizes:~1.0' \
'drupal/entity_reference_layout:~1.0' \
'drupal/paragraphs_ee:~1.0' \
'drupal/paragraphs_sets:~2.0';


echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev test3";
echo "-----------------------------------------------------";
cd ${vdo_root}/test/varbase7test3;
composer require 'drupal/varbase_faqs:~6.0' \
'drupal/varbase_reports:~6.0' \
'drupal/varbase_media_header:7.x-dev' \
'vardot/varbase_vmi_demo:dev-8.x-7.x' \
'vardot/varbase_story_demo:dev-8.x-7.x' \
'drupal/claro:~1.0' \
'drupal/image_sizes:~1.0' \
'drupal/entity_reference_layout:~1.0' \
'drupal/paragraphs_ee:~1.0' \
'drupal/paragraphs_sets:~2.0';

echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev test4";
echo "-----------------------------------------------------";
cd ${vdo_root}/test/varbase7test4;
composer require 'drupal/varbase_faqs:~6.0' \
'drupal/varbase_reports:~6.0' \
'drupal/varbase_media_header:7.x-dev' \
'vardot/varbase_vmi_demo:dev-8.x-7.x' \
'vardot/varbase_story_demo:dev-8.x-7.x' \
'drupal/claro:~1.0' 'drupal/image_sizes:~1.0' \
'drupal/entity_reference_layout:~1.0' \
'drupal/paragraphs_ee:~1.0' \
'drupal/paragraphs_sets:~2.0';


echo "-----------------------------------------------------";
echo "Varbase 8.x-7.x-dev test5";
echo "-----------------------------------------------------";
cd ${vdo_root}/test/varbase7test5;
composer require 'drupal/varbase_faqs:~6.0' \
'drupal/varbase_reports:~6.0' \
'drupal/varbase_media_header:7.x-dev' \
'vardot/varbase_vmi_demo:dev-8.x-7.x' \
'vardot/varbase_story_demo:dev-8.x-7.x' \
'drupal/claro:~1.0' \
'drupal/image_sizes:~1.0' \
'drupal/entity_reference_layout:~1.0' \
'drupal/paragraphs_ee:~1.0' \
'drupal/paragraphs_sets:~2.0';



