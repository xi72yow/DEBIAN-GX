get_URL_from_latest_release_for_deb() {
    local resultURLs=$(curl "https://api.github.com/repos/$1/releases" | # Get release from GitHub api
        jq '[.[].assets] | .[0]')
    urls=()
    for variable in $resultURLs; do
        if [[ $variable == *".deb"* ]]; then
            if [[ $variable == *"https:"* ]]; then # Get download URL
                urlSize="$((${#variable} - 1))"
                url=$(echo "$variable" | cut -c2-$urlSize) # Delete the ""
                urls+=("$url")
            fi
        fi
    done

    #contains all .deb releases
    urlsLen=${#urls[@]}
    #no deb releases found
    if ((${urlsLen} < 1)); then
        exit
    fi
    #only one deb release found
    if ((${urlsLen} == 1)); then
        echo "${urls[0]}"
    fi
    #more than one deb release found
    if ((${urlsLen} > 1)); then
        for i in "${urls[@]}"; do
            #check architecture
            if [[ $i == *"amd64"* ]]; then
                echo "$i"
            fi
        done
    fi

}