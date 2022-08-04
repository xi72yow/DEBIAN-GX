echo "# this file is located in 'src/installdev_command.sh'"
echo "# code for 'dgxa installdev' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args

apt update
apt install install dpkg-dev ruby-full live-build rpm -y

cd /config-app/
npm install
cd ..
