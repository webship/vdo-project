#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

echo "-----------------------------------------------------";
echo "Test Step5 full data backups ";
echo "-----------------------------------------------------";

rm -rf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80700.tar.gz ;

rm -rf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80612.tar.gz ;
rm -rf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80611.tar.gz ;
rm -rf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80610.tar.gz ;
rm -rf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80609.tar.gz ;
rm -rf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80608.tar.gz ;
rm -rf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80607.tar.gz ;
rm -rf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80606.tar.gz ;
rm -rf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80605.tar.gz ;
rm -rf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80604.tar.gz ;
rm -rf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80603.tar.gz ;
rm -rf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80602.tar.gz ;
rm -rf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80601.tar.gz ;
rm -rf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80600.tar.gz ;

# echo "-----------------------------------------------------";
# echo "Varbase VERSION";
# echo "-----------------------------------------------------";
# cp -r ${vdo_root}/${doc_name}/vVERSION_CODE ${vdo_backups}/${doc_name}/step5-full-data-backups-vVERSION_CODE;
# mysqldump -u${database_username} -p${database_password} test_vVERSION_CODE > ${vdo_backups}/${doc_name}/step5-full-data-backups-test_vVERSION_CODE.sql

echo "-----------------------------------------------------";
echo "Varbase 8.7.0";
echo "-----------------------------------------------------";
tar -czf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80700.tar.gz ${vdo_root}/${doc_name}/v80700 ;
mysqldump -u${database_username} -p${database_password} test_v80700 > ${vdo_backups}/${doc_name}/step5-full-data-backups-test_v80700.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.12";
echo "-----------------------------------------------------";
tar -czf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80612.tar.gz ${vdo_root}/${doc_name}/v80612 ;
mysqldump -u${database_username} -p${database_password} test_v80612 > ${vdo_backups}/${doc_name}/step5-full-data-backups-test_v80612.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.11";
echo "-----------------------------------------------------";
tar -czf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80611.tar.gz ${vdo_root}/${doc_name}/v80611 ;
mysqldump -u${database_username} -p${database_password} test_v80611 > ${vdo_backups}/${doc_name}/step5-full-data-backups-test_v80611.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.10";
echo "-----------------------------------------------------";
tar -czf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80610.tar.gz ${vdo_root}/${doc_name}/v80610 ;
mysqldump -u${database_username} -p${database_password} test_v80610 > ${vdo_backups}/${doc_name}/step5-full-data-backups-test_v80610.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.9";
echo "-----------------------------------------------------";
tar -czf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80609.tar.gz ${vdo_root}/${doc_name}/v80609 ;
mysqldump -u${database_username} -p${database_password} test_v80609 > ${vdo_backups}/${doc_name}/step5-full-data-backups-test_v80609.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.8";
echo "-----------------------------------------------------";
tar -czf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80608.tar.gz ${vdo_root}/${doc_name}/v80608 ;
mysqldump -u${database_username} -p${database_password} test_v80608 > ${vdo_backups}/${doc_name}/step5-full-data-backups-test_v80608.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.7";
echo "-----------------------------------------------------";
tar -czf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80607.tar.gz ${vdo_root}/${doc_name}/v80607 ;
mysqldump -u${database_username} -p${database_password} test_v80607 > ${vdo_backups}/${doc_name}/step5-full-data-backups-test_v80607.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.6";
echo "-----------------------------------------------------";
tar -czf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80606.tar.gz ${vdo_root}/${doc_name}/v80606 ;
mysqldump -u${database_username} -p${database_password} test_v80606 > ${vdo_backups}/${doc_name}/step5-full-data-backups-test_v80606.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.5";
echo "-----------------------------------------------------";
tar -czf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80605.tar.gz ${vdo_root}/${doc_name}/v80605 ;
mysqldump -u${database_username} -p${database_password} test_v80605 > ${vdo_backups}/${doc_name}/step5-full-data-backups-test_v80605.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.4";
echo "-----------------------------------------------------";
tar -czf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80604.tar.gz ${vdo_root}/${doc_name}/v80604 ;
mysqldump -u${database_username} -p${database_password} test_v80604 > ${vdo_backups}/${doc_name}/step5-full-data-backups-test_v80604.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.3";
echo "-----------------------------------------------------";
tar -czf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80603.tar.gz ${vdo_root}/${doc_name}/v80603 ;
mysqldump -u${database_username} -p${database_password} test_v80603 > ${vdo_backups}/${doc_name}/step5-full-data-backups-test_v80603.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.2";
echo "-----------------------------------------------------";
tar -czf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80602.tar.gz ${vdo_root}/${doc_name}/v80602 ;
mysqldump -u${database_username} -p${database_password} test_v80602 > ${vdo_backups}/${doc_name}/step5-full-data-backups-test_v80602.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.1";
echo "-----------------------------------------------------";
tar -czf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80601.tar.gz ${vdo_root}/${doc_name}/v80601 ;
mysqldump -u${database_username} -p${database_password} test_v80601 > ${vdo_backups}/${doc_name}/step5-full-data-backups-test_v80601.sql

echo "-----------------------------------------------------";
echo "Varbase 8.6.0";
echo "-----------------------------------------------------";
tar -czf ${vdo_backups}/${doc_name}/step5-full-data-backups-v80600.tar.gz ${vdo_root}/${doc_name}/v80600 ;
mysqldump -u${database_username} -p${database_password} test_v80600 > ${vdo_backups}/${doc_name}/step5-full-data-backups-test_v80600.sql


echo "-----------------------------------------------------";
echo "Done. Step5 full data backups  ";
echo "-----------------------------------------------------";
