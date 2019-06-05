#!/bin/bash

lineageos=/media/android/lineageos

basketbuild="frantisheq.basketbuild.com,**** basketbuild.com"
webhost="frantisheq,**** files.000webhost.com"
nas="frantisheq,**** 192.168.1.110"

cd $lineageos

PATH=~/bin:$PATH

export TMPDIR=/home/frantisheq/.tmpdir
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4096m"
export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4096m"
export OUT_DIR_COMMON_BASE=/media/android/out
export USE_CCACHE=1


#repo sync --force-sync
source build/envsetup.sh

# MODS
#repopick -f 206768
#repopick -f 206769

# Battery mod
repopick -f 227142
repopick 237140
repopick 237141
repopick 237142

# JBL mod
repopick 237143

# Enable metadata for FDE
#repopick 243744
#repopick 243809

breakfast beckham
make installclean

source build/envsetup.sh
brunch beckham userdebug

#lftp -e "mrm beckham/lineage-16.0*beckham.zip*; ls beckham; mput -O beckham /media/android/out/lineageos/target/product/beckham/lineage-16.0*beckham.zip*; ls beckham; bye" -u $basketbuild
#lftp -e "set ftp:ssl-allow false; mrm web/LineageOTA/builds/full/lineage-16.0*beckham.zip*; ls web/LineageOTA/builds/full; mput -O web/LineageOTA/builds/full /media/android/out/lineageos/target/product/beckham/lineage-16.0*beckham.zip*; ls web/LineageOTA/builds/full; bye" -u $nas
#lftp -e "set ftp:ssl-allow false; mrm public_html/LineageOTA/builds/full/lineage-16.0*beckham.zip*; ls public_html/LineageOTA/builds/full; mput -O public_html/LineageOTA/builds/full /media/android/out/lineageos/target/product/beckham/lineage-16.0*beckham.zip*; ls public_html/LineageOTA/builds/full; bye" -u $webhost
