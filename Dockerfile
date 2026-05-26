# 1. Берём абсолютно чистую систему Ubuntu (никакой скрытой магии)
FROM ubuntu:20.04

# Отключаем лишние вопросы системы при установке программ
ENV DEBIAN_FRONTEND=noninteractive

# 2. Сами устанавливаем чистую Java 8 и качалку файлов (curl)
RUN apt-get update && \
    apt-get install -y openjdk-8-jre-headless curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /minecraft
COPY . .

# 3. Принимаем правила Майнкрафта
RUN echo "eula=true" > eula.txt

# 4. Скачиваем официальный туннель playit
RUN curl -SsL https://playit-cloud.github.io/playit-agent-built/playit-linux-amd64~0.17.1 -o playit && \
    chmod +x playit

EXPOSE 10000

# 5. Запускаем всё разом! 350 мегабайт отдаём Майнкрафту, остальное остаётся системе и туннелю.
CMD ./playit --secret $PLAYIT_SECRET & java -Xmx350M -Xms256M -jar server.jar --nogui --port 10000
