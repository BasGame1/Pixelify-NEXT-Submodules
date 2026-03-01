#!/system/sh
. $MODPATH/vars.sh || abort
echo "__________.__              .__  .__  _____       ";
echo "\\______   \\__|__  ___ ____ |  | |__|/ ____\\__.__.";
echo " |     ___/  \\  \\/  // __ \\|  | |  \\   __<   |  |";
echo " |    |   |  |>    <\\  ___/|  |_|  ||  |  \\___  |";
echo " |____|   |__/__/\\_ \\\\___  >____/__||__|  / ____|";
echo "                   \\/    \\/               \\/     ";
echo " _______  _______________  ______________        ";
echo " \\      \\ \\_   _____/\\   \\/  /\\__    ___/        ";
echo " /   |   \\ |    __)_  \\     /   |    |           ";
echo "/    |    \\|        \\ /     \\   |    |           ";
echo "\\____|__  /_______  //___/\\  \\  |____|           ";
echo "        \\/        \\/       \\_/                   ";

echo ""
if [ -f $DIALER_APK ]; then
	echo "Dialer already a system app"
	echo "Checking for dialer prof"
	if [ -f $DIALER_PATH/GoogleDialer.apk.prof ]; then
	 echo "Dialer Prof found, deleting"
	 rm -rf $DIALER_PATH/GoogleDialer.apk.prof
	fi
	 rm -rf $MODPATH/system
else
	echo "Making Google Dialer a system app"
	if [ ! -z $(pm list packages -s $DIALER) ]; then
		echo "Uninstalling google dialer user app"
		pm uninstall $DIALER
		echo "PD: It will be reinstalled at reboot"
	fi
	if [ -z $(pm list packages | grep -iE "aicore") ]; then
		echo "Aicore not found, installing in the next reboot"
		echo "$MODPATH/install.APK.sh aicore.apkm $MODPATH/apks/aicore.apkm" >> $MOPDATH/service.sh
	else
		echo "Aicore found, deleting stub"
		rm -rf $MODPATH/$AICORE_APK
	fi
fi
