#!/bin/bash

# Запуск playit-агента в фоновом режиме
if [ -z "$PLAYIT_SECRET" ]; then
    echo "ВНИМАНИЕ: PLAYIT_SECRET не задан в настройках Environment!"
else
    echo "Запуск туннеля Playit.gg..."
    curl -SsL https://playit-cloud.github.io/playit-agent-built/playit-linux-amd64~0.17.1 -o playit
    chmod +x playit
    ./playit --secret $PLAYIT_SECRET &
fi

# Запуск самого сервера Майнкрафт
echo "Запуск сервера Minecraft 1.12.2..."
exec java -Xmx512M -Xms256M -jar server.jar --nogui --port 10000
