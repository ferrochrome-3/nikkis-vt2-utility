#!/bin/bash
# Created by Nikki
# Owner of Ferrochrome
# https://discord.gg/624wVgpf9W

# clear the screen
printf "\ec"
# check for chronos and exit if on chronos
if [ $USER = "chronos" ]; then
echo "Please switch to the root user and run the script again."
exit
fi
# warning
echo -e "\e[31mWARNING:\e[0m"
echo "If you set invalid parameters, you could bootloop or brick your device."
echo "Please make sure you know what you doing, and check for typos before setting parameters."
echo "Don't just type shit and pray to allah it works."
read -p "Continue? (y/n) " ynselection
if [ $ynselection = y ]; then
exit
fi

# infinite loop
while true; do
# print title and options
echo "Nikki's crossystem Utility"
echo "Remember to practice caution while using these tools."
printf "\n"
echo "Options"
printf "\n"
echo "1: List all parameters and their values."
echo "2: List a specific parameters value."
echo "3: Set a parameter."
echo "4: Exit."
# select an option
read -p "Select an option: " option
# execute code based on an option
# list all params
if [ $option = 1 ]; then
crossystem
# get a specific param
elif [ $option = 2 ]; then
read -p "Which parameters value would you like to see? " paramchoice
crossystem $paramchoice
printf "\n"
# set a param
elif [ $option = 3 ]; then
read -p "What parameter would you like to set? " paramchoice
read -p "What value would you like to set the parameter to? " paramval
echo "Writing parameter..."
sudo crossystem $paramchoice=$paramval
elif [ $option = 4 ]; then
echo "*kaboom*"
exit
fi
# end infinite loop
done