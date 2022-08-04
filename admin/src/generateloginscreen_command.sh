echo "# this file is located in 'src/generateloginscreen_command.sh'"
echo "# code for 'dgxa generateloginscreen' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args

mkdir -p gresource_src
files=$(gresource list ./lfs/gnome-shell-theme.gresource)
wallpaper_name="g4010.png"
cp ./branding/g4010.png ./gresource_src/g4010.png
for file in $files; do
    #echo $(basename $file)
    gresource extract lfs/gnome-shell-theme.gresource $file >"./gresource_src/$(basename $file)"
done

echo "creating xml .."

echo -n "" >gresource_src/gnome-shell-theme.gresource.xml

echo -e '<?xml version="1.0" encoding="UTF-8"?>' >>gresource_src/gnome-shell-theme.gresource.xml
echo -e "<gresources>" >>gresource_src/gnome-shell-theme.gresource.xml
echo -e '  <gresource prefix="/org/gnome/shell/theme">' >>gresource_src/gnome-shell-theme.gresource.xml
echo -e "     <file>${wallpaper_name}</file>" >>gresource_src/gnome-shell-theme.gresource.xml

for file in $files; do
    name=$(basename $file)
    echo -e "     <file>${name}</file>" >>gresource_src/gnome-shell-theme.gresource.xml

done

echo -e "  </gresource>" >>gresource_src/gnome-shell-theme.gresource.xml
echo -e "</gresources>" >>gresource_src/gnome-shell-theme.gresource.xml

echo "gnome-shell-theme.gresource.xml cteated."

#todo: make gresource with dracula theme
echo "creating gnome-shell.css .."
sed -i 's/#lockDialogGroup/#lockDialogGroup-bak/' gresource_src/gnome-shell.css
sed -i 's/1b6acb/bd93f9/' gresource_src/gnome-shell.css

printf "#lockDialogGroup {\n    background: #44475a url(${wallpaper_name});\n    background-repeat: no-repeat;\n    background-size: cover; }\n" >>gresource_src/gnome-shell.css
echo "gnome-shell.css created."

echo "compiling gresource .."
echo "current folder gresource_src"
cd gresource_src
glib-compile-resources gnome-shell-theme.gresource.xml
cd ..
echo "gresource compiled."

cp ./gresource_src/gnome-shell-theme.gresource ./build/config/includes.chroot_after_packages/usr/share/gnome-shell/
