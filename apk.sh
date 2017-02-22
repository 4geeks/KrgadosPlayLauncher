#! /usr/bin

./gradlew assembleRelease
FILE_NAME="app/build/outputs/apk/app-release.apk"
#NOW=$(date +"%d-%m-%Y-%p")
NOW=$(date +"%d-%m-%Y")
BRANCH=$(git symbolic-ref --short HEAD)
NEW_FILE_NAME="/tmp/krgados-launcher-apk"-$BRANCH-$NOW.apk
NEW_FILE_NAME="/tmp/krgados-launcher-apk.apk"
cp "$FILE_NAME" "$NEW_FILE_NAME"
chmod 400 private-key-for-scp
scp -P 5388 -i private-key-for-scp "$NEW_FILE_NAME" pruebas-eme@162.252.57.227:/home/pruebas-eme/
