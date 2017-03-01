#! /bin/bash

lang='de'

for i in `find -L . -name *.info.yml`; do
    v=`grep -e '^version:' $i | cut -d" " -f2 | cut -d "'" -f2`
    p=`grep -e '^project:' $i | cut -d" " -f2 | cut -d "'" -f2`
    version=${v:0:1}
    if [ "$version" == "8" ]; then
	echo https://ftp-origin.drupal.org/files/translations/8.x/$p/$p-$v.$lang.po
    fi
done | sort | uniq | wget -P po/ -nc -i -

# Core has its version in lib/Drupal.php
for i in `find -L . -name Drupal.php`; do
    p='drupal'
    v=`grep 'const VERSION =' $i | sed -e's/ //g'|cut -d'=' -f2| cut -d"'" -f2`
    version=${v:0:1}
    if [ "$version" == "8" ]; then
	echo https://ftp-origin.drupal.org/files/translations/8.x/$p/$p-$v.$lang.po
    fi
done | sort | uniq | wget -P po/ -nc -i -
