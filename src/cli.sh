function usage {
    echo -e "\\nUsage: ${app_name} [flags]\\n"
    echo "flags:"
    echo "  -u, --upgrade               upgrade shipyard to the latest version"
    echo "  -v, --version               print the current shipyard version"
    echo "  -a, --auto                  do not prompt for confirmation"
    echo "  -y, --yml file/url          path to a valid shipyard yml config"
    echo "  -h, --help                  prints this message"
    exit 1
}

function upgrade {
    rm /usr/local/bin/shipyard
    curl -s https://shipyard.azohra.com | sh
    log "Upgraded Successfully!"
    exit 0
}

while [ $# -gt 0 ] ; do
    case "$1" in
    -u|--upgrade)
        upgrade
    ;;
    -y|--yml)
        yml_location="$2"
        shift # extra value 
    ;;
    -a|--auto)
        auto_approve="true"
    ;;
    -v|--version)
        echo "${version}" && exit 0
    ;;
    -h|--help)
        usage
    ;;
    -*)
        "Unknown option: '$1'"
    ;;
    esac
    shift
done