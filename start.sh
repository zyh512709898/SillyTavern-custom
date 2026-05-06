#!/usr/bin/env bash

# Make sure pwd is the directory of the script
cd "$(dirname "$0")"

if ! command -v npm &> /dev/null
then
    echo -e "\033[0;31mnpm could not be found in PATH. If the startup fails, please install Node.js from https://nodejs.org/\033[0m"
fi

echo "Installing Node Modules..."
export NODE_ENV=production
npm install --no-save --no-audit --no-fund --loglevel=error --no-progress --omit=dev --ignore-scripts

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