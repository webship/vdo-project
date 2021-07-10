# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.demos.settings.yml);

# GET the project name argument.
if [ "$1" != "" ]; then
    project_name=$1;
else
  echo "Please add the name of your project.";
  exit 1;
fi

# GET the user list name argument.
if [ "$2" != "" ]; then
    user_list_name=$2;
else
  echo "Please add the user list name for the project. And make sure that all user roles are in the project";
  exit 1;
fi

if [ ! -d "${vdo_root}/${doc_name}/${project_name}/vendor/drush/drush" ]; then
  cd ${vdo_root}/${doc_name}/${project_name};
  composer require drush/drush:~10;
fi

# Load the list of default users for the user list.
eval $(parse_yaml ${vdo_config}/users/${user_list_name}.users.yml);

cd ${vdo_root}/${doc_name}/${project_name}/docroot/;

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

    ../bin/drush user:create "${!user_name}" --mail="${!user_mail}" --password="${!user_password}" ;
    if [ ! -z "${!user_role}" ]; then
      ../bin/drush user:role:add "${!user_role}" "${!user_name}" ;
    fi
done

echo "Start Cache rebuilding ...";
../bin/drush cache:rebuild ;


cd ${vdo_root}/${doc_name};