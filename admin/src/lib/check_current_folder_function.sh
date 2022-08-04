check_current_folder_funktion() {
    result=${PWD##*/}
    if [ $result == "deb-gx" ]; then
        echo "Right folder."
    else
        log "Wrong folder. Please change to 'deb-gx' folder."
        exit
    fi
}
