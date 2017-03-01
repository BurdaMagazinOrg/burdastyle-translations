# PO files for Burda websites

This repo contains PO files that have been downloaded from localize.drupal.org for use by the various Drupal sites run by Burda.

# update_po.sh

This script can be used to donwload translation files from localize.drupal.org. It does not require a Drupal install. To use it, create one or several symbolic links to directories containing Drupal installs that you want to download translations for. Then run the script in the directory it is located in, it should download all translation files that are not yet in the po subdirectory into that directory.
