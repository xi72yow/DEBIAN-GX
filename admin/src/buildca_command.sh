echo "# this file is located in 'src/buildca_command.sh'"
echo "# code for 'dgxa buildca' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args

cd /config-app/
npm run build
cd ..
