#!/usr/bin/env bash

# Download Drupal
cd /drupal
drush dl drupal --drupal-project-rename=docroot
cd docroot

# Install ChromePhp
/usr/local/bin/composer self-update
composer require ccampbell/chromephp

# Install Node
sudo apt-get update
sudo apt-get install nodejs npm
sudo ln -s /usr/bin/nodejs /usr/local/bin/node
sudo ln -s /usr/bin/npm /usr/local/bin/npm

# Install gulp
sudo npm install -g gulp

# Download modules
drush dl admin_toolbar
drush dl devel
drush dl styleguide
drush dl coder
drush dl examples
drush dl config_update
drush dl features
drush dl migrate_plus
drush dl migrate_tools
drush dl token
drush dl ctools
drush dl masquerade
drush dl stage_file_proxy
drush dl devel_debug_log
drush dl hacked
drush dl vardumper
drush dl delete_all
drush dl ld
drush dl fortytwo_admin_toolbar
drush dl inspect
drush dl debug_bar
drush dl console_logger

# Download themes
drush dl omega
drush dl fortytwo


# Site install
cd /drupal/docroot/
drush si standard --db-url=mysql://root:root@localhost:3306/drupal8 --site-name=Drupal dev --account-pass=admin -y
