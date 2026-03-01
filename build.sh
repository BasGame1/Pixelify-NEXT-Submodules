#!/bin/bash

source colors.sh 2>/dev/null || echo "error, could not load colors file"

echo "What submdoule you want to build'"
red "CallScreen: 1"
blue "GPhotos: 2"
yellow "InstallAPK: 3"
green "PixelLauncher: 4"
purple "Systemazer: 5"
echo "All: press enter"
echo ""

read -p "Enter your selection: " SELECTION

case $SELECTION in
"1") 
 red "Building Call Screen"
 ./gradlew :CallScreen:buildZip --no-configuration-cache
 ;;
"2")
 blue "Building GPhotos"
 ./gradlew :GPhotos:buildZip --no-configuration-cache
 ;;
"3")
 yellow "Building InstallAPK"
 ./gradlew :InstallAPK:buildZip --no-configuration-cache
 ;;
"4")
 green "Building PixelLancher"
 ./gradlew :InstallPixelLauncher:buildZip --no-configuration-cache
 ;;
"5")
 purple "Building Systemazer"
 ./gradlew :Systemazer:buildZip --no-configuration-cache
 ;;
*)
 echo "Building everything"
 ./gradlew buildAll --no-configuration-cache
 echo "Cleaning"
 ./gradlew clean --no-configuration-cache
 ;;
esac
