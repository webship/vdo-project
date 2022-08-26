#!/bin/usr/env bash

# Vardoc project template.
git clone --branch '5.0.x' --origin 'github' git@github.com:vardot/vardoc-project.git
cd vardoc-project
git config --replace-all core.filemode false
cd ..

# Vardoc profile.
git clone --branch '5.0.x' --origin 'drupal' git@git.drupal.org:project/vardoc.git
cd vardoc
git config --replace-all core.filemode false
git remote add github git@github.com:Vardot/vardoc.git
cd ..