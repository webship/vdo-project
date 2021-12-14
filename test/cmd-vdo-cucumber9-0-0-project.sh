#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

# Change with the version.
site_version="^9.0.0";
# Change with the version
site_version_code="90DEV";


# Default value for arguments.
install_site=false;
add_users=false;

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

# GET add users argument to add them to the site.
if [ "$3" != "" ]; then
  if [ "$3" == "--add-users" ]; then
    add_users=true;
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

composer create-project webship/cucumber-project:${site_version} ${project_name} --no-interaction -vvv ;

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

mkdir ${vdo_root}/${doc_name}/${project_name}/config ;
mkdir ${vdo_root}/${doc_name}/${project_name}/config/sync ;
echo "\$settings['config_sync_directory'] = '${config_sync_directory}';" >> ${vdo_root}/${doc_name}/${project_name}/web/sites/default/settings.php ;

sudo chmod 775 -R ${vdo_root}/${doc_name}/${project_name}
sudo chown www-data:${user_name} -R ${vdo_root}/${doc_name}/${project_name}

echo "${doc_name} ${project_name} is ready to install!!!!";
base_url="${web_url}/${project_name}/web";
echo "Go to ${base_url}";

if $install_site ; then

  if [ ! -d "${vdo_root}/${doc_name}/${project_name}/vendor/drush/drush" ]; then
    cd ${vdo_root}/${doc_name}/${project_name};
    composer require drush/drush:~10;
  fi

  # Change directory to web.
  cd ${vdo_root}/${doc_name}/${project_name}/web/;

  # Install Cucumber with Drush.
  drush site-install cucumber --yes --site-name="${doc_name} ${project_name}" --account-name="${account_name}" --account-pass="${account_pass}" --account-mail="${account_mail}" --db-url="mysql://${database_username}:${database_password}@${database_host}/${full_database_name}" ;
  drush config-set system.performance css.preprocess 0 --yes ;
  drush config-set system.performance js.preprocess 0 --yes ;
  drush config-set system.logging error_level all --yes ;
  drush cr ;

  sudo chmod 775 -R ${project_name};
  sudo chown www-data:${user_name} -R ${project_name};

  # Send a notification.
  echo "${doc_name} ${project_name} has been installed!!!!";
  echo  "Go to ${base_url}";
  cd ${vdo_root}/${doc_name};
fi

## Add default set of users.
if $add_users ; then

  # Load the list of default users for cucumber.
  eval $(parse_yaml ${vdo_config}/users/cucumber.users.yml);

  cd ${vdo_root}/${doc_name}/${project_name}/web/;

  for user in ${users[@]}
  do
      user_name="user_${user}_name";
      user_mail="user_${user}_mail";
      user_password="user_${user}_password";
      user_role="user_${user}_role";

      echo " ---------------------------------------------------------------- ";
      echo "      User name: ${!user_name}";
      echo "      User mail: ${!user_mail}";
      echo "  User password: ${!user_password}";
      echo "      User role: ${!user_role}";
      echo " ================================================================= ";

      ../bin/drush user:create "${!user_name}" --mail="${!user_mail}" --password="${!user_password}" ;
    if [ ! -z "${!user_role}" ]; then
      ../bin/drush user:role:add "${!user_role}" "${!user_name}" ;
    fi
  done

  echo "Start Cache rebuilding ...";
  ../bin/drush cache:rebuild ;

  cd ${vdo_root}/${doc_name};
fi
