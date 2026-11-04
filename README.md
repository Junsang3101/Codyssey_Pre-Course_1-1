## 1. 프로젝트 개요

**프로젝트 목표**  
본 프로젝트는 개발 워크스테이션 세팅 미션의 일환으로 Linux CLI(터미널), Docker(컨테이너), Git/GitHub(버전 관리 및 협업 도구)를 함께 사용해 누구나 같은 방식으로 실행하고 디버깅할 수 있는 환경을 구성하는 것을 목표로 합니다.

**프로젝트 구조**  

```text
.
├── app/                              # 방문 횟수 API를 제공하는 Flask 애플리케이션
│   ├── app.py                        # /count API와 Redis 연동
│   ├── Dockerfile                    # Flask 애플리케이션 이미지 빌드 설정
│   └── requirements.txt              # Flask, Redis Python 패키지 목록
├── evidence/                         # 미션 수행 로그(Markdown)와 스크린샷 증빙 자료
├── proxy/
│   └── default.conf                  # Nginx 웹 및 API 프록시 설정
├── src/
│   └── index.html                    # 브라우저에 제공하는 웹 페이지
├── .env                              # 환경 변수 설정
├── compose.yaml                      # web, app, Redis 서비스와 볼륨 정의
├── dockerfile                        # Nginx 웹 서버 이미지 빌드 설정
└── README.md                         # 프로젝트 안내와 실행 및 실습 기록
```

Docker Compose로 웹 서버, Flask 애플리케이션, Redis 데이터베이스를 함께 실행합니다.  

- **web**: Ubuntu와 Nginx로 구성되어 웹 페이지를 제공하고 API 요청을 Flask 앱으로 전달합니다.
- **app**: Python과 Flask로 방문 횟수 API를 처리합니다.
- **redis**: 방문 횟수를 저장합니다.

브라우저가 `http://localhost:8080`에 접속하면 Nginx가 `index.html`을 전달합니다. 페이지 안의 JavaScript는 `/api/count`를 요청하고,  
Nginx는 이 요청을 Flask의 `/count` 경로로 전달합니다. Flask는 Redis의 `visits` 값을 1 증가시킨 뒤 결과를 브라우저에 돌려줍니다.

요청 흐름은 다음과 같습니다.

브라우저 → Nginx(web) → Flask(app) → Redis(redis) 

**프로젝트 실행 방법**  
해당 프로젝트는 8080포트를 사용합니다. 사용중이라면, powershell 기준 `netstat -ano | findstr :8080` 를 사용하여 해당 프로세스를 확인하고,  
`taskkill /f  /pid 1234`를 사용하여 종료해 주세요. 혹은 `.env`에서  `HOST_PORT=8080` 의 포트를 임의로 변경해주세요.
프로젝트가 있는 프롬프트(터미널) `~\Codyssey_Pre-Course_1-1>`에서 `docker compose up -d --build` 한 후 `http://localhost:8080`에 접속합니다.
새로고침 / 재접속 시 방문 횟수가 증가합니다.

## 2. 실행 환경
|항목|확인한 환경|
|-|-|
|OS|windows 11|
|Shell|powershell|
|Docker|Client 29.9.2|
|Git|2.56.0.windows.4|

## 3. 수행 항목 체크리스트

- [x] 3-1. 터미널 조작 로그 기록
  - [터미널 조작 로그 기록](./evidence/터미널%20조작%20로그%20기록.md)
- [x] 3-2. 권한 변경 실습
  - [사용자 권한 변경 로그](./evidence/사용자%20권한%20변경%20로그.md)
- [x] 3-3. Docker 기본 점검
  - [Docker 기본 점검 로그](./evidence/Docker%20기본%20점검%20로그.md)
- [x] 3-4. Docker 기본 운영 명령
  - [Docker 기본 운영 명령 수행 로그](./evidence/Docker%20기본%20운영%20명령%20수행%20로그.md)
- [x] 3-5. 컨테이너 실행
  - [컨테이너 실행 및 접속 확인 로그](./evidence/컨테이너%20실행%20및%20접속%20확인%20로그.md)
- [x] 3-6. Dockerfile 기반 커스텀 이미지 제작
  - [커스텀 이미지 생성 로그](./evidence/커스텀%20이미지%20생성%20로그.md)
- [x] 3-7. 포트 매핑 및 접속
  - [CMD 호스트 접속 로그](./evidence/CMD%20호스트%20접속%20로그.md)
  - [compose.yaml](./compose.yaml)
- [x] 3-8. Docker 볼륨 영속성 검증
  - [Docker 볼륨 영속성 검증 로그](./evidence/Docker%20volume%20영속성%20검증%20로그.md)
- [x] 3-9. Git 설정 및 GitHub 연동
  - [Git 설정 및 커밋 로그](./evidence/Git%20설정%20및%20커밋%20로그.md)

**보너스 과제 (선택)**
- [x] 3-10. Docker Compose 기초
  - [Docker Compose 생성 로그](./evidence/Docker%20Compose%20생성%20로그.md)
- [x] 3-11. Docker Compose 멀티 컨테이너
  - [멀티 컨테이너 활용 로그](./evidence/멀티%20컨테이너%20활용%20로그.md)
- [x] 3-12. Compose 운영 명령어 습득
  - [Compose 명령어 수행 로그](./evidence/Compose%20명령어%20수행%20로그.md)
- [x] 3-13. 환경 변수 활용
  - [환경 변수 활용 로그](./evidence/환경%20변수%20활용%20로그.md)
  - [compose.yaml](./compose.yaml)
- [x] 3-14. GitHub SSH 키 설정
  - [GitHub SSH 키 설정 로그 및 화면](./evidence/SSH%20키%20생성%20로그.md)
- [x] 3-15. 트러블 슈팅
  - [트러블슈팅 로그](./evidence/트러블슈팅%20로그.md)