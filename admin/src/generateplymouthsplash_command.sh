echo "# this file is located in 'src/generateplymouthsplash_command.sh'"
echo "# code for 'dgxa generateplymouthsplash' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args

#to generate plymouth splash screen, for spezific mp4

show_current_splash() {
    check_root
    DURATION=$1
    if [ $# -ne 1 ]; then
        DURATION=15
    fi
    plymouthd
    plymouth --show-splash
    for ((i = 0; i < $DURATION; i++)); do
        plymouth --update=duration$i
        sleep 1
    done
    plymouth --quit
}

mkdir -p $FILE_SYSTEM_CBP_FOLDER/usr/share/plymouth/themes
#cp -r ./branding/debgx_plymouth $FILE_SYSTEM_CBP_FOLDER/usr/share/plymouth/themes
