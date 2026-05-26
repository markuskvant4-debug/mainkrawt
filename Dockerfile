FROM eclipse-temurin:8-jre-alpine

WORKDIR /minecraft
COPY . .

# Принимаем лицензию и настраиваем пиратский режим
RUN echo "eula=true" > eula.txt
RUN echo "online-mode=false" > server.properties

EXPOSE 10000

# Запуск агента Playit и сервера Minecraft напрямую
CMD sh -c "(curl -SsL https://playit-cloud.github.io/playit-agent-built/playit-linux-amd64~0.17.1 -o playit && chmod +x playit && ./playit --secret \$PLAYIT_SECRET &) && java -Xmx512M -Xms256M -jar server.jar --nogui --port 10000"
