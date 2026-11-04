# Docker Compose 생성 로그

서비스 실행 설정을 `compose.yaml`에 정의하고 `docker compose up`으로 서비스를 실행했습니다. Docker Compose를 사용하면 여러 서비스를 하나의 설정 파일에서 함께 관리할 수 있습니다.

```powershell
PS C:\users\user\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker compose up -d --build
[+] Building 1.7s (11/11) FINISHED
 => [internal] load local bake definitions                                                                    0.0s
 => => reading from stdin 601B                                                                                0.0s
 => [internal] load build definition from dockerfile                                                          0.0s
 => => transferring dockerfile: 366B                                                                          0.0s
 => [internal] load metadata for docker.io/library/ubuntu:24.04                                               1.3s
 => [auth] library/ubuntu:pull token for registry-1.docker.io                                                   0.0s
 => [internal] load .dockerignore                                                                             0.0s
 => => transferring context: 2B                                                                               0.0s
 => [1/3] FROM docker.io/library/ubuntu:24.04@sha256:fe81560990fae86dc4743202b2cb4d3df                          0.0s
 => => resolve docker.io/library/ubuntu:24.04@sha256:fe81560990fae86dc4743202b2cb4d3df                         0.0s
 => [internal] load build context                                                                             0.0s
 => => transferring context: 59B                                                                              0.0s
 => CACHED [2/3] RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt                        0.0s
 => CACHED [3/3] COPY --chown=www-data:www-data src/ /var/www/html/                                             0.0s
 => exporting to image                                                                                        0.1s
 => => exporting layers                                                                                       0.0s
 => => exporting manifest sha256:54f0b5304c9a109727f894fb5fd5fc44de532cdea13e736c68ea1                         0.0s
 => => exporting config sha256:78a0e1008a10ed27981fb32c5def1554975d85db7fff0a0b6f80806                         0.0s
 => => exporting attestation manifest sha256:2feb9cdd24dc689e6598e576c2b6e1798bc34ab53                         0.0s
 => => exporting manifest list sha256:688d4f80a626650a12b2038747bc6ed627a9c6b4e93f0462                         0.0s
 => => naming to docker.io/library/codyssey_pre-course_1-1-web:latest                                           0.0s
 => => unpacking to docker.io/library/codyssey_pre-course_1-1-web:latest                                      0.0s
 => resolving provenance for metadata file                                                                    0.0s
[+] up 2/2
✔ Image codyssey_pre-course_1-1-web Built                                                                     1.9s
✔ Container ubuntu-web-test   Started                                                                         0.6s
PS C:\users\user\Documents\Junsang3101\Codyssey_Pre-Course_1-1>
```