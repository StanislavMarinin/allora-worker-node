#!/bin/bash
execute_with_prompt() {
    echo -e "${BOLD}Executing: $1${RESET}"
    if eval "$1"; then
        echo "Command executed successfully."
    else
        echo -e "${BOLD}${DARK_YELLOW}Error executing command: $1${RESET}"
        exit 1
    fi
}

execute_with_prompt "cd ~/allora-chain/basic-coin-prediction-node"

execute_with_prompt "docker compose down -v"
execute_with_prompt "docker container prune"
execute_with_prompt "cd ~/allora-chain/ && rm -rf basic-coin-prediction-node"
execute_with_prompt "cd ~/allora-chain/ && git clone https://github.com/allora-network/basic-coin-prediction-node"
execute_with_prompt "cd ~/allora-chain/basic-coin-prediction-node && wget https://raw.githubusercontent.com/StanislavMarinin/allora-worker-node/main/config.json"
execute_with_prompt "cd ~/allora-chain/basic-coin-prediction-node && chmod +x init.config && ./init.config"
execute_with_prompt "cd ~/allora-chain/basic-coin-prediction-node && wget https://raw.githubusercontent.com/StanislavMarinin/allora-worker-node/main/model.py"
