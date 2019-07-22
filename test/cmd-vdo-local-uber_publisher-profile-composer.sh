#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

# Change with the version of Varbase 8.4.x-dev, 8.4.05, 8.4.06, 8.4.07 for, for custom fearues we coudl use dev-branch_name , like dev-8.x-4.x-tour
site_version="8.5.x-dev";
# Change with the version of Varbase 84DEV, 8405, 8406, 8407
site_version_code="85DEV";


# Change to true if you want to install varbase.
install_site=false;

# The user name and password for the installed varbase sites.
varbase_username=${account_name};
varbase_password="${account_pass}";

# Change with true or false, if you want to install the feature.
enable_multilingual=true;
vmi=true;
varbase_heroslider_media=true;
varbase_carousels=true;
varbase_search=true;
varbase_development=true;


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

  if [ "$2" == "no-install" ]; then
    install_site=false;
  fi
fi

# Get varbase version;
if [ "$3" != "" ]; then
  site_version="$3";
fi

# Change directory to the workspace for this full operation.
cd ${doc_path}/${doc_name};

if [ -d "${project_name}" ]; then
  sudo rm -rf ${project_name} -vvv
fi

full_database_name="${database_prefix}${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv

cp -r ${vdo_root}/products/uber_publisher ${doc_path}/${doc_name}/${project_name}

rm -rf ${doc_path}/${doc_name}/${project_name}/.git
cd ${doc_path}/${doc_name}/${project_name}
composer install --no-interaction -vvv

sudo chmod 775 -R ${doc_path}/${doc_name}/${project_name}
sudo chown www-data:${user_name} -R ${doc_path}/${doc_name}/${project_name}

echo "${doc_name} ${project_name} is ready to install!!!!";
echo "Go to ${base_url}";

