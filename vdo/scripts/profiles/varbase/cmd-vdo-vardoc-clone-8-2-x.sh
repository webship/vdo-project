#!/usr/bin/env bash

echo '------------------------------------------------------------------------';
echo '  Git clone all Vardoc projects for 8.x-2.x';
echo '------------------------------------------------------------------------';

cd /var/www/html/products/ ;

# Vardoc project template.

if [ -d "vardoc-project" ]; then rm -rf vardoc-project; fi
git clone --branch 8.x-2.x git@github.com:Vardot/vardoc-project.git ;
git remote rename origin github ;

# Vardoc profile project.

if [ -d "vardoc" ]; then rm -rf vardoc; fi
git clone --branch 8.x-2.x git@git.drupal.org:project/vardoc.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/vardoc.git ;
