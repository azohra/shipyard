#!/bin/bash
# shellcheck source=/dev/null

C_GREEN="\\033[32m"
C_BLUE="\\033[94m"
C_REG="\\033[0;39m"

version="v0.1"
app_name="Shipyard"

url_regex='^(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]$'

log () { 
    local message=${1}
    echo -e "\\n⛵ ${C_BLUE} ${message} ${C_REG}"
}   

announce () {
    local header=${1} 
    local message=${2}
    echo -e "${C_GREEN}${message%::*}:${C_BLUE} ${message#*::} ${C_REG}"
} 

load_config() {
    # Check for YML
    if [[ "${yml_location}" =~ ${url_regex} ]]; then $(curl -s "${yml_location}"); fi
    if [ -f "${yml_location}" ]; then announce "Config" "${yml_location}";else log "Config not found" && exit 2;  fi
}


ask_permission () {  
    local message=${1}
    log "${message}"
    printf "(Y/N): "
    while true
    do
      if [ "${auto_approve}" ]; then ans="y" && printf "Y (auto)"; else read -r ans; fi
      case ${ans} in
       [yY]* ) break;;
       [nN]* ) exit;;
       * )     printf "Y/N: ";;
      esac
    done
}

create_ships () {
    echo "WE SHIPPIN"
}