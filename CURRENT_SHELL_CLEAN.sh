#!/bin/bash

#Setting Color Printing Variables for stdout
LIGHTBLUE='\033[1;34m'
YELLOW='\033[1;33m'
BLUE="\033[0;34m"
LIGHTPURPLE='\033[1;35m'
GREEN='\033[1;32m'
RED="\033[0;31m"
NC='\033[0m' # No Color

#Prints the shell executable (ex - /bin/bash, /usr/bin/bash, etc.)
echo "The current shell is located at:"
echo -e "${LIGHTBLUE}${SHELL}${NC}" #echo tack-"e" is used to allow backslash escapes #WORKING!!!
echo ""

echo -e "The Current PID of this script being executed is "${GREEN}"$$"${NC}""
echo ""

echo "Shell PID, PSEUDO-TTY, UPTIME & SHELL"
echo ""
RESULT1=`bash -c ps -p "$$" > /tmp/dollaz.tmp && cat /tmp/dollaz.tmp | grep -v ps | head -2 && rm -f /tmp/dollaz.tmp #&& echo $RESULT1`
RESULT2=`echo "${RESULT1}" > /tmp/2dollaz.tmp && tail -1 /tmp/2dollaz.tmp`
echo "${RESULT2}" > /tmp/momoney.tmp
RESULT3=`cat /tmp/momoney.tmp | head -1 || tail -1`
echo ${RESULT3} > /tmp/bigmoney.tmp
RESULT4=`awk 'NF>1{print $NF}' /tmp/bigmoney.tmp`
RESULT5=`sed "s/$RESULT4//g" /tmp/bigmoney.tmp`
echo -e "$RESULT5" > /tmp/bigbigmoney.tmp
RESULT6=`head -1 /tmp/bigbigmoney.tmp | awk '{ print $1 }'`
RESULT7=`sed "s/$RESULT6//g" /tmp/bigbigmoney.tmp`
echo -e ${YELLOW}${RESULT6}${NC}${RESULT7}${LIGHTBLUE}${RESULT4}${NC}

