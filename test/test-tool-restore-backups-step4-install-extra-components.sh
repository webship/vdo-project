#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

echo "-----------------------------------------------------";
echo "Test Step4 install extra compoennts backups restore ";
echo "-----------------------------------------------------";

project_name="no";

echo "-----------------------------------------------------";
echo " Delete test Varbase folders";
echo "-----------------------------------------------------";

sudo rm -rf ${vdo_root}/test/v80700 ;

sudo rm -rf ${vdo_root}/test/v80612 ;
sudo rm -rf ${vdo_root}/test/v80611 ;
sudo rm -rf ${vdo_root}/test/v80610 ;
sudo rm -rf ${vdo_root}/test/v80609 ;
sudo rm -rf ${vdo_root}/test/v80608 ;
sudo rm -rf ${vdo_root}/test/v80607 ;
sudo rm -rf ${vdo_root}/test/v80606 ;
sudo rm -rf ${vdo_root}/test/v80605 ;
sudo rm -rf ${vdo_root}/test/v80604 ;
sudo rm -rf ${vdo_root}/test/v80603 ;
sudo rm -rf ${vdo_root}/test/v80602 ;
sudo rm -rf ${vdo_root}/test/v80601 ;
sudo rm -rf ${vdo_root}/test/v80600 ;


# echo "-----------------------------------------------------";
# echo "Varbase VERSION";
# echo "-----------------------------------------------------";
# tar -xzf ${vdo_backups}/test/step4-install-extra-components-backup-vVERSION_CODE.tar.gz  ${vdo_root}/test/vVERSION_CODE;
# project_name='vVERSION_CODE';
# full_database_name="test_${project_name}";
# mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
# mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv
# mysql -u${database_username} -p${database_password} ${full_database_name} < ${vdo_backups}/test/step4-install-extra-components-backup-${full_database_name}.sql

echo "-----------------------------------------------------";
echo "Varbase 8.7.0";
echo "-----------------------------------------------------";
tar -xzf ${vdo_backups}/test/step4-install-extra-components-backup-v80700.tar.gz  ${vdo_root}/test/v80700;
project_name='v80700';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} ${full_database_name} < ${vdo_backups}/test/step4-install-extra-components-backup-${full_database_name}.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.12";
echo "-----------------------------------------------------";
tar -xzf ${vdo_backups}/test/step4-install-extra-components-backup-v80612.tar.gz  ${vdo_root}/test/v80612;
project_name='v80612';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} ${full_database_name} < ${vdo_backups}/test/step4-install-extra-components-backup-${full_database_name}.sql


echo "-----------------------------------------------------";
echo "Varbase 8.6.11";
echo "-----------------------------------------------------";
tar -xzf ${vdo_backups}/test/step4-install-extra-components-backup-v80611.tar.gz  ${vdo_root}/test/v80611;
project_name='v80611';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} ${full_database_name} < ${vdo_backups}/test/step4-install-extra-components-backup-${full_database_name}.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.10";
echo "-----------------------------------------------------";
tar -xzf ${vdo_backups}/test/step4-install-extra-components-backup-v80610.tar.gz  ${vdo_root}/test/v80610;
project_name='v80610';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} ${full_database_name} < ${vdo_backups}/test/step4-install-extra-components-backup-${full_database_name}.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.9";
echo "-----------------------------------------------------";
tar -xzf ${vdo_backups}/test/step4-install-extra-components-backup-v80609.tar.gz  ${vdo_root}/test/v80609;
project_name='v80609';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} ${full_database_name} < ${vdo_backups}/test/step4-install-extra-components-backup-${full_database_name}.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.8";
echo "-----------------------------------------------------";
tar -xzf ${vdo_backups}/test/step4-install-extra-components-backup-v80608.tar.gz  ${vdo_root}/test/v80608;
project_name='v80608';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} ${full_database_name} < ${vdo_backups}/test/step4-install-extra-components-backup-${full_database_name}.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.7";
echo "-----------------------------------------------------";
tar -xzf ${vdo_backups}/test/step4-install-extra-components-backup-v80607.tar.gz  ${vdo_root}/test/v80607;
project_name='v80607';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} ${full_database_name} < ${vdo_backups}/test/step4-install-extra-components-backup-${full_database_name}.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.6";
echo "-----------------------------------------------------";
tar -xzf ${vdo_backups}/test/step4-install-extra-components-backup-v80606.tar.gz ${vdo_root}/test/v80606;
project_name='v80606';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} ${full_database_name} < ${vdo_backups}/test/step4-install-extra-components-backup-${full_database_name}.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.5";
echo "-----------------------------------------------------";
tar -xzf ${vdo_backups}/test/step4-install-extra-components-backup-v80605.tar.gz ${vdo_root}/test/v80605;
project_name='v80605';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} ${full_database_name} < ${vdo_backups}/test/step4-install-extra-components-backup-${full_database_name}.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.4";
echo "-----------------------------------------------------";
tar -xzf ${vdo_backups}/test/step4-install-extra-components-backup-v80604.tar.gz ${vdo_root}/test/v80604;
project_name='v80604';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} ${full_database_name} < ${vdo_backups}/test/step4-install-extra-components-backup-${full_database_name}.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.3";
echo "-----------------------------------------------------";
tar -xzf ${vdo_backups}/test/step4-install-extra-components-backup-v80603.tar.gz ${vdo_root}/test/v80603;
project_name='v80603';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} ${full_database_name} < ${vdo_backups}/test/step4-install-extra-components-backup-${full_database_name}.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.2";
echo "-----------------------------------------------------";
tar -xzf ${vdo_backups}/test/step4-install-extra-components-backup-v80602.tar.gz ${vdo_root}/test/v80602;
project_name='v80602';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} ${full_database_name} < ${vdo_backups}/test/step4-install-extra-components-backup-${full_database_name}.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.1";
echo "-----------------------------------------------------";
tar -xzf ${vdo_backups}/test/step4-install-extra-components-backup-v80601.tar.gz ${vdo_root}/test/v80601;
project_name='v80601';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} ${full_database_name} < ${vdo_backups}/test/step4-install-extra-components-backup-${full_database_name}.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.0";
echo "-----------------------------------------------------";
tar -xzf ${vdo_backups}/test/step4-install-extra-components-backup-v80600.tar.gz ${vdo_root}/test/v80600;
project_name='v80600';
full_database_name="test_${project_name}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} ${full_database_name} < ${vdo_backups}/test/step4-install-extra-components-backup-${full_database_name}.sql


echo "-----------------------------------------------------";
echo "Done. Test Step4 install extra compoennts backups restore ";
echo "-----------------------------------------------------";
