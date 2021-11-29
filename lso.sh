#!/bin/bash
# Created by Natacode
# clear

# ========================= Config 
# Directory LostSaga Origin
DLOST="D:\Games\Lost Saga Origin"
# Original IOP
RSORI="rs.iop"
# MOD IOP
RSMOD="rsmod.iop"
# Backup File
RSBAK="rs.iop.bak"

# Change Directory to LostSaga
cd "$DLOST"

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
ENDCOLOR="\e[0m"

function startGames {
	echo "[i] Starting LostSaga Launcher..."
	start autoluncher.exe
}

function usingMod {
	# Rename Original
	if [ ! -f "$RSMOD" ]; then
		echo -e "${RED}[!] You have been using modfile now -_-${ENDCOLOR}"
	else
		echo
		echo -e "\e[32m[i] TRYING ON Modfile...${ENDCOLOR}"
		
		mv $RSORI $RSBAK
		echo [~] Backup file $RSORI to $RSBAK
		
		mv $RSMOD $RSORI
		echo [~] Change modfile $RSMOD as $RSORI
		echo -e "${GREEN}[!] Successfuly Activate MOD! (Space on Launcher)${ENDCOLOR}"
	fi
}

function usingOri {
	# Rename Modification
	if [ -f "$RSBAK" ]; then
		echo
		echo -e "\e[33m[i] TRYING OFF Modfile...${ENDCOLOR}"
		
		# echo [!] Backup file founded.
		mv $RSORI $RSMOD
		# echo [~] Change back modfile $RSORI to $RSMOD
		
		mv $RSBAK $RSORI
		echo [~] Rename backup file to $RSORI
		
		echo -e "${GREEN}[!] Successfuly Switch to ORIGINAL FILE${ENDCOLOR}"
		startGames
	else 
		echo [!] $RSBAK "does not exist!"
		echo -e "${RED}[x] FAILED! Maybe you have been using Original $RSORI$ENDCOLOR"
	fi
}

echo -e "\e[33m==============================="
echo -e "Lost Saga EZ ON/OFF Modfile"
echo -e "Created by : Natacode"
echo -e "===============================${ENDCOLOR}"

echo -e "[~] LS : ${BLUE} $DLOST ${ENDCOLOR}"

if [ ! -f "$RSMOD" ]; then
	echo -e "${GREEN}[!] MOD IOP : ON ${ENDCOLOR}"
	usingOri
else
	echo -e "${RED}[!] MOD IOP : OFF${ENDCOLOR}"
	startGames
fi

# echo

# echo -e "[1] ${GREEN}Activate${ENDCOLOR} Modfile rsmod.iop"

# echo -e "[2] Play without mod rs.iop"

echo 

echo -e "${YELLOW}[!] Please wait until the launcher is ready to start..${ENDCOLOR}"
read -p "[?] Then, type 1 to using MOD / enter to cancel : " VARMENU

if [ "$VARMENU" = "1" ]; then
	usingMod
else
	echo -e "$RED[x] OK Canceled.${ENDCOLOR}"
fi