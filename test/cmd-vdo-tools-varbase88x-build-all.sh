#!/bin/usr/env bash

drupal_version="8";
major_version="8";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

sudo composer self-update --1 ;


for version in {0..7..1}
  do
    progress_bar ${version} 7 ;

    project_name="varbase${drupal_version}${major_version}${version}";

    if [ -d "${vdo_root}/${doc_name}/${project_name}" ]; then
      sudo rm -rf ${vdo_root}/${doc_name}/${project_name} ;
    fi

    full_database_name="${database_prefix}${project_name}";
    mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -v ;
    mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" -v ;

    composer create-project vardot/varbase-project:${drupal_version}.${major_version}.${version} ${vdo_root}/${doc_name}/${project_name} --no-dev --no-interaction ;

    if [ ! -d "${vdo_root}/${doc_name}/${project_name}/vendor/drush/drush" ]; then
      cd ${vdo_root}/${doc_name}/${project_name};
      composer require drush/drush:~10;
    fi
  done

for version in {0..7..1}
  do
    progress_bar ${version} 7 ;

    project_name="varbase${drupal_version}${major_version}${version}";

    sudo chmod 775 -R ${vdo_root}/${doc_name}/${project_name} ;
    sudo chown www-data:${user_name} -R ${vdo_root}/${doc_name}/${project_name} ;
  done
  
sudo composer self-update --2 ;

for version in {8..11..1}
  do
    progress_bar ${version} 11 ;

    project_name="varbase${drupal_version}${major_version}${version}";

    if [ -d "${vdo_root}/${doc_name}/${project_name}" ]; then
      sudo rm -rf ${vdo_root}/${doc_name}/${project_name}
    fi

    full_database_name="${database_prefix}${project_name}";
    mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -v ;
    mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" -v;

    composer create-project vardot/varbase-project:${drupal_version}.${major_version}.${version} ${vdo_root}/${doc_name}/${project_name} --no-dev --no-interaction ;

    if [ ! -d "${vdo_root}/${doc_name}/${project_name}/vendor/drush/drush" ]; then
      cd ${vdo_root}/${doc_name}/${project_name};
      composer require drush/drush:~10;
    fi

  done

for version in {8..11..1}
  do
    progress_bar ${version} 11 ;

    project_name="varbase${drupal_version}${major_version}${version}";

    sudo chmod 775 -R ${vdo_root}/${doc_name}/${project_name} ;
    sudo chown www-data:${user_name} -R ${vdo_root}/${doc_name}/${project_name} ;
  done

cd ${vdo_root}/${doc_name} ;
