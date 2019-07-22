
# Building and data generating for testing.
test-step1-composer-create-project.sh
test-step2-composer-add-extra-varbase-components.sh
test-step3-install-varbase-core.sh
test-step4-install-extra-components.sh
test-step5-drush-generate-full-data.sh

# Backups after each step.
test-backups-step3-install-varbase-core.sh
test-backups-step4-install-extra-components.sh
test-backups-step5-full-data.sh
test-backups-step6-after-file-update.sh

# Restore. to re-test with any step.
test-restore-backups-step3-install-varbase-core.sh
test-restore-backups-step4-install-extra-components.sh
test-restore-backups-step5-full-data.sh
test-restore-backups-step6-after-file-update.sh

