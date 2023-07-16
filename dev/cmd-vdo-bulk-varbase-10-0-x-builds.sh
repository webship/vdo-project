#!/bin/usr/env bash

bash cmd-vdo-varbase10-0-x-project.sh varbase10x1 --gleap --require="drupal/varbase_media_header:10.0.x-dev drupal/varbase_faqs:10.0.x-dev drupal/varbase_reports:10.0.x-dev drupal/varbase_youtube_import:1.x-dev vardot/varbase_vmi_demo:10.0.x-dev";
bash cmd-vdo-varbase10-0-x-project.sh varbase10x2 --gleap --require="drupal/varbase_media_header:10.0.x-dev drupal/varbase_faqs:10.0.x-dev drupal/varbase_reports:10.0.x-dev drupal/varbase_youtube_import:1.x-dev vardot/varbase_vmi_demo:10.0.x-dev";
bash cmd-vdo-varbase10-0-x-project.sh varbase10x3 --gleap --require="drupal/varbase_media_header:10.0.x-dev drupal/varbase_faqs:10.0.x-dev drupal/varbase_reports:10.0.x-dev drupal/varbase_youtube_import:1.x-dev vardot/varbase_vmi_demo:10.0.x-dev";
bash cmd-vdo-varbase10-0-x-project.sh varbase10x4 --gleap --require="drupal/varbase_media_header:10.0.x-dev drupal/varbase_faqs:10.0.x-dev drupal/varbase_reports:10.0.x-dev drupal/varbase_youtube_import:1.x-dev vardot/varbase_vmi_demo:10.0.x-dev";
bash cmd-vdo-varbase10-0-x-project.sh varbase10x5 --install --add-users --gleap --require="drupal/varbase_media_header:10.0.x-dev drupal/varbase_faqs:10.0.x-dev drupal/varbase_reports:10.0.x-dev drupal/varbase_youtube_import:1.x-dev vardot/varbase_vmi_demo:10.0.x-dev";
bash cmd-vdo-varbase10-0-x-project.sh varbase10x6 --install --add-users --gleap --require="drupal/varbase_media_header:10.0.x-dev drupal/varbase_faqs:10.0.x-dev drupal/varbase_reports:10.0.x-dev drupal/varbase_youtube_import:1.x-dev vardot/varbase_vmi_demo:10.0.x-dev " --enable="varbase_media_header varbase_faqs varbase_reports varbase_youtube_import varbase_media_default_content varbase_vmi_demo varbase_vmi_standard_demo varbase_gleap";

