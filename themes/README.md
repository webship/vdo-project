# Themes
--

To Build all front-end themes:
```
bash cmd-vdo-all-front-end-build-themes.sh
```


To Install all front-end themes:
```
bash cmd-vdo-all-front-end-install-themes.sh
```


To Build all back-end themes:
```
bash cmd-vdo-all-back-end-build-themes.sh
```


To Install all back-end themes:
```
bash cmd-vdo-all-back-end-install-themes.sh
```


To build one theme:
You will need to have the template_drupal site.
if you do not have it you could run the following command

```
bash cmd-vdo-build-drupal-template.sh
```
and then you could build the theme using the templage_drupal site copy 
with the same name of the theme and install the theme init.

```
bash cmd-vdo-build-theme.sh THEME_NAME
```
Where THEME_NAME is the name of the theme in Drupal.org

To Install a theme site:
```
bash cmd-vdo-install-theme.sh THEME_NAME
```

