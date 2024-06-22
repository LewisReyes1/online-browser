#!/bin/bash

# Colors
declare -A COLORS=(
    [reset]='\e[0m'
    [black]='\e[0;30m' [red]='\e[0;31m' [green]='\e[0;32m' [yellow]='\e[0;33m'
    [blue]='\e[0;34m' [purple]='\e[0;35m' [cyan]='\e[0;36m' [white]='\e[0;37m'
    [bblack]='\e[1;30m' [bred]='\e[1;31m' [bgreen]='\e[1;32m' [byellow]='\e[1;33m'
    [bblue]='\e[1;34m' [bpurple]='\e[1;35m' [bcyan]='\e[1;36m' [bwhite]='\e[1;37m'
)

# Clear screen and trap signals
clear
trap "tput cnorm; exit" SIGINT SIGQUIT SIGTSTP

# Print header
echo ""
sleep 0.1
echo -e "${COLORS[cyan]}+${COLORS[yellow]}----------------------------------------------------------${COLORS[cyan]}+"
echo -e "${COLORS[yellow]}|${COLORS[reset]}                                                          ${COLORS[yellow]}|"
echo -e "${COLORS[yellow]}|${COLORS[green]}     ██████╗ ███╗   ██╗██╗     ██╗███╗   ██╗███████╗${COLORS[reset]}          ${COLORS[yellow]}|"
echo -e "${COLORS[yellow]}|${COLORS[green]}    ██╔═══██╗████╗  ██║██║     ██║████╗  ██║██╔════╝${COLORS[reset]}           ${COLORS[yellow]}|"
echo -e "${COLORS[yellow]}|${COLORS[green]}    ██║   ██║██╔██╗ ██║██║     ██║██╔██╗ ██║█████╗${COLORS[reset]}            ${COLORS[yellow]}|"
echo -e "${COLORS[yellow]}|${COLORS[bgreen]}    ██║   ██║██║╚██╗██║██║     ██║██║╚██╗██║██╔══╝${COLORS[reset]}            ${COLORS[yellow]}|"
echo -e "${COLORS[yellow]}|${COLORS[bgreen]}    ╚██████╔╝██║ ╚████║███████╗██║██║ ╚████║███████╗${COLORS[reset]}          ${COLORS[yellow]}|"
echo -e "${COLORS[yellow]}|${COLORS[green]}     ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝${COLORS[reset]}           ${COLORS[yellow]}|"
echo -e "${COLORS[yellow]}|${COLORS[reset]}                                                          ${COLORS[yellow]}|"
echo -e "${COLORS[cyan]}+${COLORS[yellow]}----------------------------------------------------------${COLORS[cyan]}+"
echo -e "${COLORS[yellow]}                           ${COLORS[bred]} Online Browser ${COLORS[byellow]}by${COLORS[bgreen]} Hamza Hammouch${COLORS[cyan]} powered by${COLORS[bpurple]} linuxserver${COLORS[yellow]}"
echo -e "${COLORS[cyan]}+${COLORS[yellow]}--------------------------------------------------------${COLORS[cyan]}+"
echo ""

# Menu
echo -e "${COLORS[yellow]}+${COLORS[white]}---------------------------------------------------${COLORS[yellow]}+"
echo -e "${COLORS[white]}| ${COLORS[yellow]} ID ${COLORS[white]} |              ${COLORS[bpurple]}Browser Name${COLORS[reset]}                ${COLORS[white]}|"
echo -e "${COLORS[yellow]}+${COLORS[white]}---------------------------------------------------${COLORS[yellow]}+"
echo -e "${COLORS[white]}| ${COLORS[red]}[${COLORS[yellow]}1${COLORS[red]}]${COLORS[white]} |${COLORS[green]} Install Chromium${COLORS[reset]}              ${COLORS[white]}|"
echo -e "${COLORS[white]}| ${COLORS[red]}[${COLORS[yellow]}2${COLORS[red]}]${COLORS[white]} |${COLORS[green]} Install Firefox${COLORS[reset]}               ${COLORS[white]}|"
echo -e "${COLORS[white]}| ${COLORS[red]}[${COLORS[yellow]}3${COLORS[red]}]${COLORS[white]} |${COLORS[green]} Install Opera${COLORS[reset]}                 ${COLORS[white]}|"
echo -e "${COLORS[white]}| ${COLORS[red]}[${COLORS[yellow]}4${COLORS[red]}]${COLORS[white]} |${COLORS[green]} Install Mullvad Browser${COLORS[reset]}     ${COLORS[white]}|"
echo -e "${COLORS[yellow]}+${COLORS[white]}---------------------------------------------------${COLORS[yellow]}+"
echo ""

# User prompt
echo -e "${COLORS[white]}${COLORS[red]} [${COLORS[cyan]}!Note:${COLORS[red]}]${COLORS[white]} If your choice is Chromium type ${COLORS[green]}1${COLORS[white]} not ${COLORS[red]}01${COLORS[reset]}"
echo -e "${COLORS[white]}${COLORS[red]} [${COLORS[cyan]}!${COLORS[red]}]${COLORS[white]} Type the${COLORS[bred]} ID${COLORS[white]} of your choice: ${COLORS[reset]}"
read -p "" choice

# Browser installation
case $choice in
    1)
        echo "Installing Chromium..."
        docker run -d \
            --name=chromium \
            --security-opt seccomp=unconfined \
            -e PUID=1000 \
            -e PGID=1000 \
            -e TZ=Etc/UTC \
            -p 3000:3000 \
            -p 3001:3001 \
            -v /chromium:/config \
            --shm-size="7gb" \
            --restart unless-stopped \
            ghcr.io/linuxserver/chromium:latest
        ;;
    2)
        echo "Installing Firefox..."
        docker run -d \
            --name=firefox \
            --security-opt seccomp=unconfined \
            -e PUID=1000 \
            -e PGID=1000 \
            -e TZ=Etc/UTC \
            -p 3000:3000 \
            -p 3001:3001 \
            -v /firefox:/config \
            --shm-size="7gb" \
            --restart unless-stopped \
            ghcr.io/linuxserver/firefox:latest
        ;;
    3)
        echo "Installing Opera..."
        docker run -d \
            --name=opera \
            --security-opt seccomp=unconfined \
            -e PUID=1000 \
            -e PGID=1000 \
            -e TZ=Etc/UTC \
            -p 3000:3000 \
            -p 3001:3001 \
            -v /opera:/config \
            --shm-size="7gb" \
            --restart unless-stopped \
            ghcr.io/linuxserver/opera:latest
        ;;
    4)
        echo "Installing Mullvad Browser..."
        docker run -d \
            --name=mullvad-browser \
            --security-opt seccomp=unconfined \
            -e PUID=1000 \
            -e PGID=1000 \
            -e TZ=Etc/UTC \
            -p 3000:3000 \
            -p 3001:3001 \
            -v /mullvad-browser:/config \
            --shm-size="7gb" \
            --restart unless-stopped \
            ghcr.io/linuxserver/mullvad-browser:latest
        ;;
    *)
        echo "Invalid choice. Please enter 1, 2, 3, or 4."
        exit 1
        ;;
esac

# Completion message
clear
echo ""
echo -e "${COLORS[white]}${COLORS[red]} [${COLORS[green]} ✔ ${COLORS[red]}]${COLORS[white]} Browser installation completed successfully ( •̀ ω •́ )✧${COLORS[reset]}"
echo ""
echo -e "${COLORS[red]} ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${COLORS[blue]}⢀⣠⣴⣾⣿⣿⣿⣶⣄⡀⠀"
echo -e "${COLORS[red]} ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${COLORS[blue]}⣀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄"
echo -e "${COLORS[red]} ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${COLORS[blue]}⢀⣠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷"
echo -e "${COLORS[red]} ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤${COLORS[blue]}⠾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠉⠙⣿⣿⡿"
echo -e "${COLORS[red]} ⠀⠀⠀⠀⠀⢀⣠⠶⠛⠁⠀⠀${COLORS[blue]}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣄⣠⣿⡿⠁"
echo -e "${COLORS[red]} ⠀⠀⣀⡤⠞⠉⠀⠀⠀⠀⠀⠀${COLORS[blue]}⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠀⠀"
echo -e "${COLORS[red]} ⢀⡾⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${COLORS[blue]}⠙⢿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀"
echo -e "${COLORS[red]} ⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⡀${COLORS[blue]}⠙⢿⣿⡿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo -e "${COLORS[red]} ⣿⠀⠀⠀⠀⠀⠀⠀⣠⣴⣾⡿⠟⢋⣤⠶⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo -e "${COLORS[red]} ⠘⣧⡀⠀⢰⣿⣶⣿⠿⠛⣩⡴⠞⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo -e "${COLORS[red]} ⠀⠈⠛⠦⣤⣤⣤⡤⠖⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo -e "${COLORS[reset]}"
