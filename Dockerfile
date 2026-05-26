# Используем полноценный стабильный образ вместо Alpine, чтобы избежать ошибки 128
FROM eclipse-temurin:8-jre

WORKDIR /minecraft
COPY . .

# Принимаем лицензию EULA
RUN echo "eula=true" > eula.txt

# Открываем порт для Render
EXPOSE 10000

# Даем права на выполнение скрипта запуска
RUN chmod +x start.sh

# Запускаем управляющий скрипт
CMD ["./start.sh"]
