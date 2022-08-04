echo "# this file is located in 'src/setcalamares_command.sh'"
echo "# code for 'dgxa setcalamares' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args

mkdir -p $FILE_SYSTEM_CAP_FOLDER/etc/calamares
cp -r ./branding/calamares/branding $FILE_SYSTEM_CAP_FOLDER/etc/calamares
cp ./branding/calamares/settings.conf $FILE_SYSTEM_CAP_FOLDER/etc/calamares

mkdir -p $FILE_SYSTEM_CAP_FOLDER/usr/share/icons/debgx/
cp ./branding/calamares/calamares_icon.svg $FILE_SYSTEM_CAP_FOLDER/usr/share/icons/debgx/

mkdir -p $FILE_SYSTEM_CAP_FOLDER/usr/share/applications/
cp ./branding/calamares/install-debian.desktop $FILE_SYSTEM_CAP_FOLDER/usr/share/applications/install-debian.desktop

echo "calamres branding installed"
