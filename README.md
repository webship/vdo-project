# VDO Project

The Visual Distribution Operator (VDO) management system helps
 Drupal 8 distribution maintainers manage the base code and logic
 for the work cycle of development with number of workspaces for
 custom profiles, sub-profiles on local development machines or servers.

[![VDO](https://www.drupal.org/files/project-images/VDO-logo.png)](https://www.drupal.org/project/vdo)

## Usage

First you need to [install composer](https://getcomposer.org/doc/00-intro.md#installation-linux-unix-osx).

> Note: The instructions below refer to the [global composer installation](https://getcomposer.org/doc/00-intro.md#globally).
You might need to replace `composer` with `php composer.phar` (or similar) 
for your setup.

### Please backup your /var/www/html and your mysql databases;
### Try VDO with new systems only.

After that you can create the project:

```
composer create-project webship/vdo-project:8.1.x-dev /var/www/html --stability dev --no-interaction
```

## Constructing your Linux development computer or servers with:


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

### TEST:

Where we do testing and functional automated testing.

```
    /var/www/html/test
```

### Demos:

Where we do all demos templates, and default content work on
 the distribution/profile.
```
    /var/www/html/demos
```

### Sandboxes:

Where we do all sandbox templates, and private custom content work.

```
    /var/www/html/sandboxes
```

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
