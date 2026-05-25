FROM eclipse-temurin:8-jre-alpine

WORKDIR /minecraft
COPY . .

# Принимаем лицензию
RUN echo "eula=true" > eula.txt

# Отключаем проверку лицензии для пираток (TLauncher)
RUN echo "online-mode=false" > server.properties

RUN chmod +x start.sh
EXPOSE 10000

CMD ["./start.sh"]
