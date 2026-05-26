#!/bin/sh

# Скачиваем и запускаем playit в фоне
curl -SsL https://playit-cloud.github.io/playit-agent-built/playit-linux-amd64~0.17.1 -o playit
chmod +x playit
./playit --secret $PLAYIT_SECRET &

# Запускаем Майнкрафт (он будет главным процессом)
exec java -Xmx512M -Xms256M -jar server.jar --nogui --port 10000
