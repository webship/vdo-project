#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

echo "*-----------------------------------------------------*";
echo "Test Step5 Drush generate full data";
echo "*-----------------------------------------------------*";

# echo "*-----------------------------------------------------*";
# echo "| Varbase VERSION";
# echo "*-----------------------------------------------------*";
# cd ${vdo_root}/${doc_name}/vVERSION_CODE/docroot/;
# drush pm-enable varbase_development --yes ;
# drush pm-enable devel_generate --yes ;
#
# drush generate-terms tags 1;
# drush generate-terms tags 1;
# drush generate-terms tags 1;
#
# drush generate-terms blog_categories 1;
# drush generate-terms blog_categories 1;
# drush generate-terms blog_categories 1;
#
# drush generate-users --roles=editor 50;
# drush generate-users --roles=content_admin 50;
# drush generate-users --roles=seo_admin 30;
# drush generate-users --roles=site_admin 10;
# drush generate-users --roles=administrator 3;
#
# drush generate-content --types=page --languages='en' 50;
# drush generate-content --types=landing_page --languages='en' 50;
# drush generate-content --types=post --languages='en' 50;
# drush generate-content --types=episode --languages='en' 50;
# drush generate-content --types=faq --languages='en' 15;
# drush generate-content --types=varbase_blog --languages='en' 50;
# drush generate-content --types=varbase_heroslider_media --languages='en' 6;
#
# drush cr ;


echo "*-----------------------------------------------------*";
echo "| Varbase 8.7.0";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80700/docroot/;
drush pm-enable varbase_development --yes ;
drush pm-enable devel_generate --yes ;

drush generate-terms tags 1;
drush generate-terms tags 1;
drush generate-terms tags 1;

drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;

drush generate-users --roles=editor 50;
drush generate-users --roles=content_admin 50;
drush generate-users --roles=seo_admin 30;
drush generate-users --roles=site_admin 10;
drush generate-users --roles=administrator 3;

drush generate-content --types=page --languages='en' 50;
drush generate-content --types=landing_page --languages='en' 50;
drush generate-content --types=post --languages='en' 50;
drush generate-content --types=episode --languages='en' 50;
drush generate-content --types=faq --languages='en' 15;
drush generate-content --types=varbase_blog --languages='en' 50;
drush generate-content --types=varbase_heroslider_media --languages='en' 6;

drush cr ;



echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.12";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80612/docroot/;
drush pm-enable varbase_development --yes ;
drush pm-enable devel_generate --yes ;

drush generate-terms tags 1;
drush generate-terms tags 1;
drush generate-terms tags 1;

drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;

drush generate-users --roles=editor 50;
drush generate-users --roles=content_admin 50;
drush generate-users --roles=seo_admin 30;
drush generate-users --roles=site_admin 10;
drush generate-users --roles=administrator 3;

drush generate-content --types=page --languages='en' 50;
drush generate-content --types=landing_page --languages='en' 50;
drush generate-content --types=post --languages='en' 50;
drush generate-content --types=episode --languages='en' 50;
drush generate-content --types=faq --languages='en' 15;
drush generate-content --types=varbase_blog --languages='en' 50;
drush generate-content --types=varbase_heroslider_media --languages='en' 6;

drush cr ;


echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.11";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80611/docroot/;
drush pm-enable varbase_development --yes ;
drush pm-enable devel_generate --yes ;

drush generate-terms tags 1;
drush generate-terms tags 1;
drush generate-terms tags 1;

drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;

drush generate-users --roles=editor 50;
drush generate-users --roles=content_admin 50;
drush generate-users --roles=seo_admin 30;
drush generate-users --roles=site_admin 10;
drush generate-users --roles=administrator 3;

drush generate-content --types=page --languages='en' 50;
drush generate-content --types=landing_page --languages='en' 50;
drush generate-content --types=post --languages='en' 50;
drush generate-content --types=episode --languages='en' 50;
drush generate-content --types=faq --languages='en' 15;
drush generate-content --types=varbase_blog --languages='en' 50;
drush generate-content --types=varbase_heroslider_media --languages='en' 6;

drush cr ;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.10";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80610/docroot/;
drush pm-enable varbase_development --yes ;
drush pm-enable devel_generate --yes ;

drush generate-terms tags 1;
drush generate-terms tags 1;
drush generate-terms tags 1;

drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;

drush generate-users --roles=editor 50;
drush generate-users --roles=content_admin 50;
drush generate-users --roles=seo_admin 30;
drush generate-users --roles=site_admin 10;
drush generate-users --roles=administrator 3;

drush generate-content --types=page --languages='en' 50;
drush generate-content --types=landing_page --languages='en' 50;
drush generate-content --types=post --languages='en' 50;
drush generate-content --types=episode --languages='en' 50;
drush generate-content --types=faq --languages='en' 15;
drush generate-content --types=varbase_blog --languages='en' 50;
drush generate-content --types=varbase_heroslider_media --languages='en' 6;

drush cr ;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.9";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80609/docroot/;
drush pm-enable varbase_development --yes ;
drush pm-enable devel_generate --yes ;

drush generate-terms tags 1;
drush generate-terms tags 1;
drush generate-terms tags 1;

drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;

drush generate-users --roles=editor 50;
drush generate-users --roles=content_admin 50;
drush generate-users --roles=seo_admin 30;
drush generate-users --roles=site_admin 10;
drush generate-users --roles=administrator 3;

drush generate-content --types=page --languages='en' 50;
drush generate-content --types=landing_page --languages='en' 50;
drush generate-content --types=post --languages='en' 50;
drush generate-content --types=episode --languages='en' 50;
drush generate-content --types=faq --languages='en' 15;
drush generate-content --types=varbase_blog --languages='en' 50;
drush generate-content --types=varbase_heroslider_media --languages='en' 6;

drush cr ;


echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.8";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80608/docroot/;
drush pm-enable varbase_development --yes ;
drush pm-enable devel_generate --yes ;

drush generate-terms tags 1;
drush generate-terms tags 1;
drush generate-terms tags 1;

drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;

drush generate-users --roles=editor 50;
drush generate-users --roles=content_admin 50;
drush generate-users --roles=seo_admin 30;
drush generate-users --roles=site_admin 10;
drush generate-users --roles=administrator 3;

drush generate-content --types=page --languages='en' 50;
drush generate-content --types=landing_page --languages='en' 50;
drush generate-content --types=post --languages='en' 50;
drush generate-content --types=episode --languages='en' 50;
drush generate-content --types=faq --languages='en' 15;
drush generate-content --types=varbase_blog --languages='en' 50;
drush generate-content --types=varbase_heroslider_media --languages='en' 6;

drush cr ;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.7";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80607/docroot/;
drush pm-enable varbase_development --yes ;
drush pm-enable devel_generate --yes ;

drush generate-terms tags 1;
drush generate-terms tags 1;
drush generate-terms tags 1;

drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;

drush generate-users --roles=editor 50;
drush generate-users --roles=content_admin 50;
drush generate-users --roles=seo_admin 30;
drush generate-users --roles=site_admin 10;
drush generate-users --roles=administrator 3;

drush generate-content --types=page --languages='en' 50;
drush generate-content --types=landing_page --languages='en' 50;
drush generate-content --types=post --languages='en' 50;
drush generate-content --types=episode --languages='en' 50;
drush generate-content --types=faq --languages='en' 15;
drush generate-content --types=varbase_blog --languages='en' 50;
drush generate-content --types=varbase_heroslider_media --languages='en' 6;

drush cr ;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.6";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80606/docroot/;
drush pm-enable varbase_development --yes ;
drush pm-enable devel_generate --yes ;

drush generate-terms tags 1;
drush generate-terms tags 1;
drush generate-terms tags 1;

drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;

drush generate-users --roles=editor 50;
drush generate-users --roles=content_admin 50;
drush generate-users --roles=seo_admin 30;
drush generate-users --roles=site_admin 10;
drush generate-users --roles=administrator 3;

drush generate-content --types=page --languages='en' 50;
drush generate-content --types=landing_page --languages='en' 50;
drush generate-content --types=post --languages='en' 50;
drush generate-content --types=episode --languages='en' 50;
drush generate-content --types=faq --languages='en' 15;
drush generate-content --types=varbase_blog --languages='en' 50;
drush generate-content --types=varbase_heroslider_media --languages='en' 6;

drush cr ;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.5";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80605/docroot/;
drush pm-enable varbase_development --yes ;
drush pm-enable devel_generate --yes ;

drush generate-terms tags 1;
drush generate-terms tags 1;
drush generate-terms tags 1;

drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;

drush generate-users --roles=editor 50;
drush generate-users --roles=content_admin 50;
drush generate-users --roles=seo_admin 30;
drush generate-users --roles=site_admin 10;
drush generate-users --roles=administrator 3;

drush generate-content --types=page --languages='en' 50;
drush generate-content --types=landing_page --languages='en' 50;
drush generate-content --types=post --languages='en' 50;
drush generate-content --types=episode --languages='en' 50;
drush generate-content --types=faq --languages='en' 15;
drush generate-content --types=varbase_blog --languages='en' 50;
drush generate-content --types=varbase_heroslider_media --languages='en' 6;

drush cr ;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.4";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80604/docroot/;
drush pm-enable varbase_development --yes ;
drush pm-enable devel_generate --yes ;

drush generate-terms tags 1;
drush generate-terms tags 1;
drush generate-terms tags 1;

drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;

drush generate-users --roles=editor 50;
drush generate-users --roles=content_admin 50;
drush generate-users --roles=seo_admin 30;
drush generate-users --roles=site_admin 10;
drush generate-users --roles=administrator 3;

drush generate-content --types=page --languages='en' 50;
drush generate-content --types=landing_page --languages='en' 50;
drush generate-content --types=post --languages='en' 50;
drush generate-content --types=episode --languages='en' 50;
drush generate-content --types=faq --languages='en' 15;
drush generate-content --types=varbase_blog --languages='en' 50;
drush generate-content --types=varbase_heroslider_media --languages='en' 6;

drush cr ;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.3";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80603/docroot/;
drush pm-enable varbase_development --yes ;
drush pm-enable devel_generate --yes ;

drush generate-terms tags 1;
drush generate-terms tags 1;
drush generate-terms tags 1;

drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;

drush generate-users --roles=editor 50;
drush generate-users --roles=content_admin 50;
drush generate-users --roles=seo_admin 30;
drush generate-users --roles=site_admin 10;
drush generate-users --roles=administrator 3;

drush generate-content --types=page --languages='en' 50;
drush generate-content --types=landing_page --languages='en' 50;
drush generate-content --types=post --languages='en' 50;
drush generate-content --types=episode --languages='en' 50;
drush generate-content --types=faq --languages='en' 15;
drush generate-content --types=varbase_blog --languages='en' 50;
drush generate-content --types=varbase_heroslider_media --languages='en' 6;

drush cr ;
echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.2";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80602/docroot/;
drush pm-enable varbase_development --yes ;
drush pm-enable devel_generate --yes ;

drush generate-terms tags 1;
drush generate-terms tags 1;
drush generate-terms tags 1;

drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;

drush generate-users --roles=editor 50;
drush generate-users --roles=content_admin 50;
drush generate-users --roles=seo_admin 30;
drush generate-users --roles=site_admin 10;
drush generate-users --roles=administrator 3;

drush generate-content --types=page --languages='en' 50;
drush generate-content --types=landing_page --languages='en' 50;
drush generate-content --types=post --languages='en' 50;
drush generate-content --types=episode --languages='en' 50;
drush generate-content --types=faq --languages='en' 15;
drush generate-content --types=varbase_blog --languages='en' 50;
drush generate-content --types=varbase_heroslider_media --languages='en' 6;

drush cr ;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.1";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80601/docroot/;
drush pm-enable varbase_development --yes ;
drush pm-enable devel_generate --yes ;

drush generate-terms tags 1;
drush generate-terms tags 1;
drush generate-terms tags 1;

drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;

drush generate-users --roles=editor 50;
drush generate-users --roles=content_admin 50;
drush generate-users --roles=seo_admin 30;
drush generate-users --roles=site_admin 10;
drush generate-users --roles=administrator 3;

drush generate-content --types=page --languages='en' 50;
drush generate-content --types=landing_page --languages='en' 50;
drush generate-content --types=post --languages='en' 50;
drush generate-content --types=episode --languages='en' 50;
drush generate-content --types=faq --languages='en' 15;
drush generate-content --types=varbase_blog --languages='en' 50;
drush generate-content --types=varbase_heroslider_media --languages='en' 6;

drush cr ;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.0";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80600/docroot/;
drush pm-enable varbase_development --yes ;
drush pm-enable devel_generate --yes ;

drush generate-terms tags 1;
drush generate-terms tags 1;
drush generate-terms tags 1;

drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;
drush generate-terms blog_categories 1;

drush generate-users --roles=editor 50;
drush generate-users --roles=content_admin 50;
drush generate-users --roles=seo_admin 30;
drush generate-users --roles=site_admin 10;
drush generate-users --roles=administrator 3;

drush generate-content --types=page --languages='en' 50;
drush generate-content --types=landing_page --languages='en' 50;
drush generate-content --types=post --languages='en' 50;
drush generate-content --types=episode --languages='en' 50;
drush generate-content --types=faq --languages='en' 15;
drush generate-content --types=varbase_blog --languages='en' 50;
drush generate-content --types=varbase_heroslider_media --languages='en' 6;

drush cr ;

echo "*-----------------------------------------------------*";
echo " Done : Test Step5 Drush generate full data";
echo "*-----------------------------------------------------*";
