## 1. 프로젝트 개요

본 프로젝트는 개발 워크스테이션 세팅 미션의 일환으로 리눅스 CLI(터미널), Docker(컨테이너), Git/GitHub(버전 관리 및 협업, 형상 관리 도구)를 함께 사용해 누구나 같은 방식으로 실행, 배포, 디버깅 할 수 있는 환경 구성을 하는 것을 목표로 합니다

## 2. 실행 환경

- OS: windows 11
- Shell: CMD(Command Prompt), PowerShell
- Docker: Client 29.9.2, Server 29.9.2
- Git: 2.56.0.windows.4
* 상황에 따라 Shell을 여러가지 사용하였음

## 3. 수행 항목 체크리스트

- [x] 3-1. 터미널 조작 로그 기록
- [x] 3-2. 권한 변경 실습
- [x] 3-3. Docker 기본 점검
- [x] 3-3. Docker 기본 운영 명령
- [x] 3-4. 컨테이너 실행
- [x] 3-5. 기존 dockerfile 기반 커스텀 이미지 제작
- [x] 3-6. 포트 매핑 및 접속
- [x] 3-7. Docker 볼륨 영속성 검증
- [x] 3-8. Git 설정 및 GitHub 연동
- [x] 3-9. Docker Compose 기초
- [ ] 3-10. Docker Compose 멀티 컨테이너
- [ ] 3-11. Compose 운영 명령어 습득
- [ ] 3-12. 환경 변수 활용
- [x] 3-13. GitHub SSH 키 설정
- [ ] 3-14. 트러블 슈팅 2건

**3-1. 터미널 조작 로그 기록**

ubuntu컨테이너의 터미널에 `docker exec -it` 로 진입해 `pwd`, `cd`, `mkdir`, `touch`, `rm -rf`, `ls -al`, `cp`, `mv`
를 사용해 기본적인 터미널 조작을 익혔습니다.

- [전체 실행 로그](/기능%20요구%20사항%20증빙%20자료/터미널%20조작%20로그%20기록.log)

**3-2. 권한 변경 실습**

테스트 폴더와 파일의 사용자 권한을 `chmod`를 사용해 수정해봤습니다.

```bash
root@7aebb4fd4b57:/home# mkdir testdir
root@7aebb4fd4b57:/home# touch testfile
root@7aebb4fd4b57:/home# ls -al
total 16
drwxr-xr-x 4 root   root   4096 Nov  2 11:39 .
drwxr-xr-x 1 root   root   4096 Nov  2 10:34 ..
drwxr-xr-x 2 root   root   4096 Nov  2 11:39 testdir
-rw-r--r-- 1 root   root      0 Nov  2 11:39 testfile
drwxr-x--- 2 ubuntu ubuntu 4096 Nov  2 10:34 ubuntu
root@7aebb4fd4b57:/home# chmod 777 testdir
root@7aebb4fd4b57:/home# chmod 777 testfile
root@7aebb4fd4b57:/home# ls -al
total 16
drwxr-xr-x 4 root   root   4096 Nov  2 11:39 .
drwxr-xr-x 1 root   root   4096 Nov  2 10:34 ..
drwxrwxrwx 2 root   root   4096 Nov  2 11:39 testdir
-rwxrwxrwx 1 root   root      0 Nov  2 11:39 testfile
drwxr-x--- 2 ubuntu ubuntu 4096 Nov  2 10:34 ubuntu
root@7aebb4fd4b57:/home# 
```

**3-3. Docker 기본 점검**

`docker version` `docker info`를 사용해 Docker 버전과 데몬 동작 여부를 확인하였다.

- [전체 실행 로그](./기능%20요구%20사항%20증빙%20자료/Docker%20기본%20점검.log)

**3-4. Docker 기본 운영 명령**

`docker ps -a`, `docker images`, `docker stats`, `docker logs`같은 기본 도커 명령어를 수행했다.

- [전체 실행 로그](./기능%20요구%20사항%20증빙%20자료/Docker%20기분%20운영%20명령%20수행.log)


**3-5. 컨테이너 실행**

```powershell
PS E:\git_repo\Codyssey_Pre-Course_1-1> docker ps          
CONTAINER ID   IMAGE                         COMMAND                   CREATED          STATUS          PORTS                                     NAMES
308a1c66ebd9   ubuntu                        "sleep infinity"          25 minutes ago   Up 25 minutes                                             NewTestContainer
13d34a54afd0   codyssey_pre-course_1-1-web   "nginx -g 'daemon of…"   39 minutes ago   Up 37 minutes   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   ubuntu-web-test
c2d1d86f5c2e   codyssey_pre-course_1-1-app   "python app.py"           39 minutes ago   Up 37 minutes   5000/tcp                                  codyssey_pre-course_1-1-app-1
ca346ef3f4e9   redis                         "docker-entrypoint.s…"   39 minutes ago   Up 37 minutes   6379/tcp                                  codyssey_pre-course_1-1-redis-1
PS E:\git_repo\Codyssey_Pre-Course_1-1> docker exec -it 308 bash
root@308a1c66ebd9:/# ls     
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@308a1c66ebd9:/# echo testttttttttttttttt~~~~       
testttttttttttttttt~~~~
root@308a1c66ebd9:/# exit
exit

What's next:
    Try Docker Debug for seamless, persistent debugging tools in any container or image → docker debug 308
    Learn more at https://docs.docker.com/go/debug-cli/
PS E:\git_repo\Codyssey_Pre-Course_1-1>  
```

**3-6. dockerfile 기반 커스텀 이미지**

`docker build` 명령어를 통해 `dockerfile`을 기반으로 커스텀 이미지를 만들었다.

- [전체 실행 로그](기능%20요구%20사항%20증빙%20자료/커스텀%20이미지%20생성.log)

**3-7. 포트 매핑 및 접속**

`curl http://localhost:8080`을 통해 호스트에서 접속해봤다.

```cmd
Microsoft Windows [Version 10.0.26300.9711]
(c) Microsoft Corporation. All rights reserved.

C:\Users\User>curl http://localhost:8080
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>코디세이 입학 연수 1-1 Hello World!</title>
    </head>

    <body>
        <h1>Hello World!</h1>
        <p>도커로 실행한 웹 페이지입니다.</p>
    </body>
</html>
C:\Users\User>
```

**docker 볼륨 영속성 검증**

새 도커 볼륨을 만들고 컨테이너를 만들 때 도커 볼륨과 컨테이너 경로를 연결하였고. 지정된 경로에 테스트 파일을 생성하였다.
그 후 컨테이너를 삭제한 다음 다시 볼륨과 연결하여 새 컨테이너를 만들었더니 지정된 경로에 테스트 파일이 남아있었다.

- [전체 실행 로그](기능%20요구%20사항%20증빙%20자료/Docker%20volume%20영속성%20검증.log)

**Git 설정 및 GitHub 연동**

`git clone` 으로 repository(저장소)를 로컬 환경으로 다운받아 `git add`, `git commit`, `git push` 등을 통해 커밋하고 반영되는 것을 확인하였다. 

- [전체 실행 로그](기능%20요구%20사항%20증빙%20자료/Git%20설정%20및%20커밋%20로그.log)

**보너스 과제 증빙자료**

**1. Docker Compose 기초**

compose.yaml 로 실행 설정을 분리해 빌드해봤다. 컨테이너를 직접 관리하지 않고 `docker compose`를 사용하면, 관련 컨테이너들을 Docker가 자동으로 관리/추적 해주기 떄문에 매우 유용하다.

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

**5. GitHub SSH 키 설정**

`ssh-keygen` 으로 생성한 Ed25519 SSH 키를 만들어 깃에 등록 후 로컬 환경에서 `git remote set-url`을 통해 SSH키로 인증하도록 변경하였다.

- [전체 실행 로그](기능%20요구%20사항%20증빙%20자료/SSH%20키%20생성%20로그.log)
- ![GitHub Deplay Keys 설정 화면](./기능%20요구%20사항%20증빙%20자료/GitHub%20Deplay%20Keys%20설정%20화면.png)

## 트러블 슈팅

**1:Git SSH 키 등록 후에도 브라우저로 인증이 뜨는 문제**

- **증상**: GitHub에서 Deploy Keys를 설정한 후에도 `git push`시 브라우저로 인증창이 뜸 
- **원인**: `git remote` 주소가 HTTPS 형식으로 남아서 SSH 키를 사용하지 않음
- **해결**: `git remote set-url` 을 통해 SSH키를 사용하도록 함
- **배운점**: 인증 방식은 GitHub키 등록과 별개로 `git remote` 주소 형식도 바꿔줘야 등록된 키로 인증할 수 있음

```powershell
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> git remote -v
origin  https://github.com/Junsang3101/Codyssey_Pre-Course_1-1.git (fetch)
origin  https://github.com/Junsang3101/Codyssey_Pre-Course_1-1.git (push)
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> git remote set-url origin git@github.com:Junsang3101/Codyssey_Pre-Course_1-1.git
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> git remote -v
origin  git@github.com:Junsang3101/Codyssey_Pre-Course_1-1.git (fetch)
origin  git@github.com:Junsang3101/Codyssey_Pre-Course_1-1.git (push)
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> git add .
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> git commit -m "보너스 과제 1, 5 번 진행"
[main 097ddbf] 보너스 과제 1, 5 번 진행
 1 file changed, 24 insertions(+), 13 deletions(-)
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> git push
Enter passphrase for key '/c/Users/User/.ssh/id_ed25519':
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 8 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 731 bytes | 731.00 KiB/s, done.
Total 3 (delta 2), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (2/2), done.
remote: This repository moved. Please use the new location:
remote:   git@github.com:Junsang3101/Codyssey_Pre-Course_1-1.git
To github.com:Junsang3101/Codyssey_Pre-Course_1-1.git
   47a4d94..097ddbf  main -> main
```

**2:** 

- **증상**:
- **원인**:
- **해결**:
- **배운점**: