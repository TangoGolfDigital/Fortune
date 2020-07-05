#!/bin/bash
set -eu


# Remove old files
echo "Removing old files"
rm /usr/share/games/fortunes/*

# Deploy
echo "Deploying new files"
for file in $(ls -1 --ignore=*.sh --ignore=*~)
do
    targetFile="/usr/share/games/fortunes/$file"
    cp -P "$file" "$targetFile"
    chmod a+r "$targetFile"
done


echo "Done"

