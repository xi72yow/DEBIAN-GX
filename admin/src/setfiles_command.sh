echo "# this file is located in 'src/setfiles_command.sh'"
echo "# code for 'dgxa setfiles' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args

mkdir -p $USER_LIVE_HOME_FOLDER/.deb-gx
cp -r ./branding/apps $USER_LIVE_HOME_FOLDER/.deb-gx/
cp ./branding/xi72yowde.ttf $USER_LIVE_HOME_FOLDER/.deb-gx/xi72yowde.ttf