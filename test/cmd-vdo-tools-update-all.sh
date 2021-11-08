# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

for project in *; do
    if [ -d "$project" ]; then
    echo "===========================================";
    echo "  $project";
    echo "===========================================";
	cd ${vdo_root}/${doc_name}/${project};
	composer update --no-interaction -vvv ;
    fi
done
