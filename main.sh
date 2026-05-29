#!/bin/bash

# =========================================================
# SILENTWRAITHH - ULTIMATE VPS / SERVER INFO PANEL
# =========================================================

clear

# ================= COLORS =================
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
GRAY='\033[0;37m'
NC='\033[0m'

# ================= ASCII ==================
printf "${MAGENTA}"
cat << "EOF"

 ███████╗██╗██╗     ███████╗███╗   ██╗████████╗
 ██╔════╝██║██║     ██╔════╝████╗  ██║╚══██╔══╝
 ███████╗██║██║     █████╗  ██╔██╗ ██║   ██║
 ╚════██║██║██║     ██╔══╝  ██║╚██╗██║   ██║
 ███████║██║███████╗███████╗██║ ╚████║   ██║
 ╚══════╝╚═╝╚══════╝╚══════╝╚═╝  ╚═══╝   ╚═╝

██╗    ██╗██████╗  █████╗ ██╗████████╗██╗  ██╗
██║    ██║██╔══██╗██╔══██╗██║╚══██╔══╝██║  ██║
██║ █╗ ██║██████╔╝███████║██║   ██║   ███████║
██║███╗██║██╔══██╗██╔══██║██║   ██║   ██╔══██║
╚███╔███╔╝██║  ██║██║  ██║██║   ██║   ██║  ██║
 ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝

EOF
printf "${NC}"

echo
printf "${CYAN}============================================================${NC}\n"
printf "${GREEN}              ULTIMATE VPS MONITOR PANEL${NC}\n"
printf "${CYAN}============================================================${NC}\n"
echo

# ================= BASIC INFO =================

HOSTNAME=$(hostname)
OS_NAME=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')
KERNEL=$(uname -r)
ARCH=$(uname -m)
UPTIME=$(uptime -p)
CURRENT_TIME=$(date)
TIMEZONE=$(timedatectl 2>/dev/null | grep "Time zone" | awk '{print $3}')

printf "${YELLOW}🖥️  Hostname          : ${WHITE}%s${NC}\n" "$HOSTNAME"
printf "${YELLOW}🐧 Operating System   : ${WHITE}%s${NC}\n" "$OS_NAME"
printf "${YELLOW}🔧 Kernel Version     : ${WHITE}%s${NC}\n" "$KERNEL"
printf "${YELLOW}🏗️  Architecture      : ${WHITE}%s${NC}\n" "$ARCH"
printf "${YELLOW}⏱️  Uptime            : ${WHITE}%s${NC}\n" "$UPTIME"
printf "${YELLOW}🕒 Current Time       : ${WHITE}%s${NC}\n" "$CURRENT_TIME"
printf "${YELLOW}🌍 Timezone           : ${WHITE}%s${NC}\n" "$TIMEZONE"

echo
printf "${CYAN}==================== CPU INFORMATION ====================${NC}\n"

CPU_MODEL=$(lscpu | grep "Model name" | cut -d: -f2 | xargs)
CPU_CORES=$(nproc)
CPU_THREADS=$(lscpu | grep "Thread(s) per core" | awk '{print $4}')
CPU_MAX=$(lscpu | grep "CPU max MHz" | awk '{print $4}')
LOAD=$(uptime | awk -F'load average:' '{ print $2 }')

printf "${GREEN}🧠 CPU Model         : ${WHITE}%s${NC}\n" "$CPU_MODEL"
printf "${GREEN}⚡ CPU Cores         : ${WHITE}%s${NC}\n" "$CPU_CORES"
printf "${GREEN}🧵 Threads/Core      : ${WHITE}%s${NC}\n" "$CPU_THREADS"
printf "${GREEN}🚀 Max CPU MHz       : ${WHITE}%s${NC}\n" "$CPU_MAX"
printf "${GREEN}📈 Load Average      : ${WHITE}%s${NC}\n" "$LOAD"

echo
printf "${CYAN}==================== MEMORY INFORMATION ====================${NC}\n"

RAM_TOTAL=$(free -h | awk '/Mem:/ {print $2}')
RAM_USED=$(free -h | awk '/Mem:/ {print $3}')
RAM_FREE=$(free -h | awk '/Mem:/ {print $4}')
RAM_AVAIL=$(free -h | awk '/Mem:/ {print $7}')

SWAP_TOTAL=$(free -h | awk '/Swap:/ {print $2}')
SWAP_USED=$(free -h | awk '/Swap:/ {print $3}')

printf "${MAGENTA}🟩 RAM Used          : ${WHITE}%s${NC}\n" "$RAM_USED"
printf "${MAGENTA}🟦 RAM Free          : ${WHITE}%s${NC}\n" "$RAM_FREE"
printf "${MAGENTA}📦 RAM Available     : ${WHITE}%s${NC}\n" "$RAM_AVAIL"
printf "${MAGENTA}💾 Total RAM         : ${WHITE}%s${NC}\n" "$RAM_TOTAL"
printf "${MAGENTA}💿 Swap Used         : ${WHITE}%s${NC}\n" "$SWAP_USED"
printf "${MAGENTA}📀 Total Swap        : ${WHITE}%s${NC}\n" "$SWAP_TOTAL"

echo
printf "${CYAN}==================== DISK INFORMATION ====================${NC}\n"

DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
DISK_USED=$(df -h / | awk 'NR==2 {print $3}')
DISK_FREE=$(df -h / | awk 'NR==2 {print $4}')
DISK_PERCENT=$(df -h / | awk 'NR==2 {print $5}')

printf "${BLUE}💾 Disk Used         : ${WHITE}%s${NC}\n" "$DISK_USED"
printf "${BLUE}📦 Disk Free         : ${WHITE}%s${NC}\n" "$DISK_FREE"
printf "${BLUE}🗄️  Total Disk       : ${WHITE}%s${NC}\n" "$DISK_TOTAL"
printf "${BLUE}📊 Disk Usage        : ${WHITE}%s${NC}\n" "$DISK_PERCENT"

echo
printf "${CYAN}==================== NETWORK INFORMATION ====================${NC}\n"

PUBLIC_IP=$(curl -s ifconfig.me)
LOCAL_IP=$(hostname -I | awk '{print $1}')

COUNTRY=$(curl -s ipinfo.io/country)
CITY=$(curl -s ipinfo.io/city)
REGION=$(curl -s ipinfo.io/region)
ORG=$(curl -s ipinfo.io/org)

printf "${YELLOW}🌍 Public IP         : ${WHITE}%s${NC}\n" "$PUBLIC_IP"
printf "${YELLOW}🏠 Local IP          : ${WHITE}%s${NC}\n" "$LOCAL_IP"
printf "${YELLOW}📍 Country           : ${WHITE}%s${NC}\n" "$COUNTRY"
printf "${YELLOW}🏙️  City             : ${WHITE}%s${NC}\n" "$CITY"
printf "${YELLOW}🗺️  Region           : ${WHITE}%s${NC}\n" "$REGION"
printf "${YELLOW}🏢 ISP/ORG           : ${WHITE}%s${NC}\n" "$ORG"

echo
printf "${CYAN}==================== VIRTUALIZATION ====================${NC}\n"

VIRT=$(systemd-detect-virt)

if [ "$VIRT" = "docker" ]; then
    VIRT_STATUS="Docker Container"
elif [ "$VIRT" = "lxc" ]; then
    VIRT_STATUS="LXC Container"
elif [ "$VIRT" = "openvz" ]; then
    VIRT_STATUS="OpenVZ VPS"
elif [ "$VIRT" = "kvm" ]; then
    VIRT_STATUS="KVM VPS"
elif [ "$VIRT" = "vmware" ]; then
    VIRT_STATUS="VMware VM"
elif [ "$VIRT" = "oracle" ]; then
    VIRT_STATUS="Oracle VM"
elif [ "$VIRT" = "qemu" ]; then
    VIRT_STATUS="QEMU VM"
elif [ "$VIRT" = "microsoft" ]; then
    VIRT_STATUS="Hyper-V VM"
elif [ "$VIRT" = "none" ]; then
    VIRT_STATUS="Bare Metal / Physical Machine"
else
    VIRT_STATUS="$VIRT"
fi

printf "${GREEN}🧱 Virtualization    : ${WHITE}%s${NC}\n" "$VIRT_STATUS"

# Detect unprivileged container
if [ -f /proc/self/uid_map ]; then
    UIDMAP=$(cat /proc/self/uid_map | head -n1 | awk '{print $1}')
    if [ "$UIDMAP" != "0" ]; then
        printf "${RED}🔒 Container Mode    : ${WHITE}Unprivileged Container${NC}\n"
    else
        printf "${GREEN}🔓 Container Mode    : ${WHITE}Privileged / Normal${NC}\n"
    fi
fi

echo
printf "${CYAN}==================== SYSTEM INFORMATION ====================${NC}\n"

CURRENT_USER=$(whoami)
SHELL_NAME=$SHELL
LOGGED_USERS=$(who | wc -l)
PACKAGE_COUNT=$(dpkg -l 2>/dev/null | wc -l)
HOST_USERS=$(cut -d: -f1 /etc/passwd | wc -l)

printf "${GREEN}👤 Current User      : ${WHITE}%s${NC}\n" "$CURRENT_USER"
printf "${GREEN}🐚 Shell             : ${WHITE}%s${NC}\n" "$SHELL_NAME"
printf "${GREEN}👥 Logged Users      : ${WHITE}%s${NC}\n" "$LOGGED_USERS"
printf "${GREEN}📦 Installed Pkgs    : ${WHITE}%s${NC}\n" "$PACKAGE_COUNT"
printf "${GREEN}🧑‍💻 System Users      : ${WHITE}%s${NC}\n" "$HOST_USERS"

echo
printf "${CYAN}==================== TOP PROCESSES ====================${NC}\n"

ps -eo pid,user,%mem,%cpu,cmd --sort=-%cpu | head -10

echo
printf "${CYAN}==================== INTERNET TEST ====================${NC}\n"

ping -c 1 google.com >/dev/null 2>&1

if [ $? -eq 0 ]; then
    printf "${GREEN}✅ Internet Status   : CONNECTED${NC}\n"
else
    printf "${RED}❌ Internet Status   : DISCONNECTED${NC}\n"
fi

echo
printf "${CYAN}============================================================${NC}\n"
printf "${MAGENTA}          PANEL CREATED BY SILENTWRAITHH${NC}\n"
printf "${CYAN}============================================================${NC}\n"
echo

read -p "➡️  Press ENTER to exit..."
```
