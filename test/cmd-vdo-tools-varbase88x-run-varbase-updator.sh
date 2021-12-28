# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

sudo composer self-update --1 ;

for version in {0..7..1}
  do
    progress_bar ${version} 7 ;

    PROJECT_NAME="varbase${drupal_version}${major_version}${version}";

    if [ -d "${vdo_root}/${doc_name}/${PROJECT_NAME}" ]; then
      cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/${PROJECT_NAME} ;
      bash ./bin/update-varbase.sh
    fi

  done

for version in {0..7..1}
  do
    progress_bar ${version} 7 ;

    PROJECT_NAME="varbase${drupal_version}${major_version}${version}";

    if [ -d "${vdo_root}/${doc_name}/${PROJECT_NAME}" ]; then

      sudo chmod 775 -R ${vdo_root}/${doc_name}/${PROJECT_NAME} ;
      sudo chown www-data:${user_name} -R ${vdo_root}/${doc_name}/${PROJECT_NAME} ;
    fi

  done
  
sudo composer self-update --2 ;

for version in {0..7..1}
  do
    progress_bar ${version} 7 ;

    PROJECT_NAME="varbase${drupal_version}${major_version}${version}";

    if [ -d "${vdo_root}/${doc_name}/${PROJECT_NAME}" ]; then
      cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/${PROJECT_NAME} ;
      composer update -vvv ;

      sudo chmod 775 -R ${vdo_root}/${doc_name}/${PROJECT_NAME} ;
      sudo chown www-data:${user_name} -R ${vdo_root}/${doc_name}/${PROJECT_NAME} ;
    fi
  done

for version in {8..11..1}
  do
    progress_bar ${version} 11 ;

    PROJECT_NAME="varbase${drupal_version}${major_version}${version}";

    if [ -d "${vdo_root}/${doc_name}/${PROJECT_NAME}" ]; then
      cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/${PROJECT_NAME} ;
      bash ./bin/update-varbase.sh 
    fi

  done

for version in {8..11..1}
  do
    progress_bar ${version} 11 ;

    PROJECT_NAME="varbase${drupal_version}${major_version}${version}" ;

    if [ -d "${vdo_root}/${doc_name}/${PROJECT_NAME}" ]; then
      sudo chmod 775 -R ${vdo_root}/${doc_name}/${PROJECT_NAME} ;
      sudo chown www-data:${user_name} -R ${vdo_root}/${doc_name}/${PROJECT_NAME} ;
    fi

  done

cd ${vdo_root}/${doc_name} ;
