# Используем OpenJDK 17 slim
FROM openjdk:17-jdk-slim

WORKDIR /server

# Устанавливаем wget для скачивания Paper
RUN apt-get update && apt-get install -y wget

# Скачиваем Paper 1.12.2 build 1620
RUN wget -O paper-1.12.2-1620.jar https://api.papermc.io/v2/projects/paper/versions/1.12.2/builds/1620/downloads/paper-1.12.2-1620.jar

# Создаем папку для плагинов (твой локальный jar уже там)
RUN mkdir -p plugins

# Принятие EULA
RUN echo "eula=true" > eula.txt

# Открываем порт 8080
EXPOSE 8080

# Запуск сервера
CMD ["java", "-Xmx256M", "-Xms128M", "-jar", "paper-1.12.2-1620.jar", "-nogui"]
