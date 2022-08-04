echo "# this file is located in 'src/generatecodeex_command.sh'"
echo "# code for 'dgxa generatecodeex' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args
ext=$(code --list-extensions)
installscript="#!/bin/sh \n"
extpage=""

echo -e "# install code extensions\n"
for ext in $ext; do
    installscript=$installscript"code --install-extension $ext\n"
    extpage=$extpage"https://marketplace.visualstudio.com/items?itemName=$ext\n"
done

mkdir -p build/config/includes.chroot_after_packages/etc/skel/.deb-gx/
mkdir -p config-app/src/data/lists/

echo -e $installscript >build/config/includes.chroot_after_packages/etc/skel/.deb-gx/install-code-extensions.sh
echo -e $extpage >config-app/src/data/lists/code_extensions.txt
echo -e "build/config/includes.chroot_after_packages/etc/skel/.deb-gx/install-code-extensions.sh + config-app/src/data/lists/code_extensions.txt created."
