#!/bin/bash
#Setting Color Printing Variables for stdout
LIGHTBLUE='\033[1;34m'
YELLOW='\033[1;33m'
BLUE="\033[0;34m"
LIGHTPURPLE='\033[1;35m'
GREEN='\033[1;32m'
RED="\033[0;31m"
NC='\033[0m' # No Color
USERIDVAR=`whoami`

echo ""
echo ""

echo -e "This script is being run by: "${GREEN}"$USERIDVAR"${NC}"."

#echo "==================================================="
#echo "| Printing the current user running this script...|"
#echo "|         $(whoami) is the current user           |"
#echo "==================================================="
echo ""
echo ""

#read -p "HIT ANY BUTTON TO CONTINE!" anybutton

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
echo ""
echo ""
####################################################################################################

echo "Printing basic user id information for $USER..."
#id
id $USER
echo ""
echo ""

EUIDVAR=`id -u`
echo "$EUIDVAR is the euid (effective user ID)"
echo ""
echo ""

RUIDVAR=`id -u -r`
echo "$RUIDVAR is the ruid (real UID)"
echo ""
echo ""

echo "Showing current user connections"
loginctl
echo ""
echo ""

#CHECKS THE NUMBER OF A SEAT
#LOGINSVAR=`loginctl | grep -i "${USERIDVAR}"`
#echo "The user "${USERIDVAR}" currently has "${LOGINSVAR}" sessions open."

#CHECKS TO SEE IF THERE IS A SEAT FOR THE USER - MEANING LOCAL=YES
SEATLOCALYES=`loginctl | grep $USER | grep seat`
#THE IF CONDITION FOR LOCAL
if [[ $(echo ${SEATLOCALYES}) ]]; then
    echo "There are LOCAL sessions for user ${USERIDVAR}" #THERE IS A SEAT...
fi
echo ""
echo ""

#If local session is present, then print its number and assign variable.
SLOCALYNUM=`loginctl seat-status | head -1`

SEATVAR=`loginctl show-seat $SLOCALYNUM | grep ActiveSession | sed 's/ActiveSession=//'`
echo "$SLOCALYNUM is the seat for user $USERIDVAR"
echo ""
echo ""

#CHECKS TO SEE IF THERE IS A SEAT FOR THE USER - MEANING LOCAL=NO (NO SEAT)
SEATLOCALNO=`loginctl | grep $USER | grep pts`
if [[ ${SEATLOCALNO} ]]; then
    echo "There are remote sessions for user ${USERIDVAR}" #There is NO SEAT...
fi

echo ""

#Grabs the Session Seat Number (Used in Identifying tty if available...)
SEATNUMVAR=`loginctl | grep $USER | grep seat | awk '{ print $4 }'`

echo "Printing All Users with Login capabilities."
cat /etc/passwd | grep -v nologin | grep -v false
echo ""
echo ""

echo "Printing User Information via passwd..."
PWDVAR=`cat /etc/passwd | grep $RUIDVAR`
echo ""
echo ""

#PIDVAR=$$

#echo "$PIDVAR is the current shell PID..."
#echo ""
#echo ""

#echo "Printing shell process information to stdout..."
#ps -ef | grep -i $$ | grep -v grep | grep -v "ps -ef"
#echo ""
#echo ""

#echo "Printing additional shell information to stdout..."
#ps aux |grep -i $$ | grep -v grep
#echo ""
#echo ""

#PTSVAR=$(tty)

#echo "Getting current pseudo TTY of this shell..."
#echo "${PTSVAR} is the current pseudo TTY"
#echo ""
#echo ""

#Print the seat number...
echo "${SLOCALYNUM} is the current user's seat number of who is executing this script."
echo ""
echo ""

echo "Printing RunLevel in Linux..."
who -r
echo ""
echo ""

echo "Printing who is logged in..."
who -H -a
echo ""
echo ""

echo "Printing Extended User Information... "
w -o
echo ""
echo ""

echo "Printing last 5 logged user sessions..."
last | head -5
echo ""

echo "Printing CGroup and Graphical Shell-related Information..."
loginctl
echo ""
echo ""

#### FIX THIS TO ADD IT TO THE SCRIPT TO FIND TTY-TTY####
#echo "Printing the current TTY for this session..."
#TTYVAR=`loginctl |grep -i $EUID | awk '{ print $5 }' | grep -i $SEATVAR`
TTYVAR=`loginctl |grep -i $EUID | grep -i $SEATVAR | awk '{ print $5 }'`
#echo "$TTYVAR is the current TTY"
#echo ""
#echo ""

#### FIX THIS TO ADD IT TO THE SCRIPT TO FIND TTY-TTY####
TTYLA=`ls -la /dev/${TTYVAR}`
echo "Printing the ownership and permissions of /dev/tty${TTYVAR} ..."
echo "${TTYLA}"
echo ""



#echo "Printing General Namespace Information..."
#lsns -W -u --output-all
#echo ""

#echo "Printing Systemd Control Groups Listing & Kernel Threads..."
#systemd-cgls -a -k
#echo ""
