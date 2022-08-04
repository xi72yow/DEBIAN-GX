check_root() {
    if [ ! $(id -u) -eq 0 ]; then
        log "Please run as root"
        exit
    fi
}