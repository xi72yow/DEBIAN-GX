echo "# this file is located in 'src/generatechromeex_command.sh'"
echo "# code for 'dgxa generatechromeex' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args
extpage=""

for i in $(find ~/.config/google-chrome/*/Extensions -name 'manifest.json'); do
    u="https://chrome.google.com/extensions/detail/"
    ue=$(basename $(dirname $(dirname $i)))
    extpage="$extpage$u$ue\n"
done

echo -e $extpage >config/chrome_extensions.txt
echo -e "config/chrome_extensions.txt created."