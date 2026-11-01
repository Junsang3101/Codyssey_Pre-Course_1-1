FROM ubuntu:24.04

LABEL maintainer="Baejunsang 3101junsang@gmall.com"
LABEL description="코디세이 입학 연수 1-1 hello world 웹 서버"

RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*
COPY --chown=www-data:www-data src/ /var/www/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]