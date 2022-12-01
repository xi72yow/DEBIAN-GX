echo "# this file is located in 'src/installdev_command.sh'"
echo "# code for 'dgxa installdev' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args

check_root

sudo apt update
sudo apt install dpkg-dev ruby-full live-build rpm curl jq zstd -y
sudo gem install bashly
