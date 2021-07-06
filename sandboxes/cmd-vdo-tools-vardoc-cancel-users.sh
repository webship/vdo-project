# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.sandboxes.settings.yml);

# GET the project name argument.
if [ "$1" != "" ]; then
    project_name=$1;
else
  echo "Please add the name of your project.";
  exit 1;
fi

cd ${vdo_root}/${doc_name}/${project_name}/docroot/;


if [ ! -d "${vdo_root}/${doc_name}/${project_name}/vendor/drush/drush" ]; then
  cd ${vdo_root}/${doc_name}/${project_name};
  composer require drush/drush:~10;
fi

# Load the list of default users for vardoc.
eval $(parse_yaml ${vdo_config}/users/vardoc.users.yml);

cd ${vdo_root}/${doc_name}/${project_name}/docroot/;

for user in "${vardoc_users[@]}"
do
    user_name="user_${user}_name";

    echo " ---------------------------------------------------------------- ";
    echo "      User name: ${!user_name}";
    echo " ================================================================= ";
    ../bin/drush user:cancel --delete-content "${!user_name}" -y ;
done

echo "Start Cache rebuilding ...";
../bin/drush cache:rebuild ;


cd ${vdo_root}/${doc_name};