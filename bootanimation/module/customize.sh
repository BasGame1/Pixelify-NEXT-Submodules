#/system/sh

# Init the var with just a random value
SYSTEM=true

ui_print "[INFO] Checking installation folder"

if [ -f /system/media/bootanimation.zip ]; then
 SYSTEM=true
elif [ -f /product/media/bootanimation.zip ]; then
 SYSTEM=false
else
 abort "[ERROR] bootanimation dir could not be found, aborting"
fi

case $SYSTEM in
 true)
  ui_print "[INFO] bootanimation detected in system, moving files"
  mkdir -p $MODPATH/system/media  
  cp $MODPATH/bootanimation.zip $MODPATH/system/media  
 ;;
 false)
  ui_print "[INFO] bootanimation detected in product, moving files"
  mkdir -p $MODPATH/product/media
  cp $MODPATH/bootanimation.zip $MODPATH/product/media
 ;;
esac

ui_print "[SUCCESS] Bootanimation installed, enjoy it!"
