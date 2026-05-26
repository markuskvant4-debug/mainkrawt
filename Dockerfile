# Используем стабильную версию Linux с Java 8
FROM eclipse-temurin:8-jre

WORKDIR /minecraft
COPY . .

# Принимаем правила игры
RUN echo "eula=true" > eula.txt

# Скачиваем Playit заранее, чтобы не тратить память и время при запуске сервера
RUN curl -SsL https://playit-cloud.github.io/playit-agent-built/playit-linux-amd64~0.17.1 -o playit && \
    chmod +x playit

EXPOSE 10000

# Железобетонная команда запуска без сторонних файлов
CMD ["bash", "-c", "./playit --secret $PLAYIT_SECRET & exec java -Xmx400M -Xms256M -jar server.jar --nogui --port 10000"]
