#!/usr/bin/env bash

# Read pylint error codes to md-file.

echo "# Pylint error codes" > messages.md
echo 'This is the messages given from the command `pylint --list-msgs` with Pylint version 1.7.1' >> messages.md
pylint --list-msgs | while read line ;

do
    if [[ $line == :* ]];then
        printf "## "
        echo "$line"|awk '{print $1}' | cut -c2-
        printf "### "
        echo "$line"|awk '{$1=""; print $0}'
    else
        echo $line
    fi;
done >> messages.md
