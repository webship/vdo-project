#!/bin/usr/env bash

# Add users to a project.
function add_users () {

  if [ ! -d "${vdo_root}/${doc_name}/${PROJECT_NAME}/vendor/drush/drush" ]; then
    cd ${vdo_root}/${doc_name}/${PROJECT_NAME};
    composer require drush/drush:~10;
  fi

  # Load the list of default users for the user list.
  eval $(parse_yaml ${vdo_config}/users/${USER_LIST_NAME}.users.yml);

  cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/${webroot}/;

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

  if [ ! -d "${vdo_root}/${doc_name}/${PROJECT_NAME}/vendor/drush/drush" ]; then
    cd ${vdo_root}/${doc_name}/${PROJECT_NAME};
    composer require drush/drush:~10;
  fi

  # Load the list of default users for the user list.
  eval $(parse_yaml ${vdo_config}/users/${USER_LIST_NAME}.users.yml);

  cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/${webroot}/;

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