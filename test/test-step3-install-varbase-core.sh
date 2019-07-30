#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

project_name="no";

echo "*-----------------------------------------------------*";
echo "Test Step3 install Varbase core ";
echo "*-----------------------------------------------------*";



# echo "*-----------------------------------------------------*";
# echo "| Varbase VERSION";
# echo "*-----------------------------------------------------*";
# cd ${vdo_root}/${doc_name}/vVERSION_CODE/docroot/;
# project_name='vVERSION_CODE';
# full_database_name="test_${project_name}";
# mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
# mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv
#
# drush site-install varbase --yes --site-name=${project_name} --account-name=${account_name} --account-pass=d --account-mail="${account_mail}" --db-url="mysql://${database_username}:${database_password}@${database_host}/${full_database_name}" varbase_multilingual_configuration.enable_multilingual=true varbase_extra_components.vmi=true varbase_extra_components.varbase_heroslider_media=true varbase_extra_components.varbase_carousels=true varbase_extra_components.varbase_search=true varbase_extra_components.varbase_blog=true varbase_extra_components.varbase_auth=true varbase_development_tools.varbase_development=true ;

echo "*-----------------------------------------------------*";
echo "| Varbase 8.7.0";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80700/docroot/;
project_name='v80700';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv

drush site-install varbase --yes \
 --site-name=${project_name} \
 --account-name=${account_name} \
 --account-pass=d \
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

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.12";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80612/docroot/;
project_name='v80612';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv

drush site-install varbase --yes \
 --site-name=${project_name} \
 --account-name=${account_name} \
 --account-pass=d \
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


echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.11";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80611/docroot/;
project_name='v80611';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv

drush site-install varbase --yes \
 --site-name=${project_name} \
 --account-name=${account_name} \
 --account-pass=d \
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

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.10";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80610/docroot/;
project_name='v80610';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv

drush site-install varbase --yes \
 --site-name=${project_name} \
 --account-name=${account_name} \
 --account-pass=d \
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

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.9";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80609/docroot/;
project_name='v80609';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv

drush site-install varbase --yes \
 --site-name=${project_name} \
 --account-name=${account_name} \
 --account-pass=d \
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

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.8";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80608/docroot/;
project_name='v80608';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv


drush site-install varbase --yes \
 --site-name=${project_name} \
 --account-name=${account_name} \
 --account-pass=d \
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

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.7";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80607/docroot/;
project_name='v80607';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv


drush site-install varbase --yes \
 --site-name=${project_name} \
 --account-name=${account_name} \
 --account-pass=d \
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

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.6";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80606/docroot/;
project_name='v80606';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv


drush site-install varbase --yes \
 --site-name=${project_name} \
 --account-name=${account_name} \
 --account-pass=d \
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

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.5";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80605/docroot/;
project_name='v80605';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv


drush site-install varbase --yes \
 --site-name=${project_name} \
 --account-name=${account_name} \
 --account-pass=d \
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

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.4";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80604/docroot/;
project_name='v80604';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv


drush site-install varbase --yes \
 --site-name=${project_name} \
 --account-name=${account_name} \
 --account-pass=d \
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

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.3";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80603/docroot/;
project_name='v80603';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv


drush site-install varbase --yes \
 --site-name=${project_name} \
 --account-name=${account_name} \
 --account-pass=d \
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

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.2";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80602/docroot/;
project_name='v80602';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv


drush site-install varbase --yes \
 --site-name=${project_name} \
 --account-name=${account_name} \
 --account-pass=d \
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

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.1";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80601/docroot/;
project_name='v80601';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv


drush site-install varbase --yes \
 --site-name=${project_name} \
 --account-name=${account_name} \
 --account-pass=d \
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

echo "*-----------------------------------------------------*";
echo "| Varbase 8.6.0";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80600/docroot/;
project_name='v80600';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv


drush site-install varbase --yes \
 --site-name=${project_name} \
 --account-name=${account_name} \
 --account-pass=d \
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

echo "*-----------------------------------------------------*";
echo "| Varbase 8.5.5";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80505/docroot/;
project_name='v80505';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv


drush site-install varbase --yes \
 --site-name=${project_name} \
 --account-name=${account_name} \
 --account-pass=d \
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

echo "*-----------------------------------------------------*";
echo "| Varbase 8.4.28";
echo "*-----------------------------------------------------*";
cd ${vdo_root}/${doc_name}/v80600/docroot/;
project_name='v80428;
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv


drush site-install varbase --yes \
 --site-name=${project_name} \
 --account-name=${account_name} \
 --account-pass=d \
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

echo "*-----------------------------------------------------*";
echo "Done. Test Step3 install Varbase core ";
echo "*-----------------------------------------------------*";
