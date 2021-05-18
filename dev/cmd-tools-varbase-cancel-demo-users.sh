# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.dev.settings.yml);

# GET the project name argument.
if [ "$1" != "" ]; then
    project_name=$1;
else
  echo "Please add the name of your project.";
  exit 1;
fi

cd ${vdo_root}/${doc_name}/${project_name}/docroot/;

drush user:cancel --delete-content "Normal user" -y ;
drush user:cancel --delete-content "Editor" -y;
drush user:cancel --delete-content "Content admin" -y;
drush user:cancel --delete-content "SEO admin" -y;
drush user:cancel --delete-content "Super admin" -y;

echo "Cache rebuild";
drush cr ;

cd ${vdo_root}/${doc_name};
