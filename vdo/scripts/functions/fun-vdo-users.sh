#!/bin/usr/env bash

# Add users to a project.
function add_users () {

  # Add Drush if it was not in the system.
  add_drush ;

  cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/${distribution_webroot}/;

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

    ../vendor/drush/drush/drush user:create "${!user_name}" --mail="${!user_mail}" --password="${!user_password}" ;
    if [ "${!user_role}" == '_none_' ] ; then
      echo "   No user role for this user" ;
    else
      ../vendor/drush/drush/drush user:role:add "${!user_role}" "${!user_name}" ;
    fi
  done

  echo "Cache rebuilding ...";
  ../vendor/drush/drush/drush cache:rebuild ;

  cd ${vdo_root}/${doc_name};
}

# Cancle users from a project and delete their content.
function cancel_users () {

  # Add Drush if it was not in the system.
  add_drush ;

  cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/${distribution_webroot}/;

  for user in ${users[@]}
  do
    user_name="user_${user}_name";

    echo " ---------------------------------------------------------------- ";
    echo "      User name: ${!user_name}";
    echo " ================================================================= ";
    ../vendor/drush/drush/drush user:cancel --delete-content "${!user_name}" -y ;
  done

  echo "Cache rebuilding ...";
  ../vendor/drush/drush/drush cache:rebuild ;

  cd ${vdo_root}/${doc_name};
}