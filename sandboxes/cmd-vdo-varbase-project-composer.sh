#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.sandboxes.settings.yml);

# Change with the version of Varbase 8.4.x-dev, 8.4.05, 8.4.06, 8.4.07
site_version="8.4.x-dev";
# Change with the version of Varbase 84DEV, 8405, 8406, 8407
site_version_code="84DEV";


# Change to true if you want to install varbase.
install_site=false;

# The user name and password for the installed varbase sites.
varbase_username=${account_name};
varbase_password="${account_pass}";


base_url="${web_url}";

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

full_database_name="${database_prefix}varbase_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv

composer create-project vardot/varbase-project:${site_version} ${project_name} --stability dev --no-interaction -vvv

sudo chmod 775 -R ${project_name}
sudo chown www-data:${user_name} -R ${project_name}

echo "${doc_name} ${project_name} is ready to install!!!!";
echo "Go to ${base_url}";

if $install_site ; then
  # Change directory to the docroot.
  cd ${vdo_root}/${doc_name}/${project_name}/docroot;

  # Install Varbase with Drush.
  drush site-install varbase --yes \
  --site-name="${doc_name} ${project_name}" \
  --account-name="${account_name}" \
  --account-pass="${account_pass}" \
  --account-mail="${account_mail}" \
  --db-url="mysql://${database_username}:${database_password}@${database_host}/${full_database_name}" \
  varbase_multilingual_configuration.enable_multilingual=1 \
  varbase_extra_components.vmi=1 \
  varbase_extra_components.varbase_heroslider_media=1 \
  varbase_extra_components.varbase_carousels=1 \
  varbase_extra_components.varbase_search=1 \
  varbase_development_tools.varbase_development=1 -vvv;

  # Send a notification.
  echo "${doc_name} ${project_name} has been installed!!!!";
  echo  "Go to ${base_url}";
  cd ${vdo_root}/${doc_name};
  sudo chmod 775 -R ${project_name};
  sudo chown www-data:${user_name} -R ${project_name};
fi