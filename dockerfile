FROM nginx:alpine

LABEL maintainer="bae junsang 3101junsang@gmall.com"
LABEL description="코디세이 입학 연수 1-1 hello world 웹 서버"

# '/usr/share/html/' nginx 웹 기본 경로
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80