#!/bin/env bash
#!/bin/sh
#!/bin/bash

TEMP_FILE="$PREFIX/tmp/connect.sh/cache"

if [ ! -e "$PREFIX/tmp/connect.sh/" ]; then
	mkdir "$PREFIX/tmp/connect.sh"
fi

if [ -e "$TEMP_FILE" ]; then
	mv "$TEMP_FILE" "$PREFIX/tmp/connect.sh/cache-$(date +%F-%I-%M-%S).old"
        rm -rf "$PREFIX/tmp/connect.sh/*" 
fi

if [ $# == 0 ]; then
	echo "Connect.sh — A powerful url connector for bash."
	echo ""
	echo "Usage: 'connect [OPTION] <URL>'"
	echo ""
	echo "Note: [] are optional and <> are required."
	echo "      Do not include [] and <> they are not required."
	echo ""
	echo "--silent, -s	Silent Connect Test."
	echo "--progress, -p	Progress Bar Connect Test."
	echo "--verbose, -b	Prints ONLY Debug Connect Test."
	echo "--no-exit, -n	Prints ONLY the Status Code."
	echo "--version, -v	Prints the Software Version."
	echo ""
	echo "Error Status: When error occur's, the exit code will 1"
	echo "		    When there's nothing occur's, the exit code will 0"
	echo ""
	echo ""
	echo "Copyright by ReinfyTeam (c) 2022"
	echo "ReinfyTeam Software Development <https://www.reinfy.tk/>"
fi

case $1 in
	"--silent")
		if [ "$2" == "" ]; then
			echo "You must specify a url to be connect." && exit 1
		else curl -sL $2 >> $TEMP_FILE
		fi
		if [ ! "$?" == "0" ]; then
			exit 1
		else exit 0
		fi
		;;
	      "-s")
		if [ "$2" == "" ]; then
                        echo "You must specify a url to be connect." && exit 1
                else curl -sL $2 >> $TEMP_FILE
                fi
                if [ ! "$?" == "0" ]; then
                        exit 1
                else exit 0
                fi
		;;
	"--progress")
		if [ "$2" == "" ]; then
                        echo "You must specify a url to be connect." && exit 1
                else echo -n "[*] ${2}: " && curl -sL $2 >> $TEMP_FILE
                fi
		if [ ! "$?" == "0" ]; then
			echo "bad"
			exit 1
		else echo "ok" && exit 0
		fi
		;;
		"-p")
		if [ "$2" == "" ]; then
                        echo "You must specify a url to be connect." && exit 1
                else echo -n "[*] ${2}: " && curl -sL $2 >> $TEMP_FILE
                fi
                if [ ! "$?" == "0" ]; then
                        echo "bad"
                        exit 1
                else echo "ok" && exit 0
                fi
		;;
	"--verbose")
		if [ "$2" == "" ]; then                                                                         echo "You must specify a url to be connect." && exit 1
                else curl --verbose -s $2
                fi
                if [ ! "$?" == "0" ]; then
                        exit 1
                else exit 0
		fi
		;;
		"-b")
		if [ "$2" == "" ]; then                                                                         echo "You must specify a url to be connect." && exit 1
                else curl --verbose -s $2
                fi
                if [ ! "$?" == "0" ]; then
                        exit 1
                else exit 0
		fi
		;;
     "--no-exit")
          if [ "$2" == "" ]; then                                                                         echo "You must specify a url to be connect." && exit 1
                else curl -s $2 >> $TEMP_FILE
                fi
                if [ ! "$?" == "0" ]; then
                        echo "1"
                else echo "0"
		fi
		;;
		"-n")
          if [ "$2" == "" ]; then                                                                         echo "You must specify a url to be connect." && exit 1
                else curl -s $2 >> $TEMP_FILE
                fi
                if [ ! "$?" == "0" ]; then
                        echo "1"
                else echo "0"
		fi
		;;
	"--help")
	     echo "Connect.sh — A powerful url connector for bash."
	     echo ""
     	echo "Usage: 'connect [OPTION] <URL>'"
     	echo ""
     	echo "Note: [] are optional and <> are required."
     	echo "      Do not include [] and <> they are not required."
     	echo ""
     	echo "--silent, -s	Silent Connect Test."
     	echo "--progress, -p	Progress Bar Connect Test."
     	echo "--verbose, -b	Prints ONLY Debug Connect Test."
     	echo "--no-exit, -n	Prints ONLY the Status Code."
     	echo "--version, -v	Prints the Software Version."
     	echo ""
     	echo "Error Status: When error occur's, the exit code will 1"
     	echo "		    When there's nothing occur's, the exit code will 0"
     	echo ""
     	echo ""
     	echo "Copyright by ReinfyTeam (c) 2022"
     	echo "ReinfyTeam Software Development <https://www.reinfy.tk/>"
	     ;;
	     "-h")
	     echo "Connect.sh — A powerful url connector for bash."
	     echo ""
     	echo "Usage: 'connect [OPTION] <URL>'"
     	echo ""
     	echo "Note: [] are optional and <> are required."
     	echo "      Do not include [] and <> they are not required."
     	echo ""
     	echo "--silent, -s	Silent Connect Test."
     	echo "--progress, -p	Progress Bar Connect Test."
     	echo "--verbose, -b	Prints ONLY Debug Connect Test."
     	echo "--no-exit, -n	Prints ONLY the Status Code."
     	echo "--version, -v	Prints the Software Version."
     	echo ""
     	echo "Error Status: When error occur's, the exit code will 1"
     	echo "		    When there's nothing occur's, the exit code will 0"
     	echo ""
     	echo ""
     	echo "Copyright by ReinfyTeam (c) 2022"
     	echo "ReinfyTeam Software Development <https://www.reinfy.tk/>"
     	;;
	"--version")
		echo "0.0.3"
		;;
		"-v")
		echo "0.0.3"
		;;
	       *)
		if [[ ! "$1" =~ "https://" ]]; then
			echo "Invalid Usage: There's no named '$1' in the options. Please try to use 'connect --help' for usage."
		else
			curl -sL $1 >> $TEMP_FILE
			if [ ! "$?" == "0" ];
				then echo "connect: An error occur when connecting to $1." && exit 1
				else echo "connect: Sucessfully connected and tested the url." && exit 0
			fi
		fi
		;;
esac

