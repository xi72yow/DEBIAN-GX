echo "# this file is located in 'src/build_command.sh'"
echo "# code for 'dgxa build' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args

check_root

start=$(date +%s)

cd build

sudo lb clean
lb config
sudo lb build

if [ $? -eq 0 ]; then
    #sudo mv ./build/live-image-amd64.hybrid.iso ./build/deb-gx_000-amd64.hybrid.iso
    echo "Build $(green done). See build/live-image-amd64.hybrid.iso"

else
    echo "There was an $(red error) building the iso."
fi

end=$(date +%s)
runtime=$((end - start))
echo "Time: $runtime seconds"
