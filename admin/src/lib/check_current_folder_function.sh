check_current_folder_funktion() {
    result=${PWD##*/}
    if [ $result == "DEB-GX" ]; then
        echo "Right folder."
    else
        log "Wrong folder. Please change to 'DEB-GX' folder."
        exit
    fi
}
