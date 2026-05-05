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
echo "This is not a joke script, this actually has the power to BRICK YOUR DEVICE or MAKE IT UNUSABLE."
echo "Only use this script if you are specifically trying to cause irreperable harm to your device."
echo "I do not condone destruction of school property, I am not responsible for any harm caused with this script."
read -p "With that being said, would you like to continue? (y/n) " ynselection
if [ $ynselection = n ]; then
exit
fi

# infinite loop
while true; do
# print title and options
echo "Chromebrick"
printf "\n"
echo "Pick your poison"
printf "\n"
echo "1: Wipe the firmware chip"
echo "2: Devmode Purgatory"
echo "3: The Infinite Clobber by Kelsea (crossystem on discord)"
echo "4: Exit"
# select an option
read -p "Select an option: " option
# flashrom -E
if [ $option = 1 ]; then
echo "This will make your chromebook unable to boot until the firmware chip is flashed externally."
read -p "Continue? (y/n) " opt1yn
if [ $opt1yn = y ]; then
echo "Wiping chip..."
flashrom -E
echo "Finished."
else
echo "Action cancelled, exiting."
exit
fi
# devmode purgatory
elif [ $option = 2 ]; then
echo "This will put you in devmode with developer mode being disabled in the OS and in FWMP."
echo "Additionally, your GBB flags will be set to force devmode on and WP will be enabled."
echo "This is by far the most recoverable option."
read -p "Continue? (y/n) " opt2yn
if [ $opt2yn = y ]; then
echo "Setting GBB flags..."
futility gbb -s --flash --flags=0x8
echo "Disabling devmode in ChromeOS."
crossystem block_devmode=1
echo "Disabling devmode in FWMP."
device_management_client --action=set_firmware_management_parameters --flags=0x01
echo "Enabling WP."
flashrom --wp-enable
echo "Finished, enjoy your purgatory!"
else
echo "Action cancelled, exiting."
exit
fi
# infinite clobber
elif [ $option = 3 ]; then
echo "This will put your chromebook into an infinite state of "self repair.""
echo "I deadass have no idea how to recover from this."
read -p "Continue? (y/n) " opt3yn
if [ $opt3yn = y ]; then
echo "Starting the clobber."
get_largest_cros_blockdev() {
    local largest size dev_name tmp_size remo
    size=0
    for blockdev in /sys/block/*; do
        dev_name="${blockdev##*/}"
        echo "$dev_name" | grep -q '^\(loop\|ram\)' && continue
        tmp_size=$(cat "$blockdev"/size)
        remo=$(cat "$blockdev"/removable)
        if [ "$tmp_size" -gt "$size" ] && [ "${remo:-0}" -eq 0 ]; then
            case "$(sfdisk -d "/dev/$dev_name" 2>/dev/null)" in
                *'name="STATE"'*'name="KERN-A"'*'name="ROOT-A"'*)
                    largest="/dev/$dev_name"
                    size="$tmp_size"
                    ;;
            esac
        fi
    done
    echo "$largest"
}

format_part_number() {
    echo -n "$1"
    echo "$1" | grep -q '[0-9]$' && echo -n p
    echo "$2"
}

stateful=/mnt/stateful_partition

disk="$(get_largest_cros_blockdev)"
state_dev="$(format_part_number "$disk" 1)"

umount ${state_dev} || true
sgdisk --change-name=1:"OEM" --change-name=8:"STATE" "$disk"
mount ${state_dev} ${stateful}
echo "fast keepimg" > ${stateful}/factory_install_reset
sync
umount ${state_dev}
crossystem disable_dev_request=1 2>/dev/null
crossystem disable_dev_request=1
echo Finished.
read -p "Reboot now? (y/n) " opt3rebootyn
if [ $opt3rebootyn = y ]; then
reboot -f
fi
fi
elif [ $option = 4 ]; then
echo "*kaboom*"
exit
fi
# end loop
done