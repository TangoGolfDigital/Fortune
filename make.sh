#!/bin/bash
set -eu

newline_at_eof()
{
    if [ -z "$(tail -c 1 "$1")" ]
    then
	return 1 # No newline at end of file
    else
	return 0 # Newline at end of file
    fi
}

# Remove all previously generated files
echo "Removing previously generated files"
rm -f *.u8 *.dat

# Iterate over each file (without an extension) and execute strfile
# and create new u8 link
echo "Generating new files..."
for file in $(ls -1 --ignore='*.*' --ignore='*~')
do
    echo "Checking $file..."
    if newline_at_eof "$file" -gt 0
    then
	echo "Missing newline at end of $file"
	exit 1
    fi
    
    strfile $file
    ln -s "$file" "$file.u8"
done

echo "Done"


		
