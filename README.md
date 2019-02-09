# Download MoKee repo
mkdir mokee  
cd mokee  
repo init -u https://github.com/MoKee/android.git -b mkp  

# Add Lenovo Vibe Z2 Pro device tree to local_manifests
mkdir .repo/local_manifests  
cp kingdom.xml .repo/local_manifests  

# Download sources
repo sync  

# Fix pn547 NFC on Android 9  
cd hardware/nxp/nfc  
git fetch https://github.com/LineageOS/android_hardware_nxp_nfc refs/changes/27/239927/1 && git cherry-pick FETCH_HEAD  
cd ../../..  

# Build
source build/envsetup.sh  
brunch kingdom  
