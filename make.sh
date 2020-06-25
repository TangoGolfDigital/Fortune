#!/bin/bash

# Remove all previously generated files
echo "Removing previously generated files"
rm *.u8 *.dat

# Iterate over each file (without an extension) and execute strfile
# and create new u8 link
echo "Generating new files..."
for file in $(ls -1 --ignore='*.*' --ignore='*~')
do
    echo $file
    strfile $file
    ln -s "$file" "$file.u8"
done

echo "Done"


		
