FROM eclipse-temurin:8-jre-alpine

WORKDIR /minecraft
COPY . .

# Заранее скачиваем playit во время сборки, чтобы не тратить память при запуске сервера
RUN apk add --no-cache curl && \
    curl -SsL https://playit-cloud.github.io/playit-agent-built/playit-linux-amd64~0.17.1 -o playit && \
    chmod +x playit

# Принимаем eula
RUN echo "eula=true" > eula.txt

EXPOSE 10000

# Запуск с оптимизацией памяти: выделим чуть меньше памяти ядру, чтобы хватило системе и playit
CMD sh -c "./playit --secret $PLAYIT_SECRET & java -Xmx356M -Xms200M -jar server.jar --nogui --port 10000"
