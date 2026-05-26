# 1. Фундамент
FROM ubuntu:20.04

# Отключаем интерактивные запросы
ENV DEBIAN_FRONTEND=noninteractive

# 2. Установка всего необходимого
RUN apt-get update && \
    apt-get install -y openjdk-8-jre-headless curl && \
    rm -rf /var/lib/apt/lists/*

# 3. Подготовка папок
WORKDIR /minecraft
COPY . .

# 4. Автоматическое принятие EULA
RUN echo "eula=true" > eula.txt

# 5. Команда запуска
CMD java -Xmx350M -Xms256M -jar server.jar --nogui
