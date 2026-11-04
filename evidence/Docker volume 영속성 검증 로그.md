# Docker volume 영속성 검증 로그

```powershell
PS E:\git_repo\Codyssey_Pre-Course_1-1> docker volume create testVol
testVol
PS E:\git_repo\Codyssey_Pre-Course_1-1> docker run -d -v testVol:/home --name testContainer ubuntu sleep infinity
Unable to find image 'ubuntu:latest' locally
latest: Pulling from library/ubuntu
f3f25b84a7d7: Pull complete 
edafa32f5d9e: Pull complete 
21594acc2d8b: Download complete 
Digest: sha256:6a06111c3b0a8600feadb270aec771dc239bf407b25625f93f44ab00e11f4d3c
Status: Downloaded newer image for ubuntu:latest
2f533461e8fa9b1cf70c3874710c5a8524989093ae1571a38a9935aa8f1505bc
PS E:\git_repo\Codyssey_Pre-Course_1-1> docker ps
CONTAINER ID   IMAGE                         COMMAND                   CREATED          STATUS         PORTS                                     NAMES
2f533461e8fa   ubuntu                        "sleep infinity"          10 seconds ago   Up 9 seconds                                             testContainer
13d34a54afd0   codyssey_pre-course_1-1-web   "nginx -g 'daemon of…"   11 minutes ago   Up 8 minutes   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   ubuntu-web-test
c2d1d86f5c2e   codyssey_pre-course_1-1-app   "python app.py"           11 minutes ago   Up 8 minutes   5000/tcp                                  codyssey_pre-course_1-1-app-1
ca346ef3f4e9   redis                         "docker-entrypoint.s…"   11 minutes ago   Up 8 minutes   6379/tcp                                  codyssey_pre-course_1-1-redis-1
PS E:\git_repo\Codyssey_Pre-Course_1-1> docker images
                                                                                                                                                           i Info →   U  In Use
IMAGE                                ID             DISK USAGE   CONTENT SIZE   EXTRA
codyssey_pre-course_1-1-app:latest   75c6e92aee79        216MB         52.7MB    U   
codyssey_pre-course_1-1-web:latest   dec64992b862        127MB         32.2MB    U   
redis:latest                         de1068af6f55        213MB         57.6MB    U   
testimgae:latest                     1fb78604fafa        127MB         32.2MB        
ubuntu:24.04                         fe81560990fa        119MB         31.7MB        
ubuntu:latest                        6a06111c3b0a        163MB         45.9MB    U   
PS E:\git_repo\Codyssey_Pre-Course_1-1> docker exec -it 2f5
docker: 'docker exec' requires at least 2 arguments

Usage:  docker exec [OPTIONS] CONTAINER COMMAND [ARG...]

See 'docker exec --help' for more information

What's next:
    Try Docker Debug for seamless, persistent debugging tools in any container or image → docker debug 2f5
    Learn more at https://docs.docker.com/go/debug-cli/
PS E:\git_repo\Codyssey_Pre-Course_1-1> docker exec -it 2f5 bash
root@2f533461e8fa:/# cd home
root@2f533461e8fa:/home# ls
ubuntu
root@2f533461e8fa:/home# touch testfile
root@2f533461e8fa:/home# ls -al
total 12
drwxr-xr-x 3 root   root   4096 Nov  2 12:44 .
drwxr-xr-x 1 root   root   4096 Nov  2 12:42 ..
-rw-r--r-- 1 root   root      0 Nov  2 12:44 testfile
drwxr-x--- 2 ubuntu ubuntu 4096 Nov  2 12:42 ubuntu
root@2f533461e8fa:/home# exit
exit

What's next:
    Try Docker Debug for seamless, persistent debugging tools in any container or image → docker debug 2f5
    Learn more at https://docs.docker.com/go/debug-cli/
PS E:\git_repo\Codyssey_Pre-Course_1-1> docker ps        
CONTAINER ID   IMAGE                         COMMAND                   CREATED              STATUS              PORTS                                     NAMES
2f533461e8fa   ubuntu                        "sleep infinity"          About a minute ago   Up About a minute                                             testContainer
13d34a54afd0   codyssey_pre-course_1-1-web   "nginx -g 'daemon of…"   12 minutes ago       Up 10 minutes       0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   ubuntu-web-test
c2d1d86f5c2e   codyssey_pre-course_1-1-app   "python app.py"           12 minutes ago       Up 10 minutes       5000/tcp                                  codyssey_pre-course_1-1-app-1
ca346ef3f4e9   redis                         "docker-entrypoint.s…"   12 minutes ago       Up 10 minutes       6379/tcp                                  codyssey_pre-course_1-1-redis-1
PS E:\git_repo\Codyssey_Pre-Course_1-1> docker rm -f 2f5
2f5
PS E:\git_repo\Codyssey_Pre-Course_1-1> docker volume ls        
DRIVER    VOLUME NAME
local     codyssey_pre-course_1-1_redis-data
local     testVol
PS E:\git_repo\Codyssey_Pre-Course_1-1> docker run -d -v testVol:/home --name NewTestContainer ubuntu sleep infinity 
308a1c66ebd9f03aacf56439d302cd20e4cbf239f8ffecad15aa491b0e01e6ac
PS E:\git_repo\Codyssey_Pre-Course_1-1> docker ps 
CONTAINER ID   IMAGE                         COMMAND                   CREATED          STATUS          PORTS                                     NAMES
308a1c66ebd9   ubuntu                        "sleep infinity"          4 seconds ago    Up 3 seconds                                              NewTestContainer
13d34a54afd0   codyssey_pre-course_1-1-web   "nginx -g 'daemon of…"   13 minutes ago   Up 11 minutes   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   ubuntu-web-test
c2d1d86f5c2e   codyssey_pre-course_1-1-app   "python app.py"           13 minutes ago   Up 11 minutes   5000/tcp                                  codyssey_pre-course_1-1-app-1
ca346ef3f4e9   redis                         "docker-entrypoint.s…"   13 minutes ago   Up 11 minutes   6379/tcp                                  codyssey_pre-course_1-1-redis-1
PS E:\git_repo\Codyssey_Pre-Course_1-1> docker exec -it 308 bash
root@308a1c66ebd9:/# ls
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@308a1c66ebd9:/# cd home
root@308a1c66ebd9:/home# ls
testfile  ubuntu
root@308a1c66ebd9:/home# 
```