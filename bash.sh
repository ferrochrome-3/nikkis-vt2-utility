#!/bin/bash
# Created by Nikki
# Owner of Ferrochrome
# https://discord.gg/624wVgpf9W

# clear the screen
printf "\ec"

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
echo "8: Exit"
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
else
exit
fi
fi
elif [ $option = 7 ]; then
curl https://raw.githubusercontent.com/ferrochrome-3/nikkis-vt2-utility/refs/heads/main/crossystem.sh > crossystem.sh && bash crossystem.sh
elif [ $option = 8 ]; then
echo "*kaboom*"
exit
elif [ $option = 69 ]; then
curl https://raw.githubusercontent.com/ferrochrome-3/nikkis-vt2-utility/refs/heads/main/femboy%20ascii.sh > "femboy ascii.sh" && bash "femboy ascii.sh"
fi
fi
fi