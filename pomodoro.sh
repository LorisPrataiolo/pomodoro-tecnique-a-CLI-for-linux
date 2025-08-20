#!/bin/bash

# ----- global variables ----
PROD_TIMER=25
REST_TIMER=5



# Colors
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
CYAN="\033[0;34m"
FIN="\033[0m"





setSession() {
    echo
    read -p "Set productivity timer (minutes): " PROD_TIMER

    echo
    read -p "Set Rest timer (minutes): " REST_TIMER

    # sanity check
    re='^[0-9]+$'   # strictly digits, full string

    if ! [[ $PROD_TIMER =~ $re ]] || ! [[ $REST_TIMER =~ $re ]] \
    || (( PROD_TIMER > 1440 )) || (( REST_TIMER > 1440 )); then
        echo -e "${RED} invalid input: timer values must be digits and they cannot be greater then a day in minutes (1440) ${FIN}"
        exit
    fi
        

    echo "you have set the session session as: $PROD_TIMER / $REST_TIMER"

}

# countdown method:
#          - input: timer in minutes
countdown() {

    local timer_minutes=$1 # take the first argument
    local total_seconds=$((timer_minutes * 60))

    while (( $total_seconds > -1)); do

        minutes=$((total_seconds / 60))
        seconds=$((total_seconds % 60))

        sleep 1
        total_seconds=$((total_seconds - 1))

        printf "\rRemaining: %02d:%02d" $minutes $seconds # The \r at the end returns the cursor to the beginning of the line

    done
}

performSession() {

    local count_session=1

    echo "The session is starting..."
    sleep 5
    clear

    while (( $count_session > 0 )); do
        echo -e "${GREEN}\rStarting Productivity Session (number ${count_session})...${FIN}"
        countdown $PROD_TIMER

        echo -e "${YELLOW}\rStarting Rest Session...${FIN}"
        countdown $REST_TIMER
        count_session=$((count_session + 1))

    done
}

main() {

    clear
    echo "
    ██████╗░░█████╗░███╗░░░███╗░█████╗░██████╗░░█████╗░██████╗░░█████╗░
    ██╔══██╗██╔══██╗████╗░████║██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗
    ██████╔╝██║░░██║██╔████╔██║██║░░██║██║░░██║██║░░██║██████╔╝██║░░██║
    ██╔═══╝░██║░░██║██║╚██╔╝██║██║░░██║██║░░██║██║░░██║██╔══██╗██║░░██║
    ██║░░░░░╚█████╔╝██║░╚═╝░██║╚█████╔╝██████╔╝╚█████╔╝██║░░██║╚█████╔╝
    ╚═╝░░░░░░╚════╝░╚═╝░░░░░╚═╝░╚════╝░╚═════╝░░╚════╝░╚═╝░░╚═╝░╚════╝░
    "
    echo -e "${GREEN} 𝕝𝕖𝕥❜𝕤 𝕤𝕥𝕒𝕣𝕥 𝕒 𝕟𝕖𝕨 𝕡𝕣𝕠𝕕𝕦𝕔𝕥𝕚𝕧𝕖 𝕤𝕖𝕤𝕤𝕤𝕚𝕠𝕟 ${FIN}"
    echo

    setSession
    performSession

}

main