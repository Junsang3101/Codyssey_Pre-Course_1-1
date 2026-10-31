FROM nginx:alpine

LABEL maintainer="bae junsang 3101junsang@gmall.com"
LABEL description="코디세이 입학 연수 1-1 hello world 웹 서버"

# '/usr/share/html/' nginx 웹 기본 경로
# --chown 옵션으로 파일을 복사할 때 소유권을 nginx:nginx로 지정 
# 다만 -v (도커 볼륨)을 사용하면 --chown 옵션이 밀려서 소유권이 복사되는 원본 파일의 권한으로 설정 됨
COPY --chown=nginx:nginx index.html /usr/share/nginx/html/index.html

EXPOSE 80