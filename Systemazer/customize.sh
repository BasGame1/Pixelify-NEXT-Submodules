echo "   _____ ____________________                                                                             ";
echo "  /  _  \\\\______   \\______   \\                                                                            ";
echo " /  /_\\  \\|     ___/|     ___/                                                                            ";
echo "/    |    \\    |    |    |                                                                                ";
echo "\\____|__  /____|    |____|                                                                                ";
echo "        \\/                                                                                                ";
echo "  ______________.___. _______________________________   _____      _____  _______________________________ ";
echo " /   _____/\\__  |   |/   _____/\\__    ___/\\_   _____/  /     \\    /  _  \\ \\____    /\\_   _____/\\______   \\";
echo " \\_____  \\  /   |   |\\_____  \\   |    |    |    __)_  /  \\ /  \\  /  /_\\  \\  /     /  |    __)_  |       _/";
echo " /        \\ \\____   |/        \\  |    |    |        \\/    Y    \\/    |    \\/     /_  |        \\ |    |   \\";
echo "/_______  / / ______/_______  /  |____|   /_______  /\\____|__  /\\____|__  /_______ \\/_______  / |____|_  /";
echo "        \\/  \\/              \\/                    \\/         \\/         \\/        \\/        \\/         \\/ ";
echo ""
log "Load vars"
. $MODPATH/vars.sh || abort "Could not load variable file"


get_selection() {
 log "Getting your selection"
 SELECTION=$(cat $MODPATH/selection | grep -E -v "^#|^$")
 SELECTION_PATH=$(pm path $SELECTION)
}

create_xml() {
 log "Creating permissions XML file"
 . $MODPATH/xml_create.sh $SELECTION $SELECTION_PATH
}

copy_apk() {
 log "Copying app to priv-app dir"
 mkdir -p $PRIV_APP/$SELECTION
 cp -r $SELECTION_PATH $PRIV_APP/$SELECTION 
}

copy_xml() {
 log "Copying XML permissions file"
 XML_LOC=$(ls $MODPATH/xml)
 cp $XML_LOC $PERMISSIONS
}

#Execute
get_selection || error "Create the selection"
create_xml || abort "Could not create the XML"
copy_apk || abort "Could not copy the APK to the destiny"
copy_xml || abort "Could not copy the XML to the destiny"
