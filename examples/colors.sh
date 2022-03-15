#!/bin/bash
source ~/.bashark/bashark.sh

echo "${UNDERLINE}${BOLD}${POWDER_BLUE}Color Demo${NORMAL}"
echo ""

I=0

echo -n ${REVERSE}
while [ $I -le 255 ]; do
    printf "%s%03d" "$(color $I)" "$I"
    I=$(($I + 1))
done

echo "${NORMAL}"
