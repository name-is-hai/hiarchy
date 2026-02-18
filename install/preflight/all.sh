source $HIARCHY_INSTALL/preflight/guard.sh
source $HIARCHY_INSTALL/preflight/begin.sh
run_logged $HIARCHY_INSTALL/preflight/show-env.sh
run_logged $HIARCHY_INSTALL/preflight/yay.sh
run_logged $HIARCHY_INSTALL/preflight/pacman.sh
run_logged $HIARCHY_INSTALL/preflight/migrations.sh
run_logged $HIARCHY_INSTALL/preflight/first-run-mode.sh
run_logged $HIARCHY_INSTALL/preflight/disable-mkinitcpio.sh
