# 1. Фундамент
FROM ubuntu:20.04

# Отключаем интерактивные запросы
ENV DEBIAN_FRONTEND=noninteractive

# 2. Установка Java и инструментов для скачивания
RUN apt-get update && \
    apt-get install -y openjdk-8-jre-headless curl && \
    rm -rf /var/lib/apt/lists/*

# 3. Подготовка папок
WORKDIR /minecraft

# 4. СКАЧИВАНИЕ ЯДРА СЕРВЕРА ПРЯМО ПРИ СБОРКЕ
# Render скачает файл сам, тебе не нужно грузить его в репозиторий
RUN curl -o server.jar https://api.papermc.io/v2/projects/paper/versions/1.12.2/builds/1620/downloads/paper-1.12.2-1620.jar

# 5. Автоматическое принятие EULA
RUN echo "eula=true" > eula.txt

# 6. Команда запуска
CMD java -Xmx350M -Xms256M -jar server.jar --nogui
