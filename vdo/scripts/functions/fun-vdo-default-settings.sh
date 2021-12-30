#!/bin/usr/env bash

function set_default_settings() {
  echo "Add default settings file before starting the install.";

  cp ${vdo_root}/${doc_name}/${PROJECT_NAME}/${distribution_webroot}/sites/default/default.settings.php ${vdo_root}/${doc_name}/${PROJECT_NAME}/${distribution_webroot}/sites/default/settings.php ;
  echo "\$databases['default']['default'] = [
    'database' => '${full_database_name}',
    'username' => '${database_username}',
    'password' => '${database_password}',
    'host' => '${database_host}',
    'port' => '${database_port}',
    'namespace' => '${database_namespace}',
    'driver' => '${database_driver}',
    'prefix' => '',
    'collation' => '${database_collation}',
  ];" >> ${vdo_root}/${doc_name}/${PROJECT_NAME}/${distribution_webroot}/sites/default/settings.php ;

  # Create the config/sync folder.
  mkdir -p ${vdo_root}/${doc_name}/${PROJECT_NAME}/config/sync ;
  echo "\$settings['config_sync_directory'] = '${config_sync_directory}';" >> ${vdo_root}/${doc_name}/${PROJECT_NAME}/${distribution_webroot}/sites/default/settings.php ;

  vdo_build_time=$( date '+%Y-%m-%d %H-%M-%S' );
  echo "// VDO Built time: ${vdo_build_time}" >> ${vdo_root}/${doc_name}/${PROJECT_NAME}/${distribution_webroot}/sites/default/settings.php ;

}
