#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

echo "*----------------------------------------------------------------------*";
echo "|  Build Drupal Project and add Varbase Bootstrap Paragraphs module    |";
echo "*----------------------------------------------------------------------*";

# Change to true if you want to install.
install_site=false;

base_url="${web_url}/${project_name}";

# GET the project name argument.
if [ "$1" != "" ]; then
    project_name=$1;
else
  echo "Please add the name of your project.";
  exit 1;
fi

# GET install argument to install;
if [ "$2" != "" ]; then
  if [ "$2" == "install" ]; then
    install_site=true;
  fi
fi

# Change directory to the workspace for this full operation.
cd ${vdo_root}/${doc_name};

if [ -d "${project_name}" ]; then
  sudo rm -rf ${project_name} -vvv
fi

full_database_name="${database_prefix}${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv

composer create-project drupal-composer/drupal-project:8.x-dev ${project_name} --no-interaction ;

cd ${vdo_root}/${doc_name}/${project_name};
composer config repositories.asset composer https://asset-packagist.org
composer config extra.enable-patching true ;
composer config extra.composer-exit-on-patch-failure true ;
composer config extra.installer-types.0 "npm-asset" ;
composer config extra.installer-types.1 "bower-asset" ;
composer config extra.installer-paths.web\/libraries\/\{\$name\} [DOUBLE_QUOTATIONtype:drupal-libraryDOUBLE_QUOTATION,DOUBLE_QUOTATIONtype:bower-assetDOUBLE_QUOTATION,DOUBLE_QUOTATIONtype:npm-assetDOUBLE_QUOTATION] ;
composer config extra.installer-paths.web\/libraries\/slick [DOUBLE_QUOTATIONnpm-asset/slick-carouselDOUBLE_QUOTATION] ;

composer config extra.libraries "[{DOUBLE_QUOTATIONnameDOUBLE_QUOTATION: DOUBLE_QUOTATIONdropzoneDOUBLE_QUOTATION,DOUBLE_QUOTATIONpackageDOUBLE_QUOTATION: DOUBLE_QUOTATIONnpm-asset/dropzoneDOUBLE_QUOTATION},{DOUBLE_QUOTATIONnameDOUBLE_QUOTATION: DOUBLE_QUOTATIONblazyDOUBLE_QUOTATION, DOUBLE_QUOTATIONpackageDOUBLE_QUOTATION: DOUBLE_QUOTATIONnpm-asset/blazyDOUBLE_QUOTATION},{DOUBLE_QUOTATIONnameDOUBLE_QUOTATION: DOUBLE_QUOTATIONslickDOUBLE_QUOTATION, DOUBLE_QUOTATIONpackageDOUBLE_QUOTATION: DOUBLE_QUOTATIONnpm-asset/slick-carouselDOUBLE_QUOTATION}]" ;
sed -i 's/DOUBLE_QUOTATION/"/g' composer.json ;

sed -i 's/\"\[\"/["/g' composer.json ;
sed -i 's/\"\]\"/"]/g' composer.json ;

sed -i 's/\"{\"/{"/g' composer.json ;
sed -i 's/\"}\"]\"/"}/g' composer.json ;

sed -i 's/\"\[{\"/[{"/g' composer.json ;
sed -i 's/\"}\]\"/"}]/g' composer.json ;

composer require "composer/installers:~1.0" ;
composer require "oomphinc/composer-installers-extender:~1.0" ;
composer require "cweagans/composer-patches:~1.0" ;
composer require "drupal/drupal-library-installer-plugin:^0.3" ;
composer require npm-asset/dropzone:~4.0 npm-asset/blazy:~1.0 npm-asset/slick-carousel:~1.0 ;
dir web/libraries ;
composer require "drupal/varbase_media:7.x-dev" ;
composer require "drupal/varbase_bootstrap_paragraphs:7.x-dev" ;

sudo chmod 775 -R ${vdo_root}/${doc_name}/${project_name}
sudo chown www-data:${user_name} -R ${vdo_root}/${doc_name}/${project_name}

echo "${doc_name} ${project_name} is ready to install!!!!";
echo "Go to ${base_url}";

if $install_site ; then
  # Change directory to the Drupal project.
  cd ${vdo_root}/${doc_name}/${project_name}/web;

  # Install Drupal with Drush.
  drush site-install standard --yes \
  --site-name="${doc_name} ${project_name}" \
  --account-name="${account_name}" \
  --account-pass="${account_pass}" \
  --account-mail="${account_mail}" \
  --db-url="mysql://${database_username}:${database_password}@${database_host}/${full_database_name}"  -vvv;

  # Send a notification.
  echo "${doc_name} ${project_name} has been installed!!!!";
  echo  "Go to ${base_url}";
  cd ${vdo_root}/${doc_name};
  sudo chmod 775 -R ${project_name};
  sudo chown www-data:${user_name} -R ${project_name};
fi
