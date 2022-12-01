echo "# this file is located in 'src/setplymouth_command.sh'"
echo "# code for 'dgxa setplymouth' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args

if validate_dir_exists "./branding/debgx_plymouth/"; then
    mkdir -p $FILE_SYSTEM_CBP_FOLDER/usr/share/plymouth/themes
    cp -r ./branding/debgx_plymouth $FILE_SYSTEM_CBP_FOLDER/usr/share/plymouth/themes
    echo "debgx_plymouth copied."
else
    echo "./branding/debgx_plymouth not found."
    echo "please create an debgx_plymouth dir (e.g with this script) and copy it to ./branding/."
    exit
fi
