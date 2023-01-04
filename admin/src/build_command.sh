echo "# this file is located in 'src/build_command.sh'"
echo "# code for 'dgxa build' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args

check_root

start=$(date +%s)

export KERNEL="6.0.0-0.deb11.6"

sed -i "s/<KERNEL>/$KERNEL/g" ./build/config/hooks/normal/0615-install-linux-headers.hook.chroot

cd build

sudo lb clean
lb config
sudo lb build

if validate_file_exists "./live-image-amd64.hybrid.iso"; then
    #sudo mv ./build/live-image-amd64.hybrid.iso ./build/deb-gx_000-amd64.hybrid.iso
    echo "Build $(green done). See build/live-image-amd64.hybrid.iso"
    end=$(date +%s)
    runtime=$((end - start))
    echo "Build Process takes $runtime seconds."
else
    echo "There was an $(red error) building the iso."
fi

sed -i "s/$KERNEL/<KERNEL>/g" ./build/config/hooks/normal/0615-install-linux-headers.hook.chroot
