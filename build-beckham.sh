#!/bin/bash

lineageos=/home/frantisheq/Documents/android/lineageos-16.0

basketbuild="frantisheq.basketbuild.com,**** basketbuild.com"
webhost="frantisheq,**** files.000webhost.com"

cd $lineageos

export TMPDIR=/home/frantisheq/.tmpdir

repo sync --force-sync
source build/envsetup.sh

#battery mod
repopick -f 227142
repopick 237140
repopick 237141
repopick 237142

breakfast beckham
make installclean

source build/envsetup.sh
brunch beckham

lftp -e "mrm beckham/lineage-16.0*beckham.zip*; ls beckham; mput -O beckham /home/frantisheq/Documents/android/lineageos-16.0/out/target/product/beckham/lineage-16.0*beckham.zip*; ls beckham; bye" -u $basketbuild
lftp -e "mrm public_html/LineageOTA/builds/full/lineage-16.0*beckham.zip*; ls public_html/LineageOTA/builds/full; mput -O public_html/LineageOTA/builds/full /home/frantisheq/Documents/android/lineageos-16.0/out/target/product/beckham/lineage-16.0*beckham.zip*; ls public_html/LineageOTA/builds/full; bye" -u $webhost
