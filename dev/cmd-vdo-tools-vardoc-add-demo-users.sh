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


drush user:create "Normal user" --mail="test.authenticated@vardot.com" --password="dD.123123ddd" ;

drush user:create "Editor" --mail="test.editor@vardot.com" --password="dD.123123ddd" ;
drush user-add-role "editor" "Editor" ;

drush user:create "Content admin" --mail="test.content_admin@vardot.com" --password="dD.123123ddd" ;
drush user-add-role "content_admin" "Content admin" ;

drush user:create "SEO admin" --mail="test.seo_admin@vardot.com" --password="dD.123123ddd" ;
drush user-add-role "seo_admin" "SEO admin" ;

drush user:create "Site admin" --mail="test.site_admin@vardot.com" --password="dD.123123ddd" ;
drush user-add-role "site_admin" "Site admin" ;

drush user:create "Super admin" --mail="test.super_admin@vardot.com" --password="dD.123123ddd" ;
drush user-add-role "administrator" "Super admin" ;

echo "Cache rebuild";
drush cr ;

cd ${vdo_root}/${doc_name};