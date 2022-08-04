echo "# this file is located in 'src/download_command.sh'"
echo "# code for 'cli download' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args

#build/config/includes.chroot_after_packages/etc/skel/ represents home directory of the user
home_dir="build/config/includes.chroot_after_packages/etc/skel/"
ext_dir="build/config/includes.chroot_after_packages/usr/share/gnome-shell/extensions/"
styles_dir="build/config/includes.chroot_after_packages/usr/share/"
packages_dir="build/config/packages.chroot/"

if [ -z "$(ls -A $styles_dir)" ]; then
    echo "styles_dir Empty"
else
    echo "styles_dir Not Empty"
fi

if [ -z "$(ls -A $packages_dir)" ]; then
    echo "packages_dir Empty"
else
    echo "packages_dir Not Empty"
fi

#theming
#download branding files to branding directory
#wallpaper
mkdir -p "${styles_dir}backgrounds/debgx"

cp ./branding/Wallpaper.png "${styles_dir}backgrounds/debgx/Wallpaper.png"

# dracula theme
mkdir -p "${styles_dir}icons"
mkdir -p "${styles_dir}themes"

mkdir -p "${packages_dir}"

curl --location --output "${styles_dir}Dracula.zip" --write-out "%{url_effective}\n" "https://github.com/dracula/gtk/archive/master.zip"
unzip "${styles_dir}Dracula.zip" -d "${styles_dir}themes"
mv "${styles_dir}themes/gtk-master" "${styles_dir}themes/Dracula"
rm -rf "${styles_dir}Dracula.zip"

curl --location --output "${styles_dir}DraculaIcons.zip" --write-out "%{url_effective}\n" "https://github.com/dracula/gtk/files/5214870/Dracula.zip"
unzip "${styles_dir}DraculaIcons.zip" -d "${styles_dir}icons"
rm -rf "${styles_dir}DraculaIcons.zip"

#gedit theme
mkdir -p "${home_dir}.local/share/gedit/styles/"
curl -o "${home_dir}.local/share/gedit/styles/dracula.xml" https://raw.githubusercontent.com/dracula/gedit/master/dracula.xml

#gnome-shell extensions
#clipboard indicator
mkdir -p "${ext_dir}"
git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git "${ext_dir}clipboard-indicator@tudmotu.com"

#download packages
#Github Desktop "Not Official"
download_URL=$(get_URL_from_latest_release_for_deb "shiftkey/desktop")
curl --location --output "${packages_dir}Github_Desktop_amd64.deb" --write-out "%{url_effective}\n" $download_URL
dpkg-name "${packages_dir}Github_Desktop_amd64.deb"

#download gum
download_URL=$(get_URL_from_latest_release_for_deb "charmbracelet/gum")
curl --location --output "${packages_dir}gum_amd64.deb" --write-out "%{url_effective}\n" $download_URL
dpkg-name "${packages_dir}gum_amd64.deb"

#popsicle-gtk "Not Official"
download_URL=$(get_URL_from_latest_release_for_deb "xi72yow/popsicle-deb")
curl --location --output "${packages_dir}popsicle_amd64.deb" --write-out "%{url_effective}\n" $download_URL
dpkg-name "${packages_dir}popsicle_amd64.deb"

#eddy "Not Official"
download_URL=$(get_URL_from_latest_release_for_deb "xi72yow/eddy-deb")
curl --location --output "${packages_dir}eddy_amd64.deb" --write-out "%{url_effective}\n" $download_URL
dpkg-name "${packages_dir}eddy_amd64.deb"

#Chrome
curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb --output "${packages_dir}Chrome_amd64.deb"
dpkg-name "${packages_dir}Chrome_amd64.deb"

#VS Code
curl --location --output "${packages_dir}VS_Code_amd64.deb" --write-out "%{url_effective}\n" "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
dpkg-name "${packages_dir}VS_Code_amd64.deb"

#Discord
curl --location --output "${packages_dir}Discord_amd64.deb" --write-out "%{url_effective}\n" "https://discordapp.com/api/download?platform=linux&format=deb"
dpkg-name "${packages_dir}Discord_amd64.deb"

#Lightworks
curl https://cdn.lwks.com/releases/2022.1.1/lightworks_2022.1.1_r132926.deb --output "${packages_dir}Lightworks_amd64.deb"
dpkg-name "${packages_dir}Lightworks_amd64.deb"

#Insync
curl https://d2t3ff60b2tol4.cloudfront.net/builds/insync_3.7.9.50368-bullseye_amd64.deb --output "${packages_dir}Insync_amd64.deb"
dpkg-name "${packages_dir}Insync_amd64.deb"

#Prepros
curl --location --output "${packages_dir}Prepros_amd64.deb" --write-out "%{url_effective}\n" "https://prepros.io/downloads/stable/linux"
dpkg-name "${packages_dir}Prepros_amd64.deb"

#ProtonVPN
curl https://protonvpn.com/download/protonvpn-stable-release_1.0.1-1_all.deb --output "${packages_dir}ProtonVPN_amd64.deb"
dpkg-name "${packages_dir}ProtonVPN_amd64.deb"

#Flashprint
curl --location --output "${packages_dir}FlashPrint_amd64.deb" --write-out "%{url_effective}\n" "https://en.fss.flashforge.com/10000/software/073e21bbe6ba5c7defb17dbb69708fd8.deb"
dpkg-name "${packages_dir}FlashPrint_amd64.deb"

#GGetMp3
download_URL=$(get_URL_from_latest_release_for_deb "xi72yow/GGetMp3")
curl --location --output "${packages_dir}GGetMp3_amd64.deb" --write-out "%{url_effective}\n" $download_URL
dpkg-name "${packages_dir}GGetMp3_amd64.deb"

#Download Config App
mkdir -p $FILE_SYSTEM_CAP_FOLDER/usr/local/bin
git clone https://github.com/xi72yow/x-tune.git $FILE_SYSTEM_CAP_FOLDER/usr/local/bin
