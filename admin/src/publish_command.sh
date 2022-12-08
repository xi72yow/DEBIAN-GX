if validate_file_exists "./build/live-image-amd64.hybrid.iso"; then
    echo "start publishing"

    VERSION=$(jq -r .version dgx.json)
    BUMPED_VERSION=$(echo $VERSION | awk -F. '/[0-9]+\./{$NF++;print}' OFS=.)

    echo "Bumping version from $VERSION to $BUMPED_VERSION"
    read -p "Are you sure? " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
    fi

    #update version
    jq --arg a "${BUMPED_VERSION}" '.version = $a' dgx.json >"tmp" && mv "tmp" dgx.json

    #later for actions
    #git push origin $BUMPED_VERSION
    #git push origin main

    FILESIZE=$(du -bs ./build/live-image-amd64.hybrid.iso | awk '{print $1/2^30}')
    SHA256=$(sha256sum ./build/live-image-amd64.hybrid.iso | awk '{print $1}')

    NOTES="# Debian-GX Release"$'\n'"GitHub allows Releases with the max size of 2Gb. Debian-GX is much bigger ca. ${FILESIZE}Gb. You can load the iso from [here](https://45.129.182.121:9000/debian-gx-public/debian-gx-amd64.hybrid.iso)."$'\n'"## SHA256 checksum"$'\n'"${SHA256}"

    echo "Publishing ..."
    # insecure is needed because of self signed certificate
    mcli --insecure cp ./build/live-image-amd64.hybrid.iso myminio/debian-gx-public/debian-gx-amd64.hybrid.iso
    gh release delete "v$VERSION"
    gh release create "v$BUMPED_VERSION" --notes "$NOTES"
else
    echo "There is no iso."
fi
