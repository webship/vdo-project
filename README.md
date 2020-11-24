# VDO Project
[![Build Status](https://travis-ci.org/webship/vdo.svg?branch=9.0.0-alpha3)](https://travis-ci.com/github/webship/vdo/builds/203694978) VDO 9.0.0-alpha3

The Visual Distribution Operator (VDO) management system helps
 distribution maintainers manage the base code and logic
 for the work cycle of development with number of workspaces for
 custom profiles, sub-profiles on local development machines or servers.

[![VDO](https://raw.githubusercontent.com/webship/vdo/9.0.x/images/logo.svg)](https://www.drupal.org/project/vdo)

## Usage

First you need to [install composer](https://getcomposer.org/doc/00-intro.md#installation-linux-unix-osx).

> Note: The instructions below refer to the [global composer installation](https://getcomposer.org/doc/00-intro.md#globally).
You might need to replace `composer` with `php composer.phar` (or similar) 
for your setup.

### Please backup your /var/www/html and your mysql databases;
### Try VDO with new systems only.

To install the most recent stable release of VDO 9.0.x run this command:
```
composer create-project webship/vdo-project:^9.0.0-alpha3 /var/www/html --no-dev --no-interaction
```

To install the dev version of VDO 9.0.x run this command:
```
composer create-project webship/vdo-project:9.0.x-dev /var/www/html --stability dev --no-interaction
```

### After that delete the composer.josn and composer.lock file from your /var/www/html folder

## Constructing your Linux development computer or servers with:



![VDO index view](https://www.drupal.org/files/issues/2020-11-22/VDO-index-view_0.png)


### Products:

Where we do maintain our custom distributions/profiles base code.

```
    /var/www/html/products
```

### DEV:

Where we do development, enhancements, and optimization work rounds
 on the distribution/profile.

```
    /var/www/html/dev
```
![VDO DEV view](https://www.drupal.org/files/issues/2020-11-22/VDO-Development-index-view_0.png)

### TEST:

Where we do testing and functional automated testing.

```
    /var/www/html/test
```
![VDO Test view](https://www.drupal.org/files/issues/2020-11-22/VDO-Test-index-view.png)

### Demos:

Where we do all demos templates, and default content work on
 the distribution/profile.
```
    /var/www/html/demos
```
![VDO Demos view](https://www.drupal.org/files/issues/2020-11-22/VDO-Demos-index-view_0.png)

### Sandboxes:

Where we do all sandbox templates, and private custom content work.

```
    /var/www/html/sandboxes
```
![VDO index view](https://www.drupal.org/files/issues/2020-11-22/VDO-Sandboxes-index-view_0.png)

### Projects:

Where we do development on projects.

```
    /var/www/html/projects
```

### Profiles:

Where we do keep other contrib or private installation profiles.
```
    /var/www/html/profiles
```

### Themes:

Where we do keep other contrib or private themes.
```
    /var/www/html/themes
```

### Modules:

Where we do keep other contrib or private modules.
```
    /var/www/html/modules
```

### VDO:

Where we do keep our VDO manager.
Which you could have a domain points at it, like vdo.local
 or vdo.devhub.company-name.com

```
    /var/www/html/vdo
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
account:
    name: DRUPAL_WEBMASTER_NAME
    pass: DRUPAL_WEBMASTER_PASSWORD
    mail: DRUPAL_WEBMASTER_EMIL
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
vim /var/www/html/vdo/scripts/install/install.sh
bash /var/www/html/vdo/scripts/install/install.sh
```
