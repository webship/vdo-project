#!/bin/usr/env bash

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.sandboxes.settings.yml);

# Change with the version of Vardoc ~5.0
site_version="^5.0.0";


# Change to true if you want to install varbase.
install_site=false;

base_url="http://${vdo_host}/${doc_name}/${PROJECT_NAME}";

# GET the project name argument.
if [ "$1" != "" ]; then
    PROJECT_NAME=$1;
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

if [ -d "${PROJECT_NAME}" ]; then
  sudo rm -rf ${PROJECT_NAME} 
fi

full_database_name="${database_prefix}${PROJECT_NAME}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" -vvv

composer create-project vardot/vardoc-project:${site_version} ${PROJECT_NAME} --no-interaction  ;

cp ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/sites/default/default.settings.php ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/sites/default/settings.php ;
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
];" >> ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/sites/default/settings.php ;

# Create the config/sync folder.
mkdir -p ${vdo_root}/${doc_name}/${PROJECT_NAME}/config/sync ;
echo "\$settings['config_sync_directory'] = '${config_sync_directory}';" >> ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/sites/default/settings.php ;

vdo_build_time=$( date '+%Y-%m-%d %H-%M-%S' );
echo "// VDO Built time: ${vdo_build_time}" >> ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/sites/default/settings.php ;

sudo chmod 775 -R ${vdo_root}/${doc_name}/${PROJECT_NAME}
sudo chown www-data:${user_name} -R ${vdo_root}/${doc_name}/${PROJECT_NAME}

echo "${doc_name} ${PROJECT_NAME} is ready to install!!!!";
echo "Go to ${base_url}";

if $install_site ; then
  # Change directory to the docroot.
  cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot;

  # Install Varbase with Drush.
  drush site-install vardoc --yes --site-name="${doc_name} ${PROJECT_NAME}" --account-name="${account_name}" --account-pass="${account_pass}" --account-mail="${account_mail}" --db-url="mysql://${database_username}:${database_password}@${database_host}/${full_database_name}" varbase_development_tools.varbase_development=1 -vvv;

  # Send a notification.
  echo "${doc_name} ${PROJECT_NAME} has been installed!!!!";
  echo  "Go to ${base_url}";
  cd ${vdo_root}/${doc_name};
  sudo chmod 775 -R ${PROJECT_NAME};
  sudo chown www-data:${user_name} -R ${PROJECT_NAME};
fi
