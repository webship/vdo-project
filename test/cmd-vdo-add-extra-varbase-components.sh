#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);


cd ${vdo_root}/${doc_name}/varbase80600;
composer require drupal/varbase_faqs:~6.0 \
                 drupal/varbase_reports:~6.0 \
                 drupal/varbase_media_header:~6.0 \
                 vardot/varbase_vmi_demo:dev-8.x-6.x \
                 vardot/varbase_story_demo:dev-8.x-6.x ;

cd ${vdo_root}/${doc_name}/varbase80601;
composer require drupal/varbase_faqs:~6.0 \
                 drupal/varbase_reports:~6.0 \
                 drupal/varbase_media_header:~6.0 \
                 vardot/varbase_vmi_demo:dev-8.x-6.x \
                 vardot/varbase_story_demo:dev-8.x-6.x;

cd ${vdo_root}/${doc_name}/varbase80602;
composer require drupal/varbase_faqs:~6.0 \
                 drupal/varbase_reports:~6.0 \
                 drupal/varbase_media_header:~6.0 \
                 vardot/varbase_vmi_demo:dev-8.x-6.x \
                 vardot/varbase_story_demo:dev-8.x-6.x;

cd ${vdo_root}/${doc_name}/varbase80603;
composer require drupal/varbase_faqs:~6.0 \
                 drupal/varbase_reports:~6.0 \
                 drupal/varbase_media_header:~6.0 \
                 vardot/varbase_vmi_demo:dev-8.x-6.x \
                 vardot/varbase_story_demo:dev-8.x-6.x;

cd ${vdo_root}/${doc_name}/varbase80604;
composer require drupal/varbase_faqs:~6.0 \
                 drupal/varbase_reports:~6.0 \
                 drupal/varbase_media_header:~6.0 \
                 vardot/varbase_vmi_demo:dev-8.x-6.x \
                 vardot/varbase_story_demo:dev-8.x-6.x;

cd ${vdo_root}/${doc_name}/varbase80605;
composer require drupal/varbase_faqs:~6.0 \
                 drupal/varbase_reports:~6.0 \
                 drupal/varbase_media_header:~6.0 \
                 vardot/varbase_vmi_demo:dev-8.x-6.x \
                 vardot/varbase_story_demo:dev-8.x-6.x;

cd ${vdo_root}/${doc_name}/varbase80606;
composer require drupal/varbase_faqs:~6.0 \
                 drupal/varbase_reports:~6.0 \
                 drupal/varbase_media_header:~6.0 \
                 vardot/varbase_vmi_demo:dev-8.x-6.x \
                 vardot/varbase_story_demo:dev-8.x-6.x;

cd ${vdo_root}/${doc_name}/varbase80607;
composer require drupal/varbase_faqs:~6.0 \
                 drupal/varbase_reports:~6.0 \
                 drupal/varbase_media_header:~6.0 \
                 vardot/varbase_vmi_demo:dev-8.x-6.x \
                 vardot/varbase_story_demo:dev-8.x-6.x;

cd ${vdo_root}/${doc_name}/varbase80608;
composer require drupal/varbase_faqs:~6.0 \
                 drupal/varbase_reports:~6.0 \
                 drupal/varbase_media_header:~6.0 \
                 vardot/varbase_vmi_demo:dev-8.x-6.x \
                 vardot/varbase_story_demo:dev-8.x-6.x;
