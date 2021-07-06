#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

# Change with the version of Varbase 9.0.x-dev
site_version="9.0.x-dev";
# Change with the version of Varbase 90DEV
site_version_code="90DEV";


# Change to true if you want to install varbase.
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

  if [ "$2" == "no-install" ]; then
    install_site=false;
  fi
fi

# Get varbase version;
if [ "$3" != "" ]; then
  site_version="$3";
fi

# Change directory to the workspace for this full operation.
cd ${vdo_root}/${doc_name};

if [ -d "${project_name}" ]; then
  sudo rm -rf ${project_name} -vvv
fi

full_database_name="${database_prefix}${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv

git clone --branch 9.0.x git@github.com:Vardot/varbase.git ${vdo_root}/${doc_name}/${project_name}/docroot/profiles/varbase;
sudo rm -rf ${vdo_root}/${doc_name}/${project_name}/config ${vdo_root}/${doc_name}/${project_name}/configbit ${vdo_root}/${doc_name}/${project_name}/css ${vdo_root}/${doc_name}/${project_name}/images ${vdo_root}/${doc_name}/${project_name}/libraries ${vdo_root}/${doc_name}/${project_name}/scripts ${vdo_root}/${doc_name}/${project_name}/src ${vdo_root}/${doc_name}/${project_name}/tests ${vdo_root}/${doc_name}/${project_name}/traslations ${vdo_root}/${doc_name}/${project_name}/varbase.info.yml ${vdo_root}/${doc_name}/${project_name}/varbase.install ${vdo_root}/${doc_name}/${project_name}/varbase.libraries.yml ${vdo_root}/${doc_name}/${project_name}/varbase.profile ${vdo_root}/${doc_name}/${project_name}/varbase.services.yml ${vdo_root}/${doc_name}/${project_name}/yarn.lock

cp ${vdo_root}/${doc_name}/${project_name}/docroot/sites/default/default.settings.php ${vdo_root}/${doc_name}/${project_name}/docroot/sites/default/settings.php ;
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
];" >> ${vdo_root}/${doc_name}/${project_name}/docroot/sites/default/settings.php ;

mkdir ${vdo_root}/${doc_name}/${project_name}/config ;
mkdir ${vdo_root}/${doc_name}/${project_name}/config/sync ;
echo "\$settings['config_sync_directory'] = '${config_sync_directory}';" >> ${vdo_root}/${doc_name}/${project_name}/docroot/sites/default/settings.php ;

vdo_build_time=$( date '+%Y-%m-%d %H-%M-%S' );
echo "// VDO Built time: ${vdo_build_time}" >> ${vdo_root}/${doc_name}/${project_name}/docroot/sites/default/settings.php ;

sudo chmod 775 -R ${vdo_root}/${doc_name}/${project_name}
sudo chown www-data:${user_name} -R ${vdo_root}/${doc_name}/${project_name}

echo "${doc_name} ${project_name} is ready to install!!!!";
echo "Go to ${base_url}";

if $install_site ; then

  # Change directory to the docroot.
  cd ${vdo_root}/${doc_name}/${project_name}/docroot;

  # Install Varbase with Drush.
  ../bin/drush site-install varbase --yes --site-name="${doc_name} ${project_name}"  --account-name="${account_name}"  --account-pass="${account_pass}"  --account-mail="${account_mail}"  --db-url="mysql://${database_username}:${database_password}@${database_host}/${full_database_name}" --locale="en" varbase_multilingual_configuration.enable_multilingual=true varbase_extra_components.vmi=true varbase_extra_components.varbase_heroslider_media=true varbase_extra_components.varbase_carousels=true varbase_extra_components.varbase_search=true varbase_extra_components.varbase_blog=true varbase_extra_components.varbase_auth=true  install_configure_form.enable_update_status_emails=NULL --debug -vvv;
  ../bin/drush pm-enable varbase_development --yes ;
  ../bin/drush pm-enable varbase_styleguide --yes ;
  ../bin/drush pm-enable varbase_api --yes ;
  ../bin/drush pm-enable varbase_content_planner --yes ;
  ../bin/drush pm-enable varbase_media_instagram --yes ;
  ../bin/drush pm-enable varbase_media_twitter --yes ;
  ../bin/drush pm-enable social_auth_google --yes ;
  ../bin/drush pm-enable social_auth_facebook --yes ;
  ../bin/drush pm-enable social_auth_twitter --yes ;
  ../bin/drush pm-enable social_auth_linkedin --yes ;
  ../bin/drush config-set system.performance css.preprocess 0 --yes ;
  ../bin/drush config-set system.performance js.preprocess 0 --yes ;
  ../bin/drush config-set system.logging error_level all --yes ;
  ../bin/drush cr ;


  # Send a notification.
  echo "${doc_name} ${project_name} has been installed!!!!";
  echo  "Go to ${base_url}";
  cd ${vdo_root}/${doc_name};
  sudo chmod 775 -R ${project_name};
  sudo chown www-data:${user_name} -R ${project_name};
fi
