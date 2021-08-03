#!/bin/usr/env bash

drupal_version="8";
major_version="8";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);


for version in {0..11..1}
  do
    progress_bar ${version} 11 ;

    project_name="varbase${drupal_version}${major_version}${version}";

    if [ -d "${vdo_backups}/${doc_name}/${project_name}" ]; then
      sudo rm -rf ${vdo_backups}/${doc_name}/${project_name} ;
    fi

    tar -xvzf ${vdo_backups}/${doc_name}/${doc_name}---${project_name}.tar.gz ${vdo_root}/${doc_name}/${project_name} ;

    full_database_name="${database_prefix}${project_name}";
    mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -v ;
    mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" -v ;

    mysql -u${database_username} -p${database_password} ${full_database_name} < ${vdo_backups}/${doc_name}/${doc_name}---${project_name}.sql ;

  done

for version in {0..11..1}
  do
    progress_bar ${version} 11 ;

    project_name="varbase${drupal_version}${major_version}${version}";

    sudo chmod 775 -R ${vdo_root}/${doc_name}/${project_name} ;
    sudo chown www-data:${user_name} -R ${vdo_root}/${doc_name}/${project_name} ;
    
  done

for version in {0..11..1}
  do
    progress_bar ${version} 11 ;

    project_name="varbase${drupal_version}${major_version}${version}";

    cd ${vdo_root}/${doc_name}/${project_name}/docroot ;
    drush cr ;
  done

cd ${vdo_root}/${doc_name} ;
