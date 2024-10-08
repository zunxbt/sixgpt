#!/bin/bash

curl -s https://raw.githubusercontent.com/zunxbt/logo/main/logo.sh | bash
sleep 5

BOLD=$(tput bold)
NORMAL=$(tput sgr0)
PINK='\033[1;35m'

show() {
    case $2 in
        "error")
            echo -e "${PINK}${BOLD}❌ $1${NORMAL}"
            ;;
        "progress")
            echo -e "${PINK}${BOLD}⏳ $1${NORMAL}"
            ;;
        *)
            echo -e "${PINK}${BOLD}✅ $1${NORMAL} "
            ;;
    esac
}

check_docker_installed() {
    if command -v docker >/dev/null 2>&1; then
        show "Docker is already installed."
        return 0
    else
        return 1
    fi
}

install_docker() {
    show "Installing Docker..." "progress"
    source <(wget -O - https://raw.githubusercontent.com/zunxbt/installation/main/docker.sh)
}

prompt_user_input() {
    read -p "Enter your burner wallet's private key: " VANA_PRIVATE_KEY
    read -p "Enter Vana Network (satori or moksha): " VANA_NETWORK
}

clear_ram_cache() {
    show "Clearing RAM cache..." "progress"
    sudo sh -c "sync; echo 3 > /proc/sys/vm/drop_caches"
    show "RAM cache cleared."
}

run_docker_containers() {
    sudo docker volume create ollama && \
    sudo docker run -d --name ollama \
      -p 11439:11434 \
      -v ollama:/root/.ollama \
      --restart unless-stopped \
      ollama/ollama:0.3.12 && \
    sudo docker run -d --name sixgpt3 \
      -p 3210:3000 \
      --link ollama \
      -e VANA_PRIVATE_KEY="$VANA_PRIVATE_KEY" \
      -e VANA_NETWORK="$VANA_NETWORK" \
      --restart always \
      sixgpt/miner:latest
}

if ! check_docker_installed; then
    install_docker
fi

prompt_user_input

clear_ram_cache

show "Running Docker containers..." "progress"
run_docker_containers
echo
show "You can also start pre-mining in TG mini app : https://t.me/VanaDataHeroBot/VanaDataHero?startapp=5085536485"
echo
