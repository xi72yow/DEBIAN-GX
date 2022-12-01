#repack the .deb file
#ar x Prepros-7.7.0.deb
#zstd -d < control.tar.zst | xz > control.tar.xz
#zstd -d < data.tar.zst | xz > data.tar.xz
#ar -m -c -a sdsd dolibarr_15.0.2-4_all_repacked.deb debian-binary control.tar.xz data.tar.xz
#rm debian-binary control.tar.xz data.tar.xz control.tar.zst data.tar.zst



#TODO: find control file and place in DEBIAN/control
#TODO: remove curious . folder from data.tar.xz

dpkg-deb --info Prepros-7.7.0.deb
if [ $? -eq 0 ]; then
    echo OK
else
    echo FAIL
    #mkdir -p package
    #ar x Prepros-7.7.0.deb --output package
    #for i in package/*.zst; do
    #    zstd -d <$i | xz >"${i%.*}.xz"
    #    rm $i
    #    echo $i
    #done
    #packFiles=""
    #for entry in "package"/*; do
        packFiles="${packFiles} ${entry}"
    #    echo "$entry"
    #done
    #echo $packFiles
    dpkg-deb --build --root-owner-group package
    #ar -m -c -a sdsd package.deb $packFiles
    dpkg-name package.deb
fi