echo "# this file is located in 'src/setlogin_command.sh'"
echo "# code for 'dgxa setlogin' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args

if validate_file_exists "./branding/gnome-shell-theme.gresource"; then
    mkdir -p $FILE_SYSTEM_CAP_FOLDER/usr/share/gnome-shell/
    cp ./branding/gnome-shell-theme.gresource $FILE_SYSTEM_CAP_FOLDER/usr/share/gnome-shell/
else
    echo "./branding/gnome-shell-theme.gresource not found."
    echo "please create an gresource file (e.g with this script) and copy it to ./branding/."
    exit
fi
