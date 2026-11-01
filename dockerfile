FROM ubuntu:24.04

LABEL maintainer="Baejunsang 3101junsang@gmail.com"
LABEL description="코디세이 입학 연수 1-1 웹 서버"

# ubuntu 명령으로 nginx 다운 시킴
RUN apt-get update && apt-get install -y --no-install-recommends nginx && rm -rf /var/lib/apt/lists/*
# docker compose logs 로 로그 볼려고 표준 출력 stdout과 stderr로 로그 파일을 링크해줌
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
 && ln -sf /dev/stderr /var/log/nginx/error.log
# 볼륨 설정 안 해도 작동하도록 src/를 이미지에 구워둠 *바인드 마운트 아님 수정시 재빌드 해야함
COPY --chown=www-data:www-data src/ /var/www/html/
EXPOSE 80
# 'nginx -g daemon off;' nginx global 설정 daemon off(포그라운드 실행)해줌
CMD ["nginx", "-g", "daemon off;"]