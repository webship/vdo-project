#!/usr/bin/env bash

echo '------------------------------------------------------------------------';
echo '  Git clone all Varbase projects for 8.x-7.x';
echo '------------------------------------------------------------------------';

cd /var/www/html/products/ ;

# Varbase project template.
# ------------------------------------------------------------------------------
if [ -d "varbase-project" ]; then rm -rf varbase-project; fi
git clone --branch 8.7.x git@github.com:Vardot/varbase-project.git ;
git remote rename origin github

# Platform.sh example Varbase project template.
# ------------------------------------------------------------------------------
if [ -d "platformsh-example-varbase" ]; then rm -rf platformsh-example-varbase; fi
git clone --branch master git@github.com:Vardot/platformsh-example-varbase.git ;
git remote rename origin github ;

# Varbase profile project.
# ------------------------------------------------------------------------------
if [ -d "varbase" ]; then rm -rf varbase; fi
git clone --branch 8.x-7.x git@git.drupal.org:project/varbase.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/varbase.git ;

# Varbase components.
# ------------------------------------------------------------------------------
if [ -d "varbase_core" ]; then rm -rf varbase_core; fi
git clone --branch 8.x-7.x git@git.drupal.org:project/varbase_core.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/varbase_core.git ;

if [ -d "varbase_api" ]; then rm -rf varbase_core; fi
git clone --branch 8.x-7.x git@git.drupal.org:project/varbase_api.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/varbase_api.git ;

if [ -d "varbase_email" ]; then rm -rf varbase_core; fi
git clone --branch 8.x-6.x git@git.drupal.org:project/varbase_email.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/varbase_email.git ;

if [ -d "varbase_media" ]; then rm -rf varbase_media; fi
git clone --branch 8.x-7.x git@git.drupal.org:project/varbase_media.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/varbase_media.git ;

if [ -d "varbase_editor" ]; then rm -rf varbase_editor; fi
git clone --branch 8.x-7.x git@git.drupal.org:project/varbase_editor.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/varbase_editor.git ;

if [ -d "varbase_auth" ]; then rm -rf varbase_auth; fi
git clone --branch 8.x-6.x git@git.drupal.org:project/varbase_auth.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/varbase_auth.git ;

if [ -d "varbase_blog" ]; then rm -rf varbase_blog; fi
git clone --branch 8.x-7.x git@git.drupal.org:project/varbase_blog.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/varbase_blog.git ;

if [ -d "varbase_bootstrap_paragraphs" ]; then rm -rf varbase_bootstrap_paragraphs; fi
git clone --branch 8.x-7.x git@git.drupal.org:project/varbase_bootstrap_paragraphs.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/varbase_bootstrap_paragraphs.git ;

if [ -d "varbase_landing" ]; then rm -rf varbase_landing; fi
git clone --branch 8.x-7.x git@git.drupal.org:project/varbase_landing.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/varbase_landing.git ;

if [ -d "varbase_carousels" ]; then rm -rf varbase_carousels; fi
git clone --branch 8.x-7.x git@git.drupal.org:project/varbase_carousels.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/varbase_carousels.git ;

if [ -d "varbase_heroslider_media" ]; then rm -rf varbase_heroslider_media; fi
git clone --branch 8.x-7.x git@git.drupal.org:project/varbase_heroslider_media.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/varbase_heroslider_media.git ;

if [ -d "varbase_search" ]; then rm -rf varbase_search; fi
git clone --branch 8.x-6.x git@git.drupal.org:project/varbase_search.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/varbase_search.git ;

if [ -d "varbase_seo" ]; then rm -rf varbase_seo; fi
git clone --branch 8.x-6.x git@git.drupal.org:project/varbase_seo.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/varbase_seo.git ;

if [ -d "varbase_total_control" ]; then rm -rf varbase_total_control; fi
git clone --branch 8.x-6.x git@git.drupal.org:project/varbase_total_control.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/varbase_total_control.git ;

if [ -d "varbase_styleguide" ]; then rm -rf varbase_styleguide; fi
git clone --branch 8.x-6.x git@git.drupal.org:project/varbase_styleguide.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/varbase_styleguide.git ;


# Varbase Themes.
# ------------------------------------------------------------------------------
if [ -d "vartheme" ]; then rm -rf vartheme; fi
git clone --branch 8.x-6.x git@git.drupal.org:project/vartheme.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/vartheme.git ;

if [ -d "vartheme_bs4" ]; then rm -rf vartheme; fi
git clone --branch 8.x-6.x git@git.drupal.org:project/vartheme_bs4.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/vartheme_bs4.git ;

if [ -d "vartheme_admin" ]; then rm -rf vartheme_admin; fi
git clone --branch 8.x-6.x git@git.drupal.org:project/vartheme_admin.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/vartheme_admin.git ;

# Varbase Features which are not included in varbase project.
# ------------------------------------------------------------------------------
if [ -d "varbase_faqs" ]; then rm -rf varbase_faqs; fi
git clone --branch 8.x-6.x git@git.drupal.org:project/varbase_faqs.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/varbase_faqs.git ;

if [ -d "varbase_reports" ]; then rm -rf varbase_reports; fi
git clone --branch 8.x-6.x git@git.drupal.org:project/varbase_reports.git ;
git remote rename origin drupal;
git remote add github git@github.com:Vardot/varbase_reports.git ;

# Varbase Demo projects.
# ------------------------------------------------------------------------------
if [ -d "varbase_vmi_demo" ]; then rm -rf varbase_vmi_demo; fi
git clone --branch 8.x-6.x git@github.com:Vardot/varbase_vmi_demo.git ;
git remote rename origin github;

if [ -d "varbase_story_demo" ]; then rm -rf varbase_story_demo; fi
git clone --branch 8.x-6.x git@github.com:Vardot/varbase_story_demo.git ;
git remote rename origin github;
