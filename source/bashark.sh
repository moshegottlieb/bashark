#!/bin/bash

# https://i.stack.imgur.com/a2S4s.png

SHARED_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)
END_UNDERLINE=$(tput rmul)
HIDE_CURSOR=$(tput civis)
SHOW_CURSOR=$(tput cnorm)
STANDOUT=$(tput smso)
END_STANDOUT=$(tput rmso)

function color {
	if [ "${1}" = "" ]; then
		echo -n "${NORMAL}";
	else
		tput setaf $1
	fi
}

function bold {
	echo -n $BOLD
}

function normal {
	color;
}

function echo_underline {
	echo ${UNDERLINE}$1${END_UNDERLINE}
}

function colorecho {
	if [ "${2}" = "" ]; then
		echo "Usage: ${0} {color} {text}"
		return 1
	fi
	color $1;
	echo "${2}$(normal)"
}

function header() {
    printf "\r"
    case "$2" in
        'done')
            C=${GREEN}
            T="\033[0K"
            ;;
		'error')
            C=${RED}
            T="\033[0K"
            ;;
        *)
            C=${LIME_YELLOW}
            T=""
            ;;
    esac

    printf "${WHITE}${BRIGHT}[${NORMAL}${C}${1}${WHITE}${BRIGHT}${BRIGHT}]${NORMAL} ${C}${T}"

    if [ "$2" != "" ]; then
        printf "\n"
    fi
}

function cmd {

    if [[ $- == *e* ]]; then
        SET_E=1
        set +e
    fi

    TMP=/tmp/cmd_log
    MSG=${1}
    header "${MSG}"
    ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} &> "${TMP}" &
    PID=$!
    "${SHARED_DIR}/anim.sh" &
    ANIM_PID=$!

    trap "kill ${ANIM_PID} 2>/dev/null" TERM
    trap "kill ${ANIM_PID} 2>/dev/null" EXIT
	trap "kill ${ANIM_PID} 2>/dev/null" INT

    wait "${PID}"
    RET=$?
    kill ${ANIM_PID} 2>/dev/null
    wait ${ANIM_PID} 2>/dev/null
    OUTPUT=$(cat "${TMP}")
    rm -f "${TMP}"    
    if [ "${RET}" != "0" ]; then
		header "${MSG}" "error"
        if [ ! -z "${OUTPUT}" ]; then
            color 216
            echo "${OUTPUT}" > /dev/stderr
        fi
        echo -n "${NORMAL}"
    else
        header "${MSG}" "done"
    fi
    if [ "$SET_E" = 1 ]; then
        set -e
    fi
    printf "${NORMAL}${SHOW_CURSOR}"
    return $RET
}
