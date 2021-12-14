#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.sandboxes.settings.yml);

echo "*----------------------------------------------------------------------*";
echo "|  Build Project Browser module under Drupal 9 recommended project     |";
echo "*----------------------------------------------------------------------*";

# Change to true if you want to install varbase.
install_site=false;

# GET the project name argument.
if [ "$1" != "" ]; then
    project_name=$1;
else
  echo "Please add the name of your project.";
  exit 1;
fi

# GET install argument.
if [ "$2" != "" ]; then
  if [ "$2" == "--install" ]; then
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
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" -vvv

# Build Drupal using the recommended project template.
composer create-project drupal/recommended-project:~9 ${project_name} --no-interaction ;

# Go into the project folder.
cd ${vdo_root}/${doc_name}/${project_name} ;

# Change composer config to let it install dev packages.
composer config minimum-stability dev ;

# Add the Project Browser latest dev version.
composer require drupal/project_browser:1.0.x-dev ;

cp ${vdo_root}/${doc_name}/${project_name}/web/sites/default/default.settings.php ${vdo_root}/${doc_name}/${project_name}/web/sites/default/settings.php ;
echo "\$databases['default']['default'] = [
  'database' => '${full_database_name}',
  'username' => '${database_username}',
  'password' => '${database_password}',
  'host' => '${database_host}',
  'port' => '${database_port}',
  'namespace' => '${database_namespace}',
  'driver' => '${database_driver}',
  'prefix' => '',
  'collation' => '${database_collation}',
];" >> ${vdo_root}/${doc_name}/${project_name}/web/sites/default/settings.php ;

# Create the config/sync folder.
mkdir -p ${vdo_root}/${doc_name}/${project_name}/config/sync ;
echo "\$settings['config_sync_directory'] = '${config_sync_directory}';" >> ${vdo_root}/${doc_name}/${project_name}/web/sites/default/settings.php ;

vdo_build_time=$( date '+%Y-%m-%d %H-%M-%S' );
echo "// VDO Built time: ${vdo_build_time}" >> ${vdo_root}/${doc_name}/${project_name}/web/sites/default/settings.php ;

sudo chmod 775 -R ${vdo_root}/${doc_name}/${project_name}
sudo chown www-data:${user_name} -R ${vdo_root}/${doc_name}/${project_name}

echo "${doc_name} ${project_name} is ready to install!!!!";
base_url="${vdo_host}/${doc_name}/${project_name}/web";
echo "Go to ${base_url}";

if $install_site ; then

  if [ ! -d "${vdo_root}/${doc_name}/${project_name}/vendor/drush/drush" ]; then
    cd ${vdo_root}/${doc_name}/${project_name};
    composer require drush/drush:~10;
  fi

  # Change directory to the web.
  cd ${vdo_root}/${doc_name}/${project_name}/web;

  # Install Drupal with Drush.
  ../vendor/drush/drush/drush status ;
  ../vendor/drush/drush/drush site:install standard --yes --site-name="${doc_name} ${project_name}" --account-name="${account_name}" --account-pass="${account_pass}" --account-mail="${account_mail}" --db-url="mysql://${database_username}:${database_password}@${database_host}/${full_database_name}" --locale="en" install_configure_form.enable_update_status_emails=NULL  --debug -vvv;
  ../vendor/drush/drush/drush config:set system.performance css.preprocess 0 --yes ;
  ../vendor/drush/drush/drush config:set system.performance js.preprocess 0 --yes ;
  ../vendor/drush/drush/drush config:set system.logging error_level all --yes ;
  ../vendor/drush/drush/drush theme:enable olivero --yes;
  ../vendor/drush/drush/drush config:set system.theme default olivero --yes ;
  ../vendor/drush/drush/drush theme:enable claro --yes;
  ../vendor/drush/drush/drush config:set system.theme admin claro --yes ;
  ../vendor/drush/drush/drush cache:rebuild ;
  ../vendor/drush/drush/drush pm:enable project_browser --debug --yes ;
  ../vendor/drush/drush/drush cache:rebuild ;

  # Send a notification.
  echo "${doc_name} ${project_name} has been installed!!!!";
  echo  "Go to ${base_url}";
  cd ${vdo_root}/${doc_name};
  sudo chmod 775 -R ${project_name};
  sudo chown www-data:${user_name} -R ${project_name};
fi
