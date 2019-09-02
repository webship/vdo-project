#!/bin/usr/env bash

drupal_version="8";
major_version="6";



# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);


for version in {0..13..1}
  do
    progress_bar ${version} 13 ;
    project_name="varbase${drupal_version}${major_version}${version}";
    project_path="${doc_path}/${project_name}";

    if [ -d "${project_path}" ]; then
      sudo rm -rf ${project_path}
    fi

    full_database_name="${database_prefix}${project_name}";
    mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
    mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"

    composer create-project vardot/varbase-project:${drupal_version}.${major_version}.${version} ${project_path} --no-dev --no-interaction ;
  done

for version in {0..13..1}
  do
    progress_bar ${version} 13 ;
    project_name="varbase${drupal_version}${major_version}${version}";
    project_path="${doc_path}/${project_name}";

    sudo chmod 775 -R ${project_path}
    sudo chown www-data:${user_name} -R ${project_path}
  done

for version in {0..13..1}
  do
    progress_bar ${version} 13 ;
    project_name="varbase${drupal_version}${major_version}${version}";
    project_path="${doc_path}/${project_name}";
    full_database_name="${database_prefix}${project_name}";

    cd ${project_path}/docroot ;

    drush site-install varbase --yes \
    --site-name=${project_name} \
    --account-name=${account_name} \
    --account-pass="${account_pass}" \
    --account-mail="${account_mail}" \
    --db-url="mysql://${database_username}:${database_password}@${database_host}/${full_database_name}" \
    varbase_multilingual_configuration.enable_multilingual=true \
    varbase_extra_components.vmi=true \
    varbase_extra_components.varbase_heroslider_media=true \
    varbase_extra_components.varbase_carousels=true \
    varbase_extra_components.varbase_search=true \
    varbase_extra_components.varbase_blog=true \
    varbase_extra_components.varbase_auth=true \
    varbase_development_tools.varbase_development=true ;

    drush pm-enable varbase_styleguide --yes
    drush pm-enable vbp_text_and_image --yes
    drush pm-enable varbase_media_instagram --yes
    drush pm-enable varbase_media_twitter --yes
    drush pm-enable social_auth_google --yes
    drush pm-enable social_auth_facebook --yes
    drush pm-enable social_auth_twitter --yes
    drush pm-enable social_auth_linkedin --yes
    drush config-set system.performance css.preprocess 0 --yes
    drush config-set system.performance js.preprocess 0 --yes
    drush config-set system.logging error_level all --yes
    drush cr
  done

for version in {0..13..1}
  do
    progress_bar ${version} 13 ;
    project_name="varbase${drupal_version}${major_version}${version}";
    project_path="${doc_path}/${project_name}";

    sudo chmod 775 -R ${project_path}
    sudo chown www-data:${user_name} -R ${project_path}
  done
