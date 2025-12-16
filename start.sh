#!/usr/bin/env bash

# Make sure pwd is the directory of the script
cd "$(dirname "$0")"

if ! command -v npm &> /dev/null
then
    read -p "npm is not installed. Do you want to install nodejs and npm? (y/n)" choice
    case "$choice" in
      y|Y )
        echo "Installing nvm..."
        export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
        source ~/.bashrc
        nvm install --lts
        nvm use --lts;;
      n|N )
        echo "Nodejs and npm will not be installed."
        exit;;
      * )
        echo "Invalid option. Nodejs and npm will not be installed."
        exit;;
    esac
fi

echo "Installing Node Modules..."
export NODE_ENV=production
npm i --no-save --no-audit --no-fund --loglevel=error --no-progress --omit=dev

echo "Entering SillyTavern..."
# 修改从这里开始
CMD="HOST=0.0.0.0 PORT=8000 node \"server.js\" $@"

echo "Starting SillyTavern in background mode..."
nohup sh -c "$CMD" > server.log 2>&1 &
PID=$!
echo $PID > server.pid

echo "? Started successfully!"
echo "?? Process PID: $PID (saved to server.pid)"
echo "?? Log file: ./server.log"
echo "?? View logs: tail -f server.log"
echo "?? Stop service: kill $PID"