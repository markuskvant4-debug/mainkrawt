# 1. Используем чистый официальный образ Debian с Java 8 (без скрытых скриптов!)
FROM openjdk:8-jre-slim

# 2. Устанавливаем curl для скачивания playit
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

WORKDIR /minecraft
COPY . .

# 3. Принимаем EULA
RUN echo "eula=true" > eula.txt

# 4. Скачиваем официальный клиент playit
RUN curl -SsL https://playit-cloud.github.io/playit-agent-built/playit-linux-amd64~0.17.1 -o playit && chmod +x playit

EXPOSE 10000

# 5. Чистый запуск через встроенный интерпретатор без посредников. 
# Выделяем ровно 350МБ для Java, чтобы всё поместилось в бесплатный тариф Render
CMD ./playit --secret $PLAYIT_SECRET & java -Xmx350M -Xms256M -jar server.jar --nogui --port 10000
