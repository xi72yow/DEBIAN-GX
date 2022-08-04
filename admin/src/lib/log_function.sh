exec 3>&1

log() {
    echo "$(red Stop:) $1" 1>&3
}
