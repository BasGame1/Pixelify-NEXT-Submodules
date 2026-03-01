AAPT=$MODPATH/aapt/aapt2
PRIV_APP=$MODPATH/system/priv-app
PERMISSIONS=$MODPATH/system/permissions
error() {
 echo "\033[0;31m"
 echo "ERROR: $1"
 echo "\033[0m"
}
log() {
 echo "\033[1;33m"
 echo "$1"
 echo "\033[0m"
}
