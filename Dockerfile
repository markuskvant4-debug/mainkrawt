FROM eclipse-temurin:8-jre-alpine

WORKDIR /minecraft
COPY . .

# Принимаем eula
RUN echo "eula=true" > eula.txt

EXPOSE 10000

# Запускаем через командный интерпретатор
CMD ["sh", "start.sh"]
