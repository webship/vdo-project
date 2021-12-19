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
      cd ${vdo_root}/${doc_name}/${project_name} ;
      composer require drush/drush:~10;
    fi
    
  done

for version in {0..7..1}
  do
    progress_bar ${version} 7 ;

    project_name="varbase${drupal_version}${major_version}${version}";

    sudo chmod 775 -R ${vdo_root}/${doc_name}/${project_name} ;
    sudo chown www-data:${user_name} -R ${vdo_root}/${doc_name}/${project_name} ;

    cd ${vdo_root}/${doc_name}/${project_name};
    ${vdo_root}/${doc_name}/${project_name}/bin/drush cr ;

  done
  
sudo composer self-update --2 ;

for version in {8..11..1}
  do
    progress_bar ${version} 11 ;

    project_name="varbase${drupal_version}${major_version}${version}";

    if [ -d "${vdo_root}/${doc_name}/${project_name}" ]; then
      cd ${vdo_root}/${doc_name}/${project_name} ;
      composer require drush/drush:~10;
    fi

  done

for version in {8..11..1}
  do
    progress_bar ${version} 11 ;

    project_name="varbase${drupal_version}${major_version}${version}";

    sudo chmod 775 -R ${vdo_root}/${doc_name}/${project_name} ;
    sudo chown www-data:${user_name} -R ${vdo_root}/${doc_name}/${project_name} ;

    cd ${vdo_root}/${doc_name}/${project_name};
    ${vdo_root}/${doc_name}/${project_name}/bin/drush cr ;
    
  done

cd ${vdo_root}/${doc_name} ;
