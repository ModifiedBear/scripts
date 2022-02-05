#!/bin/sh
# HELP
Help()
{
	echo "Fast script to get a random wallpaper from unsplash with specified query"
	echo
	echo "Syntax: random_pape [-q]"
	echo "options:"
	echo "q     State query (default = none)"
	echo
}


# MAIN
Query=""

while getopts ":hq:" option; do
	case $option in
		h) # display Help
			Help
			exit;;
		q) # enter query
			Query=$OPTARG;;
	       \?) # Invalid option
		       echo "Error: Invalid option"
		       exit;;
       esac
done

echo
echo "Setting wallpaper for: $Query!"
echo

# remove spaces
string=${Query// /%20}

# maybe set different resolution in the future

wget -q https://source.unsplash.com/random/1920x1080/?$string -O ~/Downloads/pape.png && feh --bg-scale ~/Downloads/pape.png && echo "ʕ•ᴥ•ʔ" && wal -c && wal -i ~/Downloads/pape.png
