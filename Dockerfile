FROM alpine:latest

# Устанавливаем Java 8, Питон для заглушки и утилиты
RUN apk update && apk add --no-cache openjdk8-jre-headless curl bash python3

WORKDIR /minecraft
COPY . .

# Принимаем лицензию
RUN echo "eula=true" > eula.txt

# Отключаем проверку лицензии для пираток (TLauncher)
RUN echo "online-mode=false" > server.properties

RUN chmod +x start.sh
EXPOSE 10000

CMD ["./start.sh"]
