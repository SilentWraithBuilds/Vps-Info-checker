# SilentWraithh Advanced VPS Info Script

```bash
#!/bin/bash

# ==========================================
# SILENTWRAITHH - ADVANCED VPS INFO PANEL
# ==========================================

clear

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

# ASCII Banner
printf "${MAGENTA}"
echo " ███████╗██╗██╗     ███████╗███╗   ██╗████████╗"
echo " ██╔════╝██║██║     ██╔════╝████╗  ██║╚══██╔══╝"
echo " ███████╗██║██║     █████╗  ██╔██╗ ██║   ██║   "
echo " ╚════██║██║██║     ██╔══╝  ██║╚██╗██║   ██║   "
echo " ███████║██║███████╗███████╗██║ ╚████║   ██║   "
echo " ╚══════╝╚═╝╚══════╝╚══════╝╚═╝  ╚═══╝   ╚═╝   "
echo ""
echo "██╗    ██╗██████╗  █████╗ ██╗████████╗██╗  ██╗"
echo "██║    ██║██╔══██╗██╔══██╗██║╚══██╔══╝██║  ██║"
echo "██║ █╗ ██║██████╔╝███████║██║   ██║   ███████║"
echo "██║███╗██║██╔══██╗██╔══██║██║   ██║   ██╔══██║"
echo "╚███╔███╔╝██║  ██║██║  ██║██║   ██║   ██║  ██║"
echo " ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝"
printf "${NC}"

echo
printf "${CYAN}============================================================${NC}\n"
printf "${GREEN}            ADVANCED VPS MONITORING PANEL${NC}\n"
printf "${CYAN}============================================================${NC}\n"
echo

# Basic System Info
HOSTNAME=$(hostname)
OS_NAME=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')
KERNEL=$(uname -r)
ARCH=$(uname -m)
UPTIME=$(uptime -p)
TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3}')
CURRENT_TIME=$(date)

printf "${YELLOW}🖥️  Hostname          : ${WHITE}$HOSTNAME${NC}\n"
printf "${YELLOW}🐧 Operating System   : ${WHITE}$OS_NAME${NC}\n"
printf "${YELLOW}🔧 Kernel Version     : ${WHITE}$KERNEL${NC}\n"
printf "${YELLOW}🏗️  Architecture      : ${WHITE}$ARCH${NC}\n"
printf "${YELLOW}⏱️  Uptime            : ${WHITE}$UPTIME${NC}\n"
printf "${YELLOW}🕒 Current Time       : ${WHITE}$CURRENT_TIME${NC}\n"
printf "${YELLOW}🌍 Timezone           : ${WHITE}$TIMEZONE${NC}\n"

echo
printf "${CYAN}==================== CPU INFORMATION ====================${NC}\n"

CPU_MODEL=$(lscpu | grep "Model name" | cut -d: -f2 | xargs)
CPU_CORES=$(nproc)
CPU_THREADS=$(lscpu | grep "Thread(s) per core" | awk '{print $4}')
CPU_FREQ=$(lscpu | grep "CPU MHz" | awk '{print $3}' | head -n1)
LOAD=$(uptime | awk -F'load average:' '{ print $2 }')

printf "${GREEN}🧠 CPU Model         : ${WHITE}$CPU_MODEL${NC}\n"
printf "${GREEN}⚡ CPU Cores         : ${WHITE}$CPU_CORES${NC}\n"
printf "${GREEN}🧵 Threads/Core      : ${WHITE}$CPU_THREADS${NC}\n"
printf "${GREEN}🚀 CPU Frequency     : ${WHITE}${CPU_FREQ} MHz${NC}\n"
printf "${GREEN}📈 Load Average      : ${WHITE}$LOAD${NC}\n"

echo
printf "${CYAN}==================== MEMORY INFORMATION ====================${NC}\n"

RAM_TOTAL=$(free -h | awk '/Mem:/ {print $2}')
RAM_USED=$(free -h | awk '/Mem:/ {print $3}')
RAM_FREE=$(free -h | awk '/Mem:/ {print $4}')
SWAP_TOTAL=$(free -h | awk '/Swap:/ {print $2}')
SWAP_USED=$(free -h | awk '/Swap:/ {print $3}')

printf "${MAGENTA}🟩 RAM Used          : ${WHITE}$RAM_USED${NC}\n"
printf "${MAGENTA}🟦 RAM Free          : ${WHITE}$RAM_FREE${NC}\n"
printf "${MAGENTA}📦 Total RAM         : ${WHITE}$RAM_TOTAL${NC}\n"
printf "${MAGENTA}💿 Swap Used         : ${WHITE}$SWAP_USED${NC}\n"
printf "${MAGENTA}📀 Total Swap        : ${WHITE}$SWAP_TOTAL${NC}\n"

echo
printf "${CYAN}==================== DISK INFORMATION ====================${NC}\n"

DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
DISK_USED=$(df -h / | awk 'NR==2 {print $3}')
DISK_FREE=$(df -h / | awk 'NR==2 {print $4}')
DISK_PERCENT=$(df -h / | awk 'NR==2 {print $5}')

printf "${BLUE}💾 Disk Used         : ${WHITE}$DISK_USED${NC}\n"
printf "${BLUE}📦 Disk Free         : ${WHITE}$DISK_FREE${NC}\n"
printf "${BLUE}🗄️  Total Disk       : ${WHITE}$DISK_TOTAL${NC}\n"
printf "${BLUE}📊 Disk Usage        : ${WHITE}$DISK_PERCENT${NC}\n"

echo
printf "${CYAN}==================== NETWORK INFORMATION ====================${NC}\n"

PUBLIC_IP=$(curl -s ifconfig.me)
LOCAL_IP=$(hostname -I | awk '{print $1}')
COUNTRY=$(curl -s ipinfo.io/country)
CITY=$(curl -s ipinfo.io/city)
REGION=$(curl -s ipinfo.io/region)
ORG=$(curl -s ipinfo.io/org)

printf "${YELLOW}🌍 Public IP         : ${WHITE}$PUBLIC_IP${NC}\n"
printf "${YELLOW}🏠 Local IP          : ${WHITE}$LOCAL_IP${NC}\n"
printf "${YELLOW}📍 Country           : ${WHITE}$COUNTRY${NC}\n"
printf "${YELLOW}🏙️  City             : ${WHITE}$CITY${NC}\n"
printf "${YELLOW}🗺️  Region           : ${WHITE}$REGION${NC}\n"
printf "${YELLOW}🏢 ISP/ORG           : ${WHITE}$ORG${NC}\n"

echo
printf "${CYAN}==================== SYSTEM INFORMATION ====================${NC}\n"

VIRT=$(systemd-detect-virt)
SHELL_NAME=$SHELL
CURRENT_USER=$(whoami)
LOGGED_USERS=$(who | wc -l)
PACKAGE_COUNT=$(dpkg -l 2>/dev/null | wc -l)

printf "${GREEN}🧱 Virtualization    : ${WHITE}$VIRT${NC}\n"
printf "${GREEN}👤 Current User      : ${WHITE}$CURRENT_USER${NC}\n"
printf "${GREEN}🐚 Shell             : ${WHITE}$SHELL_NAME${NC}\n"
printf "${GREEN}👥 Logged Users      : ${WHITE}$LOGGED_USERS${NC}\n"
printf "${GREEN}📦 Installed Pkgs    : ${WHITE}$PACKAGE_COUNT${NC}\n"

echo
printf "${CYAN}==================== TOP PROCESSES ====================${NC}\n"

ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6

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
printf "${MAGENTA}      PANEL CREATED BY SILENTWRAITHH${NC}\n"
printf "${CYAN}============================================================${NC}\n"
echo

read -p "➡️  Press ENTER to exit..."
```

## How To Use

Save it:

```bash
nano silentwraithh.sh
```

Paste the script.

Then:

```bash
chmod +x silentwraithh.sh
./silentwraithh.sh
```
