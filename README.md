## 프로젝트 개요

본 프로젝트는 개발 워크스테이션 세팅 미션의 일환으로 리눅스 CLI(터미널), Docker(컨테이너), Git/GitHub(버전 관리 및 엽업, 형상 관리 도구)를 함께 사용해 누구나 같은 방식으로 실행, 배포, 디버깅 할 수 있는 환경 구성을 하는 것을 목표로 합니다

## 실행 환경

- OS: Window 11
- Shell: CMD(Command Prompt), PowerShell, Bash(Docker 컨테이너에서 사용)
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

컨테이너 OS 및 SHELL 종류
![실행환경1: 컨테이너 OS 및 SHELL 종류](./기능%20요구%20사항%20증빙%20자료/1-1.png)

Docker 및 Git 버전
![실행환경2: docker 및 Git 버전](./기능%20요구%20사항%20증빙%20자료/1-2.png)

### 터미널 조작 로그 기록

![2. 터미널 조작 로그 기록](./기능%20요구%20사항%20증빙%20자료/2.%20터미널%20조작.png)

### 권한 변경 실습

![3. 권한 실습](./기능%20요구%20사항%20증빙%20자료/3.%20권한%20실습.png)

### Docker 기본 점검

- [4. Docker 기본 점검](./기능%20요구%20사항%20증빙%20자료/4.%20docker기본점검.log)

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

attach/exec 관찰한 차이점
docker attach 를 사용해 봤는데 프롬프트가 멈추고 조작을 할 수 없었다.
알고보니 입력과 명령어는 전달되고 있으니 셀을 열어주지 않기 떄문에 보이지 않는
(No Echo)상태일 뿐이었다. 보면서 할 수 있는 exec사용을 지향하는게 좋을 것 같다.
```

### dockerfile 기반 커스텀 이미지

![7. dockerfile 기반 사설 이미지](./기능%20요구%20사항%20증빙%20자료/7.%20dockerfile%20기반%20커스텀%20이미지%20제작.png)

### 포트 매핑 및 접속

![8. 포트 매핑 및 접속](./기능%20요구%20사항%20증빙%20자료/8.%20포트%20매핑%20및%20접속%20증거.png)

### docker 볼륨 영속성 검증

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

![10. Git 설정 및 GitHub연동](./기능%20요구%20사항%20증빙%20자료/10.%20git%20설정%20및%20github%20연동.png)

### 보너스 과제 증빙자료

### Docker Compose 기초

![11. Docker Compose 기초](./기능%20요구%20사항%20증빙%20자료/11.%20Docker%20Compose%20기초.png)

### GitHub SSH 키 설정

![15-1. GitHub SSH 키 설정](./기능%20요구%20사항%20증빙%20자료/15-1.%20GitHub%20SSH%20키%20설정.png)

![15-2. GitHub SSH 키 설정](./기능%20요구%20사항%20증빙%20자료/15-2.%20ssh키로%20git%20push.png)

### 트러블 슈팅

### 1:Git SSH 키 등록 후에도 브라우저로 인증이 뜨는 문제

- **증상**: Git에서 SSH키를 설정한 후에도 브라우저로 인증창이 뜸 
- **원인**: git remote 주소가 HTTPS 형식으로 남아서 SSH 키를 사용하지 않음
- **해결**: git remote set-url 을 통해 SSH키를 사용하도록 함
- **배운점**: 인증 방식은 GitHub키 등록과 별개로 remote 주소 형식도 바꿔줘야 등록된 키로 인증할 수 있음

![1. 트러블 슈팅](./기능%20요구%20사항%20증빙%20자료/트러블%20슈팅%20증빙%20자료1(git)%20.png)

### 2: 

- **증상**:
- **원인**:
- **해결**:
- **배운점**: