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
#echo -e "\033[0;31m$SHELL\033][0m" #echo tack-"e" is used to allow backslash escapes
#echo -e "\033[31m${SHELL}\033]" #echo tack-"e" is used to allow backslash escapes #WORKING-ISH
#echo -e "${RED}${SHELL}${NC}" #echo tack-"e" is used to allow backslash escapes #WORKING!!!
echo -e "${LIGHTBLUE}${SHELL}${NC}" #echo tack-"e" is used to allow backslash escapes #WORKING!!!
#echo -e "${RED}$SHELL"
echo ""

#The below command prints the following:
#    PID TTY          TIME(the time it was executed/processed) CMD(comments)
#   $PID pts/#    00:00:00                                     bash

#ps -p $$

#PSVAR=`ps -p "$$" | awk '{ print $4 }'`
#echo $PSVAR


echo -e "The Current PID of this script being executed is "${GREEN}"$$"${NC}""
echo ""

echo "Shell PID, TTY, UPTIME & SHELL"
echo ""
#ps -p $$ > /tmp/dollaz.tmp
RESULT1=`bash -c ps -p "$$" > /tmp/dollaz.tmp && cat /tmp/dollaz.tmp | grep -v ps | head -2 && rm -f /tmp/dollaz.tmp #&& echo $RESULT1`
#echo "$RESULT1"
RESULT2=`echo "${RESULT1}" > /tmp/2dollaz.tmp && tail -1 /tmp/2dollaz.tmp`
#RESULT2=`tail -3 /tmp/dollaz.tmp | grep -v ps`
echo "${RESULT2}" > /tmp/momoney.tmp
#rm -f /tmp/2dollaz.tmp
RESULT3=`cat /tmp/momoney.tmp | head -1 || tail -1`
echo ${RESULT3} > /tmp/bigmoney.tmp
RESULT4=`awk 'NF>1{print $NF}' /tmp/bigmoney.tmp`
#echo "$RESULT4.... IS RESULT 4 PRINTED"
#echo ${RESULT4}
#RESULT5=`head -1 /tmp/bigmoney.tmp`
#echo -e $RESULT5
#echo $RESULT3 | awk 
#echo $RESULT3 #| sed 's/\$RESULT3//g'
#echo "catting /tmp/bigmoney.tmp..."
#cat /tmp/bigmoney.tmp
RESULT5=`sed "s/$RESULT4//g" /tmp/bigmoney.tmp`
echo -e "$RESULT5" > /tmp/bigbigmoney.tmp
#echo "catting bigbigmoney..." 
#cat /tmp/bigbigmoney.tmp
RESULT6=`head -1 /tmp/bigbigmoney.tmp | awk '{ print $1 }'`
RESULT7=`sed "s/$RESULT6//g" /tmp/bigbigmoney.tmp`
#echo -e $RESULT7
echo -e ${YELLOW}${RESULT6}${NC}${RESULT7}${LIGHTBLUE}${RESULT4}${NC}
#echo $RESULT4
#echo $RESULT4
#rm -f /tmp/momoney.tmp
#echo ${RESULT1} ${LIGHTBLUE}awk '{ print $NF }'${NC}
#awk '{print $NF}' /tmp/dollaz.tmp

#bash -c ps -p "$$" | awk '{ print $ 4}'

#echo "Current shell process information is run with 'ps -p \$\$' in your terminal:"
#echo "This is due to the fact that if this command is ran via this script it will not be accurate.  So, copy, paste and run the following:"
#echo ""
#echo "ps -p \$\$"
#echo ""
#echo "ps -p $$"

#echo "The type of shell is:"
#PS=$(whereis ps | grep -i ps
#PS=$(whereis ps | awk '{print $2 }')
#echo $PS
#eval $PS | awk '{ print $ 4}' | grep -v CMD
#PS2=$("$PS" -p $SHELL)

#rm -f /tmp/dollaz.tmp /tmp/2dollaz.tmp /tmp/momoney.tmp /tmp/bigmoney.tmp /tmp/bigbigmoney.tmp
