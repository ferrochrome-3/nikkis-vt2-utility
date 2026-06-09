#!/bin/bash
# Created by Nikki
# Owner of Ferrochrome
# https://discord.gg/624wVgpf9W

# clear the screen
printf "\ec"

# infinite loop
while true; do
echo "Nikki's WP Helper"
echo "This utility will kinda??? automate disabling WP."
printf "\n"
echo "Is your chromebook Ti50 or Cr50."
echo "1. Ti50"
echo "2. Cr50"
echo "3. I don't know/what does this mean."
read -p "Choose an option: " q1
if [ $q1 = 1 ]; then
printf "\n"
echo "insert ti50 stuff here lmao"
elif [ $q1 = 2 ]; then
printf "\n"
# put a check for boards that dont use battery sense line for wp maybe?????
echo "something something code here your dedede lol you suck"
echo "Your chromebook uses a jumper for WP."
echo "If you havent already, open up your chromebook and use something to bridge the connection. (Tin foil, a paper clip, or solder if you're feeling fancy.)"
echo "This script will now run a wp loop that i DEFINITELY didnt steal from sh1mmer to make things easier for you."
read -N1 -sr -p "Press any key to run the wp loop..."
# credits to the mercuryworkshop team for this wp loop! https://github.com/MercuryWorkshop/sh1mmer
set -e

COLOR_RESET="\033[0m"
COLOR_RED_B="\033[1;31m"
COLOR_GREEN_B="\033[1;32m"

wp_disable() {
	while :; do
		if flashrom --wp-disable; then
			echo -e "${COLOR_GREEN_B}Success. Note that some devices may need to reboot before the chip is fully writable.${COLOR_RESET}"
			return 0
		fi
		echo -e "${COLOR_RED_B}Press CTRL+C to cancel.${COLOR_RESET}"
		sleep 1
	done
}

trap 'exit 1' INT
wp_disable
echo "something something battery sense line"
echo "Your chromebook uses the battery's sense line to control wp status."
echo "This means you will have to disconnect the battery and boot from external power (a charger)."
echo "If you havent disconnected the battery, please turn off your chromebook (wait for the light on the side to turn off) and remove the battery."
read -N1 -sr -p "If you have already done so, press any key to continue..."
echo "Disabling software write protection!"
flashrom --wp-disable
echo "Finished!"
exit
elif [ $q1 = 3 ]; then
printf "\n"
echo "While i technically could make a list of every single cr50 board and do some grep bullshit to see if you have a cr50 board, im not gonna do that!"
echo "Look it up! :3"
fi
done