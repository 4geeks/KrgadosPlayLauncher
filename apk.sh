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
scp -i private-key-for-scp "$NEW_FILE_NAME" root@104.131.91.126:/var/www/html/fdroid/repo
