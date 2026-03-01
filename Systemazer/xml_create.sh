#!/bin/bash
. $MODPATH/vars.sh || abort "Could not load variable file"
APK=$1
APK_PATH=$2
APK_CUT=$(echo $APK | rev | cut -d '.' -f 2- | rev)

if [[ $APK == 'help' ]] || [[ -z $APK ]]; then
  echo ""
  echo "----------------HELP MENU-----------------"
  echo "Usage: $0 <apk name> <apk path>"
  echo 'This script creates a folder on this'
  echo 'directory called "output" and it WILL'
  echo 'delete any other folder with that name'
  echo "------------------------------------------"
else

# This script WILL DELETE any folder called output on this direcotry, be careful

rm -rf $MODPATH/xml
mkdir $MODPATH/xml
touch $MODPATH/xml/privapp-permissions-$APK_CUT.xml
touch $MODPATH/tmp
MANIFEST2=$(aapt dump badging $APK | grep "uses-permission" | cut -d ' ' -f 2 | cut -d "'" -f 2)
MANIFEST=$(aapt dump xmltree $APK AndroidManifest.xml | grep -A 1 "A:" | grep "android:permission" | cut -d '"' -f 2)

echo "$MANIFEST2" >> $MODPATH/xml/tmp
echo '<?xml version="1.0" encoding="utf-8"?>' >> $MODPATH/xml/privapp-permissions-$APK_CUT.xml
echo "<!-- XML file craeted automatically via Systemazer script -->" >> $MODPATH/xml/privapp-permissions-$APK_CUT.xml
echo "<permissions>" >> $MODPATH/xml/privapp-permissions-$APK_CUT.xml
echo -n '<privapp-permissions package="' >> $MODPATH/xml/privapp-permissions-$APK_CUT.xml; echo -n $APK_CUT >> output/privapp-permissions-$APK_CUT.xml; echo '">' >> output/privapp-permissions-$APK_CUT.xml

while IFS= read -r LINE; do
  echo -n '<permissions name="' >> $MODPATH/xml/privapp-permissions-$APK_CUT.xml && echo -n $LINE >> output/privapp-permissions-$APK_CUT.xml &&  echo '">' >> output/privapp-permissions-$APK_CUT.xml
done < tmp
rm -rf tmp

echo "</privapp-permissions>" >> $MODPATH/xml/privapp-permissions-$APK_CUT.xml
echo "</permissions>" >> $MODPATH/xml/privapp-permissions-$APK_CUT.xml
echo "Script finished with status 0, your privapp-permissions file it is on xml/privapp-permissions-$APK_CUT.xml"
fi
