#!/bin/bash

# Скачиваем официальный агент playit прямо при старте
curl -SsL https://playit-cloud.github.io/playit-agent-built/playit-linux-amd64~0.17.1 -o playit
chmod +x playit

# Запускаем туннель playit в фоновом режиме, используя твою секретную переменную
./playit --secret $PLAYIT_SECRET &

# Запускаем сам сервер Майнкрафт на порту 10000 с оптимизацией памяти под бесплатный тариф
exec java -Xmx400M -Xms256M -jar server.jar --nogui --port 10000
