FROM eclipse-temurin:8-jre-alpine

WORKDIR /minecraft
COPY . .

# Принимаем eula
RUN echo "eula=true" > eula.txt

EXPOSE 10000

# Запускаем ТОЛЬКО чистый Майнкрафт, без лишних программ
CMD ["java", "-Xmx400M", "-Xms256M", "-jar", "server.jar", "--nogui", "--port", "10000"]
