## 1. 프로젝트 개요

**프로젝트 목표**
본 프로젝트는 개발 워크스테이션 세팅 미션의 일환으로 Linux CLI(터미널), Docker(컨테이너), Git/GitHub(버전 관리 및 협업 도구)를 함께 사용해 누구나 같은 방식으로 실행하고 디버깅할 수 있는 환경을 구성하는 것을 목표로 합니다.

**프로젝트 구조**
Docker Compose로 웹 서버, Flask 애플리케이션, Redis 데이터베이스를 함께 실행합니다.  

- **web**: Ubuntu와 Nginx로 구성되어 웹 페이지를 제공하고 API 요청을 Flask 앱으로 전달합니다.
- **app**: Python과 Flask로 방문 횟수 API를 처리합니다.
- **redis**: 방문 횟수를 저장합니다.

브라우저가 `http://localhost:8080`에 접속하면 Nginx가 `index.html`을 전달합니다. 페이지 안의 JavaScript는 `/api/count`를 요청하고,  
Nginx는 이 요청을 Flask의 `/count` 경로로 전달합니다. Flask는 Redis의 `visits` 값을 1 증가시킨 뒤 결과를 브라우저에 돌려줍니다.

요청 흐름은 다음과 같습니다.

브라우저 → Nginx(web) → Flask(app) → Redis(redis) 


**프로젝트 실행 방법**
프로젝트가 있는 프롬프트(터미널) `~\Codyssey_Pre-Course_1-1>`에서 `docker compose up -d --build` 한 후 `http://localhost:8080`에 접속한다.

## 2. 실행 환경

- OS: Windows 11
- Shell: PowerShell
- Docker: Client 29.9.2, Server 29.9.2
- Git: 2.56.0.windows.4

## 3. 수행 항목 체크리스트

- [x] 3-1. 터미널 조작 로그 기록
- [x] 3-2. 권한 변경 실습
- [x] 3-3. Docker 기본 점검
- [x] 3-4. Docker 기본 운영 명령
- [x] 3-5. 컨테이너 실행
- [x] 3-6. Dockerfile 기반 커스텀 이미지 제작
- [x] 3-7. 포트 매핑 및 접속
- [x] 3-8. Docker 볼륨 영속성 검증
- [x] 3-9. Git 설정 및 GitHub 연동
- [x] 3-10. Docker Compose 기초
- [x] 3-11. Docker Compose 멀티 컨테이너
- [x] 3-12. Compose 운영 명령어 습득
- [x] 3-13. 환경 변수 활용
- [x] 3-14. GitHub SSH 키 설정
- [x] 3-15. 트러블 슈팅

### 3-1. 터미널 조작 로그 기록

Ubuntu 컨테이너에 `docker exec -it`로 접속해 `pwd`, `cd`, `mkdir`, `touch`, `rm -rf`, `ls -al`, `cp`, `mv` 명령으로 기본적인 터미널 조작을 익혔습니다.

- [전체 실행 로그](./기능%20요구%20사항%20증빙%20자료/터미널%20조작%20로그%20기록.log)

### 3-2. 권한 변경 실습

테스트 폴더와 파일의 권한을 `chmod` 명령으로 변경했습니다.

- [사용자 권한 변경 로그](./기능%20요구%20사항%20증빙%20자료/사용자%20권환%20변경%20로그.log)

### 3-3. Docker 기본 점검

`docker version`과 `docker info`를 사용해 Docker 버전과 데몬 정보를 확인했습니다.

- [Docker 기본 점검 로그](./기능%20요구%20사항%20증빙%20자료/Docker%20기본%20점검%20로그.log)

### 3-4. Docker 기본 운영 명령

`docker ps -a`, `docker images`, `docker stats`, `docker logs` 명령으로 이미지·컨테이너 목록, 로그, 자원 사용량을 확인했습니다.

- [Docker 기본 운영 명령 수행 로그](./기능%20요구%20사항%20증빙%20자료/Docker%20기본%20운영%20명령%20수행%20로그.log)


### 3-5. 컨테이너 실행

실행 중인 Ubuntu 컨테이너에 `docker exec -it`로 접속해 `ls`와 `echo` 명령을 실행했습니다.

- [컨테이너 실행 로그](./기능%20요구%20사항%20증빙%20자료/컨테이너%20실행%20로그.log)

### 3-6. Dockerfile 기반 커스텀 이미지 제작

`docker build` 명령으로 `Dockerfile`을 기반으로 커스텀 이미지를 만들었습니다.

- [커스텀 이미지 생성 로그](./기능%20요구%20사항%20증빙%20자료/커스텀%20이미지%20생성%20로그.log)

### 3-7. 포트 매핑 및 접속

호스트의 8080 포트를 컨테이너의 80 포트에 매핑하고, CMD에서 `curl http://localhost:8080`을 실행해 호스트에서 웹 페이지에 접속되는 것을 확인했습니다.

- [compose.yaml](./compose.yaml)

- [CMD 호스트 접속 로그](./기능%20요구%20사항%20증빙%20자료/CMD%20호스트%20접속%20로그.log)

### 3-8. Docker 볼륨 영속성 검증

새 Docker 볼륨을 만들고 컨테이너 경로에 연결한 뒤 테스트 파일을 생성했습니다. 컨테이너를 삭제하고 같은 볼륨을 새 컨테이너에 연결한 후에도 파일이 남아 있는 것을 확인했습니다.

- [Docker 볼륨 영속성 검증 로그](./기능%20요구%20사항%20증빙%20자료/Docker%20volume%20영속성%20검증%20로그.log)

### 3-9. Git 설정 및 GitHub 연동

`git clone`으로 저장소를 로컬 환경에 복제하고, `git add`, `git commit`, `git push` 명령으로 변경 사항이 원격 저장소에 반영되는 것을 확인했습니다.

- [Git 설정 및 커밋 로그](./기능%20요구%20사항%20증빙%20자료/Git%20설정%20및%20커밋%20로그.log)

### 3-10. Docker Compose 기초

`compose.yaml`에 실행 설정을 분리하고 `docker compose up`으로 정의한 서비스를 실행했습니다. Compose를 사용하면 여러 서비스를 한 설정 파일에서 함께 관리할 수 있습니다.

- [Docker Compose 생성 로그](./기능%20요구%20사항%20증빙%20자료/Docker%20Compose%20생성%20로그.log)

### 3-11. Docker Compose 멀티 컨테이너 활용

app(python + flask), web(ubuntu + nginx), redis(메모리 기반 db) 컨테이너를 관리하는 compose를 만들었고
클라이언트가 사이트에 접속(index.html)하면 내부 자바스크립트로 /api/count 요청이 80포트로 들어오고, /api/ 요청은 app:5000 포트로 보내서
/count를 처리해 visits가 증가한다.

- [멀티 컨테이너 활용 로그](./기능%20요구%20사항%20증빙%20자료/멀티%20컨에티너%20활용%20로그.log)

### 3-12. Compose 운영 명령어 습득

`docker compose`의 `up`, `down`, `ps`, `logs` 명령어를 습득/수행 하였다.

-[Compose 명령어 수행 log](./기능%20요구%20사항%20증빙%20자료Docker%20기본%20운영%20명령%20수행%20로그.log)

### 3-13. Compose에서 환경 변수 활용

`.env` 파일에 환경 컨테이너들의 포트 설정을 저장해 `compose.yaml` 수정 없이 `.env` 만으로 설정을 바꿀 수 있고 추후 중요 데이터를 은닉할 수 있다.  
  

`env`에서 발췌

```.env
WEB_PORT=80
APP_PORT=5000
# redis 기본 포트: 6379 고정
FLASK_DEBUG=1   # FLASK_DEBUG=0: 디버그 모드 끄기 1: 켜기
```

- [compose.yaml](./compose.yaml) 

### 3-14. GitHub SSH 키 설정

`ssh-keygen`으로 Ed25519 SSH 키를 생성해 GitHub에 등록하고, 로컬 저장소의 원격 주소를 `git remote set-url`로 SSH 형식으로 변경했습니다.

- [SSH 키 생성 로그](./기능%20요구%20사항%20증빙%20자료/SSH%20키%20생성%20로그.log)
- ![GitHub Deploy Keys 설정 화면](./기능%20요구%20사항%20증빙%20자료/GitHub%20Deplay%20Keys%20설정%20화면.png)

### 3-15. 트러블슈팅

#### 1. GitHub SSH 키 등록 후에도 HTTPS 인증이 사용되는 문제

- **증상**: SSH 키를 등록했는데도 `git push`에서 HTTPS 인증이 사용됐습니다.
- **원인**: `git remote` 주소가 HTTPS 형식으로 설정되어 있었습니다.
- **해결**: `git remote set-url`로 원격 주소를 SSH 형식으로 변경했습니다.
- **배운 점**: GitHub에 SSH 키를 등록하는 것과 별개로, 저장소의 원격 주소도 SSH 형식이어야 해당 키로 인증됩니다.

- [Git 인증 방법 변경 로그](./기능%20요구%20사항%20증빙%20자료/Git%20인증%20방법%20변경%20로그.log)

#### 2. (작성 예정)

- **증상**:
- **원인**:
- **해결**:
- **배운점**: