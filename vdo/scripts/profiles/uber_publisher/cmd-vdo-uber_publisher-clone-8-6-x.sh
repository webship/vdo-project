#!/usr/bin/env bash

echo '------------------------------------------------------------------------';
echo '  Git clone all Uber Publisher projects for 8.x-6.x';
echo '------------------------------------------------------------------------';

cd /var/www/html/products/ ;

# Uber Publisher project template.
# ------------------------------------------------------------------------------
if [ -d "uber_publisher-project" ]; then rm -rf uber_publisher-project; fi
git clone --branch 8.x-6.x git@github.com:Vardot/uber_publisher-project.git ;
git remote rename origin github ;

# Uber Publisher profile.
# ------------------------------------------------------------------------------
if [ -d "uber_publisher" ]; then rm -rf uber_publisher; fi
git clone --branch 8.x-6.x git@git.drupal.org:project/uber_publisher.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/uber_publisher.git ;

# Uber Publisher components.
# ------------------------------------------------------------------------------
if [ -d "uber_publisher_core" ]; then rm -rf uber_publisher_core; fi
git clone --branch 8.x-6.x git@git.drupal.org:project/uber_publisher_core.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/uber_publisher_core.git ;

if [ -d "uber_publisher_opinion_articles" ]; then rm -rf uber_publisher_opinion_articles; fi
git clone --branch 8.x-6.x git@git.drupal.org:project/uber_publisher_opinion_articles.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/uber_publisher_opinion_articles.git ;

if [ -d "uber_publisher_author_profile" ]; then rm -rf uber_publisher_author_profile; fi
git clone --branch 8.x-6.x git@git.drupal.org:project/uber_publisher_author_profile.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/uber_publisher_author_profile.git ;

if [ -d "uber_publisher_breaking_news" ]; then rm -rf uber_publisher_breaking_news; fi
git clone --branch 8.x-6.x git@git.drupal.org:project/uber_publisher_breaking_news.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/uber_publisher_breaking_news.git ;

if [ -d "uber_publisher_daily_cartoons" ]; then rm -rf uber_publisher_daily_cartoons; fi
git clone --branch 8.x-6.x git@git.drupal.org:project/uber_publisher_daily_cartoons.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/uber_publisher_daily_cartoons.git ;

if [ -d "uber_publisher_in_pictures" ]; then rm -rf uber_publisher_in_pictures; fi
git clone --branch 8.x-6.x git@git.drupal.org:project/uber_publisher_in_pictures.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/uber_publisher_in_pictures.git ;

if [ -d "uber_publisher_search" ]; then rm -rf uber_publisher_search; fi
git clone --branch 8.x-6.x git@git.drupal.org:project/uber_publisher_search.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/uber_publisher_search.git ;

if [ -d "uber_publisher_social_post" ]; then rm -rf uber_publisher_social_post; fi
git clone --branch 8.x-6.x git@git.drupal.org:project/uber_publisher_social_post.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/uber_publisher_social_post.git ;

if [ -d "uber_publisher_ads_system" ]; then rm -rf uber_publisher_ads_system; fi
git clone --branch 8.x-6.x git@git.drupal.org:project/uber_publisher_ads_system.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/uber_publisher_ads_system.git ;