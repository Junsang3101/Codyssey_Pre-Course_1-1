## 프로젝트 개요

본 프로젝트는 개발 워크스테이션 세팅 미션의 일환으로 리눅스 CLI(터미널), Docker(컨테이너), Git/GitHub(버전 관리 및 엽업, 형상 관리 도구)를 함께 사용해 누구나 같은 방식으로 실행, 배포, 디버깅 할 수 있는 환경 구성을 하는 것을 목표로 합니다

## 실행 환경

- OS: Window 11
- Shell: CMD(Command Prompt), PowerShell, Bash(컨테이너)
- Docker: Client 29.9.2, Server 29.9.2
- Git: 2.56.0.windows.4
* 상황에 따라 Shell을 여러가지 사용하였음

## 수행 항목 체크리스트

- [x] 1. 트러블 슈팅 2건
- [x] 2. 터미널 조작 로그 기록
- [x] 3. 권한 변경 실습
- [x] 4. Docker 기본 점검
- [x] 5. Docker 기본 운영 명령
- [x] 6. 컨테이너 실행
- [x] 7. 기존 dockerfile 기반 커스텀 이미지 제작
- [x] 8. 포트 매핑 및 접속
- [x] 9. Docker 볼륨 영속성 검증
- [x] 10. Git 설정 및 GitHub 연동

## 보너스 과제 (선택)

- [x] 1. Docker Compose 기초
- [ ] 2. Docker Compose 멀티 컨테이너
- [ ] 3. Compose 운영 명령어 습득
- [ ] 4. 환경 변수 활용
- [x] 5. GitHub SSH 키 설정

## 수행 항목 증빙 자료

### 실행 환경 

Docker 및 Git 버전
![실행환경2: docker 및 Git 버전](./기능%20요구%20사항%20증빙%20자료/1-2.png)

### 터미널 조작 로그 기록

**터미널로 폴더와 파일을 만들고 이동/복사/삭제 등을 해봤습니다.**

```powershell
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker exec -it 15e sh
/usr/share/nginx/html # ls -a
.
..
.git
README.md
dockerfile
dockerfile과 index.html로 이미지 빌드하기(dockerfile 실행).png
index.html
만든 이미지로 컨테이너 만들기(도커 볼륨으로 영속성 충족 및 바인드 마운트 반영되게 함).png
컨테이너 내부 파일 권한 설정 바꾸기 (권한 변경 실습).png
터미널 기본 조작 및 폴더 구성 (깃 설정 + 터미널 기본 조작 및 폴더 구성).png
/usr/share/nginx/html # mkdir testdir
/usr/share/nginx/html # cd testdir
/usr/share/nginx/html/testdir # touch test
/usr/share/nginx/html/testdir # mv test testfile
/usr/share/nginx/html/testdir # cp testfile testfile2
/usr/share/nginx/html/testdir # ls -a
.       ..      testfile        testfile2
/usr/share/nginx/html/testdir # cd ..
/usr/share/nginx/html # rm -rf testdir
/usr/share/nginx/html # ls -a
.
..
.git
README.md
dockerfile
dockerfile과 index.html로 이미지 빌드하기(dockerfile 실행).png
index.html
만든 이미지로 컨테이너 만들기(도커 볼륨으로 영속성 충족 및 바인드 마운트 반영되게 함).png
컨테이너 내부 파일 권한 설정 바꾸기 (권한 변경 실습).png
터미널 기본 조작 및 폴더 구성 (깃 설정 + 터미널 기본 조작 및 폴더 구성).png
```

### 권한 변경 실습

**테스트 폴더와 파일의 사용자 권한을 수정해봤습니다.**

```
/usr/share/nginx/html # mkdir testdir
/usr/share/nginx/html # touch testfile
/usr/share/nginx/html # ls -al
total 8
drwxrwxrwx    1 nginx    nginx         4096 Oct 31 08:51 .
drwxr-xr-x    1 root     root          4096 Oct 21 22:47 ..
drwxrwxrwx    1 nginx    nginx         4096 Oct 31 06:21 .git
-rwxrwxrwx    1 nginx    nginx         1156 Oct 31 08:11 README.md
-rwxrwxrwx    1 nginx    nginx          503 Oct 31 07:52 dockerfile
drwxrwxrwx    1 nginx    nginx         4096 Oct 31 08:36 img
-rwxrwxrwx    1 nginx    nginx          285 Oct 31 07:12 index.html
drwxr-xr-x    1 root     root          4096 Oct 31 08:51 testdir
-rw-r--r--    1 root     root             0 Oct 31 08:51 testfile
/usr/share/nginx/html # chmod 777 testdir
/usr/share/nginx/html # chmod 777 testfile
/usr/share/nginx/html # ls -al
total 8
drwxrwxrwx    1 nginx    nginx         4096 Oct 31 08:51 .
drwxr-xr-x    1 root     root          4096 Oct 21 22:47 ..
drwxrwxrwx    1 nginx    nginx         4096 Oct 31 06:21 .git
-rwxrwxrwx    1 nginx    nginx         1156 Oct 31 08:11 README.md
-rwxrwxrwx    1 nginx    nginx          503 Oct 31 07:52 dockerfile
drwxrwxrwx    1 nginx    nginx         4096 Oct 31 08:36 img
-rwxrwxrwx    1 nginx    nginx          285 Oct 31 07:12 index.html
drwxr-xr-x    1 root     root          4096 Oct 31 08:51 testdir
-rw-r--r--    1 root     root             0 Oct 31 08:51 testfile
/usr/share/nginx/html #
```

### Docker 기본 점검

- [4. Docker 기본 점검](./기능%20요구%20사항%20증빙%20자료/4.%20docker기본점검.log)
```
* 프롬프트 입력이 잘려 재작성 예정
```

### Docker 기본 운영 명령

- [5. Docker 기본 운영 명령](./기능%20요구%20사항%20증빙%20자료/5.%20docker%20기본%20운영%20명령.log)
```powershell
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker image ls
                                                                                                                                                                                                            i Info →   U  In Use
IMAGE                  ID             DISK USAGE   CONTENT SIZE   EXTRA
hello-world:latest     c567b231f656       25.9kB         9.49kB    U   
junsang-web_01:1.1     0c66879e7cd3       93.6MB         26.3MB    U   
my-web-server:latest   306f501c05cd       93.6MB         26.3MB        
nginx:alpine           785835ea65db       94.5MB         27.2MB    U   
nginx:latest           5ab5b0b01097        243MB         66.8MB        
ubuntu:latest          6a06111c3b0a        163MB         45.9MB    U   
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker ps -a
CONTAINER ID   IMAGE                COMMAND                   CREATED             STATUS                     PORTS                                     NAMES
15e4b89bc8f8   junsang-web_01:1.1   "/docker-entrypoint.…"   About an hour ago   Up About an hour           0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   junsang-web_01-container
825a73e7fb36   ubuntu               "cat /data/persisten…"   24 hours ago        Exited (0) 24 hours ago                                              volume-verify-container
4a5a8067ce72   nginx:alpine         "/docker-entrypoint.…"   24 hours ago        Exited (0) 2 hours ago                                               bind-server
71f925e8307a   ubuntu               "bash"                    25 hours ago        Exited (0) 25 hours ago                                              gracious_cartwright
68a408c6c4f9   ubuntu               "bash"                    25 hours ago        Exited (137) 2 hours ago                                             vigorous_goldwasser
477bd90e9f47   hello-world          "/hello"                  25 hours ago        Exited (0) 25 hours ago                                              sleepy_perlman
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker logs 15e
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2026/10/31 07:57:09 [notice] 1#1: using the "epoll" event method
2026/10/31 07:57:09 [notice] 1#1: nginx/1.31.8
2026/10/31 07:57:09 [notice] 1#1: built by gcc 15.2.0 (Alpine 15.2.0) 
2026/10/31 07:57:09 [notice] 1#1: OS: Linux 6.18.54.1-microsoft-standard-WSL2
2026/10/31 07:57:09 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2026/10/31 07:57:09 [notice] 1#1: start worker processes
2026/10/31 07:57:09 [notice] 1#1: start worker process 30
2026/10/31 07:57:09 [notice] 1#1: start worker process 31
2026/10/31 07:57:09 [notice] 1#1: start worker process 32
2026/10/31 07:57:09 [notice] 1#1: start worker process 33
2026/10/31 07:57:09 [notice] 1#1: start worker process 34
2026/10/31 07:57:09 [notice] 1#1: start worker process 35
2026/10/31 07:57:09 [notice] 1#1: start worker process 36
2026/10/31 07:57:09 [notice] 1#1: start worker process 37
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker stats 
CONTAINER ID   NAME                       CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
15e4b89bc8f8   junsang-web_01-container   0.00%     10.23MiB / 7.605GiB   0.13%     1.75kB / 126B   11.3MB / 139kB   9
```

### 컨테이너 실행

- [6. 컨테이너 실행](./기능%20요구%20사항%20증빙%20자료/6.%20컨테이너%20실행%20실습.log)
```powershell
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker run -d -p 8080:80 --name ubuntu-web-test -v ${pwd}:/var/www/html ubuntu sleep infinity
bd2cc02c98aa6741010c3b5a5a5309dfffebf72d1e395ced1c64e4378f4a4691
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker ps
CONTAINER ID   IMAGE     COMMAND            CREATED          STATUS          PORTS                   NAMES
bd2cc02c98aa   ubuntu    "sleep infinity"   39 seconds ago   Up 38 seconds   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   ubuntu-web-test
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker exec -it bd2
docker: 'docker exec' requires at least 2 arguments

Usage:  docker exec [OPTIONS] CONTAINER COMMAND [ARG...]

See 'docker exec --help' for more information

What's next:
    Try Docker Debug for seamless, persistent debugging tools in any container or image → docker debug bd2
    Learn more at https://docs.docker.com/go/debug-cli/
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker exec -it bd2 bash
root@bd2cc02c98aa:/# apt-get update && apt-get install -y nginx
Get:1 http://security.ubuntu.com/ubuntu resolute-security InRelease [137 kB]
Get:2 http://archive.ubuntu.com/ubuntu resolute InRelease [136 kB]                     
Get:3 http://security.ubuntu.com/ubuntu resolute-security/universe amd64 Packages [258 kB]
Get:4 http://security.ubuntu.com/ubuntu resolute-security/restricted amd64 Packages [609 kB]
Get:5 http://archive.ubuntu.com/ubuntu resolute-updates InRelease [137 kB]
Get:6 http://security.ubuntu.com/ubuntu resolute-security/multiverse amd64 Packages [24.6 kB]
Get:7 http://security.ubuntu.com/ubuntu resolute-security/main amd64 Packages [746 kB]   
Get:8 http://archive.ubuntu.com/ubuntu resolute-backports InRelease [137 kB]            
Get:9 http://archive.ubuntu.com/ubuntu resolute/restricted amd64 Packages [189 kB]
Get:10 http://archive.ubuntu.com/ubuntu resolute/multiverse amd64 Packages [352 kB]
Get:11 http://archive.ubuntu.com/ubuntu resolute/main amd64 Packages [1874 kB]
Get:12 http://archive.ubuntu.com/ubuntu resolute/universe amd64 Packages [20.1 MB]
Get:13 http://archive.ubuntu.com/ubuntu resolute-updates/main amd64 Packages [991 kB]              
Get:14 http://archive.ubuntu.com/ubuntu resolute-updates/universe amd64 Packages [472 kB]          
Get:15 http://archive.ubuntu.com/ubuntu resolute-updates/restricted amd64 Packages [668 kB]        
Get:16 http://archive.ubuntu.com/ubuntu resolute-updates/multiverse amd64 Packages [26.1 kB]       
Get:17 http://archive.ubuntu.com/ubuntu resolute-backports/universe amd64 Packages [3308 B]        
Fetched 26.9 MB in 7s (3675 kB/s)                                                                  
Reading package lists... Done
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Solving dependencies... Done
The following additional packages will be installed:
  nginx-common
Suggested packages:
  fcgiwrap nginx-doc ssl-cert
The following NEW packages will be installed:
  nginx nginx-common
0 upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
Need to get 656 kB of archives.
After this operation, 1864 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu resolute-updates/main amd64 nginx-common all 1.28.3-2ubuntu1.12 [38.2 kB]
Get:2 http://archive.ubuntu.com/ubuntu resolute-updates/main amd64 nginx amd64 1.28.3-2ubuntu1.12 [618 kB]
Fetched 656 kB in 2s (291 kB/s)
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 79, <STDIN> line 2.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC entries checked: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.40.1 /usr/local/share/perl/5.40.1 /usr/lib/x86_64-linux-gnu/perl5/5.40 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl-base /usr/lib/x86_64-linux-gnu/perl/5.40 /usr/share/perl/5.40 /usr/local/lib/site_perl) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 8, <STDIN> line 2.)
debconf: falling back to frontend: Teletype
Preconfiguring packages ...
Selecting previously unselected package nginx-common.
(Reading database ... 7789 files and directories currently installed.)
Preparing to unpack .../nginx-common_1.28.3-2ubuntu1.12_all.deb ...
Unpacking nginx-common (1.28.3-2ubuntu1.12) ...
Selecting previously unselected package nginx.
Preparing to unpack .../nginx_1.28.3-2ubuntu1.12_amd64.deb ...
Unpacking nginx (1.28.3-2ubuntu1.12) ...
Setting up nginx-common (1.28.3-2ubuntu1.12) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 79.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC entries checked: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.40.1 /usr/local/share/perl/5.40.1 /usr/lib/x86_64-linux-gnu/perl5/5.40 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl-base /usr/lib/x86_64-linux-gnu/perl/5.40 /usr/share/perl/5.40 /usr/local/lib/site_perl) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 8.)
debconf: falling back to frontend: Teletype
Setting up nginx (1.28.3-2ubuntu1.12) ...
invoke-rc.d: could not determine current runlevel
invoke-rc.d: policy-rc.d denied execution of start.
root@bd2cc02c98aa:/# service nginx start
 * Starting nginx nginx                                                                      [ OK ] 
root@bd2cc02c98aa:/#
```

### dockerfile 기반 커스텀 이미지

```powershell
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker build -t junsang-web_01:1.0 .
[+] Building 0.3s (7/7) FINISHED                                                               docker:desktop-linux
 => [internal] load build definition from dockerfile                                                           0.0s
 => => transferring dockerfile: 298B                                                                           0.0s
 => [internal] load metadata for docker.io/library/nginx:alpine                                                 0.0s
 => [internal] load .dockerignore                                                                              0.0s
 => => transferring context: 2B                                                                                0.0s
 => [internal] load build context                                                                              0.0s
 => => transferring context: 32B                                                                               0.0s
 => [1/2] FROM docker.io/library/nginx:alpine@sha256:785835ea65db4bba6f021acc0f3be91b0fef76a53fe41f8588c6698d2aed0606  0.0s
 => => resolve docker.io/library/nginx:alpine@sha256:785835ea65db4bba6f021acc0f3be91b0fef76a53fe41f8588c6698d2aed0606  0.0s
 => CACHED [2/2] COPY index.html /usr/share/nginx/html/index.html                                               0.0s
 => exporting to image                                                                                         0.1s
 => => exporting layers                                                                                        0.0s
 => => exporting manifest sha256:a7e0087a4a55ef79cf9d40c57f2ad7d7e156383f84a8ae3ce73b34d8e476de40               0.0s
 => => exporting config sha256:d40c7b1017b2ebd590ab755513a71871ceeb82fee0e13c97b3482b07f5d5296                  0.0s
 => => exporting attestation manifest sha256:60783730777294b8eb74c4c50fa25d1473bee1be262e323e68aae3081a44b657    0.0s
 => => exporting manifest list sha256:1cf84192e3c9c5cce5a0b99e30eaa9d00a71b75ccd69c18e210e7a77df75af89          0.0s
 => => naming to docker.io/library/junsang-web_01:1.0                                                          0.0s
 => => unpacking to docker.io/library/junsang-web_01:1.0                                                       0.0s
```

### 포트 매핑 및 접속

`curl http://localhost:8000`을 통해 호스트에서 접속해봤다.

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

### docker 볼륨 영속성 검증

`docker run`으로 빌드할 때 `-v`옵션을 사용해 볼륨을 바인드 마운트 해서 영속성 컨테이너를 삭제 후 재 빌드 후에도 내용이 남았음을 확인하였다.

- [9. Docker 볼륨 영속성 검증](./기능%20요구%20사항%20증빙%20자료/9.%20볼륨%20영속성%20검증.log)

```powershell
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker ps
CONTAINER ID   IMAGE     COMMAND            CREATED         STATUS         PORTS                                     NAMES
38dc20f39f26   ubuntu    "sleep infinity"   9 minutes ago   Up 9 minutes   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   serene_allen
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker exec -it 38d bash
root@38dc20f39f26:/# cd var/www/html
root@38dc20f39f26:/var/www/html# ls -al
total 12
drwxrwxrwx 1 101  101  4096 Oct 31 09:52  .
drwxr-xr-x 3 root root 4096 Nov  1 04:45  ..
drwxrwxrwx 1 101  101  4096 Oct 31 10:09  .git
-rwxrwxrwx 1 101  101  2010 Nov  1 04:42  README.md
-rwxrwxrwx 1 101  101   502 Nov  1 04:42  dockerfile
-rwxrwxrwx 1 101  101   285 Oct 31 09:34  index.html
-rw-r--r-- 1 root root  615 Oct 31 09:33  index.nginx-debian.html
drwxrwxrwx 1 101  101  4096 Oct 31 10:08 ''$'\352\270\260\353\212\245'' '$'\354\232\224\352\265\254'' '$'\354\202\254\355\225\255'' '$'\354\246\235\353\271\231'' '$'\354\236\220\353\243\214'
root@38dc20f39f26:/var/www/html# exit
exit

What's next:
    Try Docker Debug for seamless, persistent debugging tools in any container or image → docker debug 38d
    Learn more at https://docs.docker.com/go/debug-cli/
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker ps
CONTAINER ID   IMAGE     COMMAND            CREATED          STATUS          PORTS                                     NAMES
38dc20f39f26   ubuntu    "sleep infinity"   10 minutes ago   Up 10 minutes   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   serene_allen
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker rm -f 38d
38d
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker run -d -p 8080:80 -v ${pwd}:/var/www/html --name ubuntu-web-test ubuntu
ae18e1344fa6e149c7e6af1b1c25a82e075d5ea0e217e1db31c24ac1395ac3c6
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker ps -a
CONTAINER ID   IMAGE                COMMAND                  CREATED          STATUS                      PORTS     NAMES
ae18e1344fa6   ubuntu               "/bin/bash"              12 seconds ago   Exited (0) 12 seconds ago             ubuntu-web-test
15e4b89bc8f8   junsang-web_01:1.1   "/docker-entrypoint.…"   21 hours ago     Exited (0) 20 hours ago               junsang-web_01-container
825a73e7fb36   ubuntu               "cat /data/persisten…"   44 hours ago     Exited (0) 44 hours ago               volume-verify-container
4a5a8067ce72   nginx:alpine         "/docker-entrypoint.…"   44 hours ago     Exited (0) 22 hours ago               bind-server
71f925e8307a   ubuntu               "bash"                   45 hours ago     Exited (0) 45 hours ago               gracious_cartwright
68a408c6c4f9   ubuntu               "bash"                   45 hours ago     Exited (137) 22 hours ago             vigorous_goldwasser
477bd90e9f47   hello-world          "/hello"                 45 hours ago     Exited (0) 45 hours ago               sleepy_perlman
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker rm -f ae1
ae1
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker ps -a
CONTAINER ID   IMAGE                COMMAND                  CREATED        STATUS                      PORTS     NAMES
15e4b89bc8f8   junsang-web_01:1.1   "/docker-entrypoint.…"   21 hours ago   Exited (0) 20 hours ago               junsang-web_01-container
825a73e7fb36   ubuntu               "cat /data/persisten…"   44 hours ago   Exited (0) 44 hours ago               volume-verify-container
4a5a8067ce72   nginx:alpine         "/docker-entrypoint.…"   44 hours ago   Exited (0) 22 hours ago               bind-server
71f925e8307a   ubuntu               "bash"                   45 hours ago   Exited (0) 45 hours ago               gracious_cartwright
68a408c6c4f9   ubuntu               "bash"                   45 hours ago   Exited (137) 22 hours ago             vigorous_goldwasser
477bd90e9f47   hello-world          "/hello"                 45 hours ago   Exited (0) 45 hours ago               sleepy_perlman
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker run -d -p 8080:80 -v ${pwd}:/var/www/html --name ubuntu-web-test ubuntu sleep infinity
5f31696b2eac13d303367663e46acec28626ec0fe292db1bcd9d8197d11aa31c
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker ps
CONTAINER ID   IMAGE     COMMAND            CREATED         STATUS         PORTS                                     NAMES
5f31696b2eac   ubuntu    "sleep infinity"   3 seconds ago   Up 2 seconds   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   ubuntu-web-test
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker exec -it 5f3
docker: 'docker exec' requires at least 2 arguments

Usage:  docker exec [OPTIONS] CONTAINER COMMAND [ARG...]

See 'docker exec --help' for more information

What's next:
    Try Docker Debug for seamless, persistent debugging tools in any container or image → docker debug 5f3
    Learn more at https://docs.docker.com/go/debug-cli/
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> docker exec -it 5f3 bash
root@5f31696b2eac:/# cd var/www/html
root@5f31696b2eac:/var/www/html# ls -al
total 12
drwxrwxrwx 1 101  101  4096 Oct 31 09:52  .
drwxr-xr-x 3 root root 4096 Nov  1 04:59  ..
drwxrwxrwx 1 101  101  4096 Oct 31 10:09  .git
-rwxrwxrwx 1 101  101  2010 Nov  1 04:42  README.md
-rwxrwxrwx 1 101  101   502 Nov  1 04:42  dockerfile
-rwxrwxrwx 1 101  101   285 Oct 31 09:34  index.html
-rw-r--r-- 1 root root  615 Oct 31 09:33  index.nginx-debian.html
drwxrwxrwx 1 101  101  4096 Oct 31 10:08 ''$'\352\270\260\353\212\245'' '$'\354\232\224\352\265\254'' '$'\354\202\254\355\225\255'' '$'\354\246\235\353\271\231'' '$'\354\236\220\353\243\214'
root@5f31696b2eac:/var/www/html#
```

### Git 설정 및 GitHub 연동

```powershell
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> git config --list
diff.astextplain.textconv=astextplain
filter.lfs.clean=git-lfs clean -- %f
filter.lfs.smudge=git-lfs smudge -- %f
filter.lfs.process=git-lfs filter-process
filter.lfs.required=true
http.sslbackend=schannel
core.autocrlf=true
core.fscache=true
core.symlinks=false
pull.rebase=false
credential.helper=manager
credential.https://dev.azure.com.usehttppath=true
init.defaultbranch=master
user.name=lee soyeon
user.email=thdu9067@naver.com
core.repositoryformatversion=0
core.filemode=false
core.bare=false
core.logallrefupdates=true
core.symlinks=false
core.ignorecase=true
remote.origin.url=https://junsang3101@github.com/junsang3101/Codyssey_Pre-Course_1-1.git
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
branch.main.remote=origin
branch.main.merge=refs/heads/main
branch.main.vscode-merge-base=origin/main
user.name=junsang3101
user.email=3101junsang@gmail.com
```

### 보너스 과제 증빙자료

### Docker Compose 기초

compose.yaml 로 실행 설정을 분리해 빌드해봤다. 도커 컴포즈를 활용하면 도커가 자동으로 관련 컨테이너를 추적/관리 해주기 때문에 용이하다.

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

### GitHub SSH 키 설정

윈도에 기본으로 내장되어있는 openssl 로 ed25519 SSL키를 만들어 깃에 등록하였다.

```powershell
PS C:\Users\컴퓨터정보학과 10616호> ssh-keygen -t ed25519 -C "3101junsang@gmail.com"
Generating public/private ed25519 key pair.
Enter file in which to save the key (C:\Users\컴퓨터정보학과 10616호/.ssh/id_ed25519): testkey
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in testkey
Your public key has been saved in testkey.pub
The key fingerprint is:
SHA256:+BWml+ajhyupmssU4qU/72vQs83hVgdH4L5fbRopZ24 3101junsang@gmail.com
The key's randomart image is:
+--[ED25519 256]--+
|         ..      |
|        .  .     |
|         .+      |
|       ..+ +     |
|. ... . S.B      |
|..oo o o *..  o  |
| o. . *.+o+. * o |
| o.o oo=..o.*E+  |
|  =+*=o.oo ..o   |
+----[SHA256]-----+
PS C:\Users\컴퓨터정보학과 10616호> get-content .\testkey.pub | set-clipboard
```

```powershell
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> git remote set-url origin git@github.com:junsang3101/Codyssey_Pre-Course_1-1.git
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> git remote -v
origin  git@github.com:junsang3101/Codyssey_Pre-Course_1-1.git (fetch)
origin  git@github.com:junsang3101/Codyssey_Pre-Course_1-1.git (push)
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> git push
The authenticity of host 'github.com (20.200.245.247)' can't be established.
ED25519 key fingerprint is SHA256:+DiY3wvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? y
Please type 'yes', 'no' or the fingerprint: yes
Warning: Permanently added 'github.com' (ED25519) to the list of known hosts.
Enter passphrase for key '/c/Users/User/.ssh/id_ed25519':
Enumerating objects: 13, done.
Counting objects: 100% (13/13), done.
Delta compression using up to 8 threads
Compressing objects: 100% (8/8), done.
Writing objects: 100% (9/9), 177.19 KiB | 1.05 MiB/s, done.
Total 9 (delta 2), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (2/2), done.
To github.com:junsang3101/Codyssey_Pre-Course_1-1.git
   82bf624..d851285  main -> main
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1>
```

![15-1. GitHub SSH 키 설정](./기능%20요구%20사항%20증빙%20자료/15-1.%20GitHub%20SSH%20키%20설정.png)

### 트러블 슈팅

### 1:Git SSH 키 등록 후에도 브라우저로 인증이 뜨는 문제

- **증상**: Git에서 SSH키를 설정한 후에도 브라우저로 인증창이 뜸 
- **원인**: git remote 주소가 HTTPS 형식으로 남아서 SSH 키를 사용하지 않음
- **해결**: git remote set-url 을 통해 SSH키를 사용하도록 함
- **배운점**: 인증 방식은 GitHub키 등록과 별개로 remote 주소 형식도 바꿔줘야 등록된 키로 인증할 수 있음

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

### 2: 

- **증상**:
- **원인**:
- **해결**:
- **배운점**: