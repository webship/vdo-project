#!/bin/usr/env bash

drupal_version="8";
major_version="8";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

sudo composer self-update --1 ;

for version in {0..7..1}
  do
    progress_bar ${version} 7 ;

    project_name="varbase${drupal_version}${major_version}${version}";

    if [ -d "${vdo_root}/${doc_name}/${project_name}" ]; then

      # Change directory to the docroot.
      cd ${vdo_root}/${doc_name}/${project_name}/docroot;

      # Install Varbase with Drush.
      drush site:install varbase --yes --site-name="${doc_name} ${project_name}"  --account-name="${account_name}"  --account-pass="${account_pass}"  --account-mail="${account_mail}"  --db-url="mysql://${database_username}:${database_password}@${database_host}:${database_port}/${full_database_name}" --locale="en" varbase_multilingual_configuration.enable_multilingual=true varbase_extra_components.vmi=true varbase_extra_components.varbase_heroslider_media=true varbase_extra_components.varbase_carousels=true varbase_extra_components.varbase_search=true varbase_extra_components.varbase_blog=true varbase_extra_components.varbase_auth=true  install_configure_form.enable_update_status_emails=NULL -vvv;
      drush pm:enable varbase_development --yes ;
      drush pm:enable varbase_styleguide --yes ;
      drush pm:enable varbase_api --yes ;
      drush pm:enable varbase_content_planner --yes ;
      drush pm:enable varbase_media_instagram --yes ;
      drush pm:enable varbase_media_twitter --yes ;
      drush pm:enable social_auth_google --yes ;
      drush pm:enable social_auth_facebook --yes ;
      drush pm:enable social_auth_twitter --yes ;
      drush pm:enable social_auth_linkedin --yes ;
      drush config:set system.performance css.preprocess 0 --yes ;
      drush config:set system.performance js.preprocess 0 --yes ;
      drush config:set system.logging error_level all --yes ;
      drush cache:rebuild ;

      # Send a notification.
      echo "${doc_name} ${project_name} has been installed!!!!";
      echo  "Go to ${base_url}";
      cd ${vdo_root}/${doc_name};
    fi
  done

sudo composer self-update --2 ;

for version in {8..11..1}
  do
    progress_bar ${version} 11 ;

    project_name="varbase${drupal_version}${major_version}${version}";

    if [ -d "${vdo_root}/${doc_name}/${project_name}" ]; then


      # Change directory to the docroot.
      cd ${vdo_root}/${doc_name}/${project_name}/docroot;

      # Install Varbase with Drush.
      drush site:install varbase --yes --site-name="${doc_name} ${project_name}"  --account-name="${account_name}"  --account-pass="${account_pass}"  --account-mail="${account_mail}"  --db-url="mysql://${database_username}:${database_password}@${database_host}:${database_port}/${full_database_name}" --locale="en" varbase_multilingual_configuration.enable_multilingual=true varbase_extra_components.vmi=true varbase_extra_components.varbase_heroslider_media=true varbase_extra_components.varbase_carousels=true varbase_extra_components.varbase_search=true varbase_extra_components.varbase_blog=true varbase_extra_components.varbase_auth=true  install_configure_form.enable_update_status_emails=NULL -vvv;
      drush pm:enable varbase_development --yes ;
      drush pm:enable varbase_styleguide --yes ;
      drush pm:enable varbase_api --yes ;
      drush pm:enable varbase_content_planner --yes ;
      drush pm:enable varbase_media_instagram --yes ;
      drush pm:enable varbase_media_twitter --yes ;
      drush pm:enable social_auth_google --yes ;
      drush pm:enable social_auth_facebook --yes ;
      drush pm:enable social_auth_twitter --yes ;
      drush pm:enable social_auth_linkedin --yes ;
      drush config:set system.performance css.preprocess 0 --yes ;
      drush config:set system.performance js.preprocess 0 --yes ;
      drush config:set system.logging error_level all --yes ;
      drush cache:rebuild ;

      # Send a notification.
      echo "${doc_name} ${project_name} has been installed!!!!";
      echo  "Go to ${base_url}";
      cd ${vdo_root}/${doc_name};
    fi
  done

cd ${vdo_root}/${doc_name} ;
