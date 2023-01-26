#!/bin/bash

echo "what topic" | dmenu
read -r application

declare -a options=(
"1 - https://www.google.co.uk/search?q=" $application
"2 - https://outlook.office365.com/mail/"
"3 - https://web.skype.com/"
"4 - https://www.amazon.co.uk/vine/vine-reviews"
)

choice=$(printf '%s\n' "${options[@]}" | dmenu -i -l 20 -p 'Bookmarks')


if [ "$choice" ]; then
    cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
    $BROWSER "$cfg"
else
    exit 1
fi
