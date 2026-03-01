echo "  __________________.__            __                ";
echo " /  _____/\\______   \\  |__   _____/  |_  ____  ______";
echo "/   \\  ___ |     ___/  |  \\ /  _ \\   __\\/  _ \\/  ___/";
echo "\\    \\_\\  \\|    |   |   Y  (  <_> )  | (  <_> )___ \\ ";
echo " \\______  /|____|   |___|  /\\____/|__|  \\____/____  >";
echo "        \\/               \\/                       \\/ ";

if [ "$ARCH" == "arm64" ] || [ "$ARCH" == "arm64-v8a" ]; then
 rm -rf $MODPATH/lib/armeabi-v7a
 mv $MODPATH/lib $MODPATH/zygisk
 mv $MODPATH/zygisk/libpixelify-next-gphotos.so $MODPATH/zygisk/arm64-v8a.so
elif [ "$ARCH" == "arm32" ] || [ "$ARCH" == "armabi-v7a" ]; then
 rm -rf $MODPATH/lib/arm64-v8a
 mv $MODPATH/lib $MODPATH/zygisk
 mv $MODPATH/zygisk/libpixelify-next-gphotos.so $MODPATH/zygisk/armabi-v7a.so
else 
 abort "$ARCH its nor supported"
fi
	
