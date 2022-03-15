#!/bin/bash

SHARED_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
. "${SHARED_DIR}/bashark.sh"

case $(($RANDOM % 13)) in
0)
    ANIM=("|" "/" "-" "\\")
    ;;
1)
    ANIM=(▁ ▂ ▃ ▄ ▅ ▆ ▇ █ ▇ ▆ ▅ ▄ ▃ ▂ ▁)
    ;;
2)
    ANIM=(◴ ◵ ◶ ◷)
    ;;
3)
    ANIM=(◐ ◒ ◑ ◓)
    ;;
4)
    ANIM=(◜ ◝ ◞ ◟)
    ;;
5)
    ANIM=(↴ ↲ ↱ ↰)
    ;;
6)
    ANIM=(↣ ↦ → ↝ ⇝)
    ;;
7)
    ANIM=(⇒ ⇘ ⇓	⇙ ⇐ ⇖ ⇑ ⇗)
    ;;
8)
    ANIM=(⋮ ⋰ ⋯ ⋱)
    ;;
9)
    ANIM=(⌌	 ⌍ ⌏ ⌎)
    ;;
10)
    ANIM=(① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩ ⑪ ⑫ ⑬ ⑭ ⑮ ⑯ ⑰ ⑱ ⑲ ⑳)
    ;;
11)
    ANIM=(⚬ ⚭ ⚮ ⚯ ⚮ ⚭)
    ;;
12)
    ANIM=(☰ ☱ ☳ ☷ ☶ ☴ ☰ ☴ ☶ ☷ ☳ ☱)
    ;;
esac



DELAY=0.1

FIRST_COLOR=232
LAST_COLOR=255
CA=1
COLOR=${FIRST_COLOR}
LEN=${#ANIM[@]}

trap "echo -n ${SHOW_CURSOR}" EXIT

echo -n "${HIDE_CURSOR}"
while [ 1 ]; do
	for (( i=0; i<${LEN}; i++ ));
    do
        color ${COLOR}
        COLOR=$((${COLOR}+${CA}))
        if [ ${COLOR} -eq ${LAST_COLOR} ] || [ ${COLOR} -eq ${FIRST_COLOR} ] ; then
            # Toggle direction
            CA=$((${CA}*-1))
        fi
        echo -n "${ANIM[$i]}"
        color
        sleep ${DELAY}
        echo -ne "\033[1D"
    done
done
