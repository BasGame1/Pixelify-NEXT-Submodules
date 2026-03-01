. $MOPDATH/vars.sh

pm install $MODPATH/apks/dialer.apk

wait 10

if [ ! -z $(pm list packages -S $DIALER) ] && [ ! -z $(pm list packages -s $AICORE) ]; then
 rm -rf $MODPATH/service.sh
fi
	
