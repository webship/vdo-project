# VDO Project
[![Build Status](https://travis-ci.org/webship/vdo.svg?branch=9.0.0-alpha4)](https://travis-ci.com/github/webship/vdo/builds/233046847) VDO 9.0.0-alpha4

Helps Drupal developers manage base code development work cycle for custom distributions/profiles.
[![VDO](https://raw.githubusercontent.com/webship/vdo/9.0.x/images/logo.svg)](https://www.drupal.org/project/vdo)


### Please backup your /var/www/html and your mysql databases;
### Try VDO with new systems only.

## Constructing your Linux development computer or servers with:

![VDO index view](https://www.drupal.org/files/issues/2020-11-22/VDO-index-view_0.png)


### Products:

Where custom distributions/profiles base code are maintained.

```
    /var/www/html/products
```

### DEV:

Where development, enhancements, and optimization work rounds on the distribution/profile.

```
    /var/www/html/dev
```
![VDO DEV view](https://www.drupal.org/files/issues/2020-11-22/VDO-Development-index-view_0.png)

### TEST:

Where testing and functional automated testing on the distribution/profile.

```
    /var/www/html/test
```
![VDO Test view](https://www.drupal.org/files/issues/2020-11-22/VDO-Test-index-view.png)

### Demos:

Where all demos templates, and default content work on the distribution/profile.
```
    /var/www/html/demos
```
![VDO Demos view](https://www.drupal.org/files/issues/2020-11-22/VDO-Demos-index-view_0.png)

### Sandboxes:

Where all sandbox templates, and private custom content work on the distribution/profile.

```
    /var/www/html/sandboxes
```
![VDO index view](https://www.drupal.org/files/issues/2020-11-22/VDO-Sandboxes-index-view_0.png)

### Projects:

Where development on a project based on the distribution/profile product.

```
    /var/www/html/projects
```

### Profiles:

Where other contrib or private installation profiles are kept.
```
    /var/www/html/profiles
```

### Themes:

Where other contrib or private themes are kept.
```
    /var/www/html/themes
```

### Modules:

Where other contrib or private modules are kept.
```
    /var/www/html/modules
```

### VDO Configs and Scripts:

Where the general VDO configs and script libraries are kept.

```
    /var/www/html/vdo/web
```

### VDO Website:

Where the general VDO config and script libraries are kept.
Which a domain could points at it, like vdo.local or vdo.devhub.company-name.com

```
    /var/www/html/vdo/web
```

After Installing Ubuntu 21.04 for example you could run the following bash command to setup LAMP on Ubuntu 21.04
If you get the VDO bash files from

```
sudo -s
rm -rf /var/www/html
cd /var/www/
git clone --branch '9.0.x' https://github.com/webship/vdo-project.git
mv /var/www/vdo-project /var/www/html
cd /var/www/html/
rm -rf .git
composer install -vvv
rm -rf composer.lock composer.json
chmod 775 -R .
chown www-data:$USER -R .
```

Then you could edit the VDO config file to work for your system:
```
vim /var/www/html/vdo/config/vdo.settings.yml
```

you will see something like:
```
vdo:
  root: /var/www/html
  path: /var/www/html/vdo
  scripts: /var/www/html/vdo/scripts
  config: /var/www/html/vdo/config
  host: localhost
  web: http://localhost/vdo
  backups: /var/www/html/backups
database:
  username: DATABASE_USERNAME
  password: DATABASE_PASSWORD
  host: DATABASE_HOST
  port: 3306
  namespace: Drupal\\Core\\Database\\Driver\\mysql
  driver: mysql
  collation: utf8mb4_general_ci
account:
  name: DRUPAL_WEBMASTER_NAME
  pass: DRUPAL_WEBMASTER_PASSWORD
  mail: DRUPAL_WEBMASTER_EMIL
config_sync_directory: ../config/sync
workspaces:
  - products
  - dev
  - test
  - demos
  - sandboxes
  - profiles
  - modules
  - themes
  - libraries
  - forked
```

After you have made your changes you could install the global variables.
```
cd  /var/www/html/vdo/scripts/install
bash install.sh
```

Close all terminal windows
And open a new one
Test that we are ready by
```
echo ${vdo_config}
/var/www/html/vdo/config
```

If "/var/www/html/vdo/config" was printed,which mean we are ready for the next step.

Only for Ubuntu 21.04 you could run the follwoing command to setup your LAMP. ( You man install LAMP in your own. or copy the bash file change it to work for your system.)

```
cd /var/www/html/vdo/scripts/install/
bash setup-LAMP-ubuntu21-04--php7-04--MySQL8.sh
```

After that, you can do a composer install
```
cd /var/www/html/
composer install
```

Or you could build by composer create project command
Create a VDO Project 9.0.x with Composer
To install the most recent stable release of VDO 9.0.x run this command:
```
composer create-project webship/vdo-project:^9.0.0-alpha4 /var/www/html --no-dev --no-interaction
```

To install the dev version of VDO 9.0.x run this command:
```
composer create-project webship/vdo-project:9.0.x-dev /var/www/html --stability dev --no-interaction
```
Status message
After that delete the composer.josn and composer.lock file from your /var/www/html folder
```
cd /var/www/html/
rm composer.json composer.lock
```

To test that the VDO settings are working
If you go to DEV you can find many bash files that could help you in your development of the profile.
```
cd /var/www/html/dev/
bash cmd-vdo-drupal9-recommended-project.sh drupal9c1 --install
```

### Varbase disto for example:
```
cd /var/www/html/dev/
bash cmd-vdo-varbase9-project.sh varbase9c1 --install --add-users
```

### Create custom VDO bash:
Having a new dev or test bash files to add more work or commands in them. Add the heading in a new file then use any of the ready variables by the VDO bootstrap settings or the workspace settings or values.

### Example:
```
cd /var/www/html/dev/
vim cmd-vdo-example.sh
```

Then in the file, you could add the following:
```
#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.dev.settings.yml);

echo "*---------------------------------------------------------------------------------------*";
echo "|  Build Drupal Project  and add 100 modules in one command";
echo "*---------------------------------------------------------------------------------------*";
```

Have your own YML files. Read them in bash files as arraies of variables.And use them in custom bash file in the way you like:
```
eval $(parse_yaml ${path_to_the_yml_file}/name-of-file.yml);
```

Have a look at the number of bash files like the themes, profiles. or test in
https://github.com/webship/vdo-project
Learn by example. For sure have your naming or coding style or any language in the bash files, like python, C, PHP, or normal Bash.
