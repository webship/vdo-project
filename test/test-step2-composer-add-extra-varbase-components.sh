#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);


echo "*-----------------------------------------------------*";
echo "Test Step2 composer add extra varbase components";
echo "*-----------------------------------------------------*";


cd ${vdo_root}/test;
sudo chmod 775 -R .;sudo chown www-data:${USER} -R .;

# echo "*-----------------------------------------------------*";
# echo "| Varbase VERSION";
# echo "*-----------------------------------------------------*";
# cd ${vdo_root}/test/vVERSION_CODE;
# composer require drupal/varbase_faqs:~6.0;
# composer require drupal/varbase_reports:~6.0;
# composer require drupal/varbase_media_header:~6.0;
# composer require vardot/varbase_vmi_demo:dev-8.x-6.x;
# composer require vardot/varbase_story_demo:dev-8.x-6.x;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.7.0";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/test/v80700;
composer require 'drupal/varbase_faqs:~6.0' \
                  'drupal/varbase_reports:~6.0' \
                  'drupal/varbase_media_header:~7.0' \
                  'vardot/varbase_vmi_demo:dev-8.x-7.x' \
                  'vardot/varbase_story_demo:dev-8.x-7.x' ;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.12";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/test/v80612;
composer require 'drupal/varbase_faqs:~6.0' \
                  'drupal/varbase_reports:~6.0' \
                  'drupal/varbase_media_header:~6.0' \
                  'vardot/varbase_vmi_demo:dev-8.x-6.x' \
                  'vardot/varbase_story_demo:dev-8.x-6.x' \
                  'drupal/varbase_api:7.*';

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.11";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/test/v80611;
composer require 'drupal/varbase_faqs:~6.0' \
                  'drupal/varbase_reports:~6.0' \
                  'drupal/varbase_media_header:~6.0' \
                  'vardot/varbase_vmi_demo:dev-8.x-6.x' \
                  'vardot/varbase_story_demo:dev-8.x-6.x' \
                  'drupal/varbase_api:7.*';

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.10";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/test/v80610;
composer require 'drupal/varbase_faqs:~6.0' \
                  'drupal/varbase_reports:~6.0' \
                  'drupal/varbase_media_header:~6.0' \
                  'vardot/varbase_vmi_demo:dev-8.x-6.x' \
                  'vardot/varbase_story_demo:dev-8.x-6.x' \
                  'drupal/varbase_api:7.*';

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.9";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/test/v80609;
composer require 'drupal/varbase_faqs:~6.0' \
                  'drupal/varbase_reports:~6.0' \
                  'drupal/varbase_media_header:~6.0' \
                  'vardot/varbase_vmi_demo:dev-8.x-6.x' \
                  'vardot/varbase_story_demo:dev-8.x-6.x' \
                  'drupal/varbase_api:6.*';

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.8";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/test/v80608;
composer require 'drupal/varbase_faqs:~6.0' \
                  'drupal/varbase_reports:~6.0' \
                  'drupal/varbase_media_header:~6.0' \
                  'vardot/varbase_vmi_demo:dev-8.x-6.x' \
                  'vardot/varbase_story_demo:dev-8.x-6.x' \
                  'drupal/varbase_api:6.*';


echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.7";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/test/v80607;
composer require 'drupal/varbase_faqs:~6.0' \
                  'drupal/varbase_reports:~6.0' \
                  'drupal/varbase_media_header:~6.0' \
                  'vardot/varbase_vmi_demo:dev-8.x-6.x' \
                  'vardot/varbase_story_demo:dev-8.x-6.x' \
                  'drupal/varbase_api:6.*';


echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.6";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/test/v80606;
composer require 'drupal/varbase_faqs:~6.0' \
                  'drupal/varbase_reports:~6.0' \
                  'drupal/varbase_media_header:~6.0' \
                  'vardot/varbase_vmi_demo:dev-8.x-6.x' \
                  'vardot/varbase_story_demo:dev-8.x-6.x' \
                  'drupal/varbase_api:6.*';


echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.5";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/test/v80605;
composer require 'drupal/varbase_faqs:~6.0' \
                  'drupal/varbase_reports:~6.0' \
                  'drupal/varbase_media_header:~6.0' \
                  'vardot/varbase_vmi_demo:dev-8.x-6.x' \
                  'vardot/varbase_story_demo:dev-8.x-6.x' \
                  'drupal/varbase_api:6.*';


echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.4";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/test/v80604;
composer require 'drupal/varbase_faqs:~6.0' \
                  'drupal/varbase_reports:~6.0' \
                  'drupal/varbase_media_header:~6.0' \
                  'vardot/varbase_vmi_demo:dev-8.x-6.x' \
                  'vardot/varbase_story_demo:dev-8.x-6.x' \
                  'drupal/varbase_api:6.*';


echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.3";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/test/v80603;
composer require 'drupal/varbase_faqs:~6.0' \
                  'drupal/varbase_reports:~6.0' \
                  'drupal/varbase_media_header:~6.0' \
                  'vardot/varbase_vmi_demo:dev-8.x-6.x' \
                  'vardot/varbase_story_demo:dev-8.x-6.x' \
                  'drupal/varbase_api:6.*';


echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.2";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/test/v80602;
composer require 'drupal/varbase_faqs:~6.0' \
                  'drupal/varbase_reports:~6.0' \
                  'drupal/varbase_media_header:~6.0' \
                  'vardot/varbase_vmi_demo:dev-8.x-6.x' \
                  'vardot/varbase_story_demo:dev-8.x-6.x' \
                  'drupal/varbase_api:6.*';


echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.1";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/test/v80601;
composer require 'drupal/varbase_faqs:~6.0' \
                  'drupal/varbase_reports:~6.0' \
                  'drupal/varbase_media_header:~6.0' \
                  'vardot/varbase_vmi_demo:dev-8.x-6.x' \
                  'vardot/varbase_story_demo:dev-8.x-6.x' \
                  'drupal/varbase_api:6.*';


echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.0";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/test/v80600;
composer require 'drupal/varbase_faqs:~6.0' \
                  'drupal/varbase_reports:~6.0' \
                  'drupal/varbase_media_header:~6.0' \
                  'vardot/varbase_vmi_demo:dev-8.x-6.x' \
                  'vardot/varbase_story_demo:dev-8.x-6.x' \
                  'drupal/varbase_api:6.*';



cd ${vdo_root}/test;
sudo chmod 775 -R .;sudo chown www-data:${USER} -R .;

echo "*-----------------------------------------------------*";
echo "Done. Test Step2 composer add extra varbase components";
echo "*-----------------------------------------------------*";
