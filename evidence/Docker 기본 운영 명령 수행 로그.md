# Docker 기본 운영 명령 수행 로그

```text
PS E:\git_repo\Codyssey_Pre-Course_1-1> docker images
                                                                                                                                          i Info →   U  In Use
IMAGE                                ID             DISK USAGE   CONTENT SIZE   EXTRA
codyssey_pre-course_1-1-app:latest   59e3769d2189        216MB         52.7MB    U   
codyssey_pre-course_1-1-web:latest   c30f3f33c993        127MB         32.2MB    U   
redis:latest                         de1068af6f55        213MB         57.6MB    U   
ubuntu:24.04                         fe81560990fa        119MB         31.7MB    U   
PS E:\git_repo\Codyssey_Pre-Course_1-1> docker ps -a
CONTAINER ID   IMAGE          COMMAND                   CREATED             STATUS             PORTS                                     NAMES
7aebb4fd4b57   ubuntu:24.04   "sleep infinity"          About an hour ago   Up About an hour                                             ubuntu24.04
b3cfdd36e2f5   d5778a18b29c   "nginx -g 'daemon of…"   2 hours ago         Up 2 hours         0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   ubuntu-web-test
5b3e48ebdfc3   8b3f3df8235e   "python app.py"           2 hours ago         Up 2 hours         5000/tcp                                  codyssey_pre-course_1-1-app-1
CONTAINER ID   NAME                              CPU %     MEM USAGE / LIMIT     MEM %     NET I/O           BLOCK I/O         PIDS
7aebb4fd4b57   ubuntu24.04                       0.00%     2.449MiB / 7.667GiB   0.03%     1.17kB / 126B     1.57MB / 4.1kB    1
b3cfdd36e2f5   ubuntu-web-test                   0.00%     14.17MiB / 7.667GiB   0.18%     4.52kB / 3.81kB   14.2MB / 8.19kB   13
5b3e48ebdfc3   codyssey_pre-course_1-1-app-1     0.01%     35.23MiB / 7.667GiB   0.45%     1.86kB / 126B     0B / 889kB        1
f6fdeb73c3a5   codyssey_pre-course_1-1-redis-1   0.19%     7.875MiB / 7.667GiB   0.10%     2.1kB / 126B      0B / 0B           6

PS E:\git_repo\Codyssey_Pre-Course_1-1> docker ps   
CONTAINER ID   IMAGE          COMMAND                   CREATED             STATUS             PORTS                                     NAMES
7aebb4fd4b57   ubuntu:24.04   "sleep infinity"          About an hour ago   Up About an hour                                             ubuntu24.04
b3cfdd36e2f5   d5778a18b29c   "nginx -g 'daemon of…"   2 hours ago         Up 2 hours         0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   ubuntu-web-test
5b3e48ebdfc3   8b3f3df8235e   "python app.py"           2 hours ago         Up 2 hours         5000/tcp                                  codyssey_pre-course_1-1-app-1
f6fdeb73c3a5   redis          "docker-entrypoint.s…"   2 hours ago         Up 2 hours         6379/tcp                                  codyssey_pre-course_1-1-redis-1
PS E:\git_repo\Codyssey_Pre-Course_1-1> docker logs --help
Usage:  docker logs [OPTIONS] CONTAINER

Fetch the logs of a container

Aliases:
  docker container logs, docker logs

Options:
      --details        Show extra details provided to logs
  -f, --follow         Follow log output
      --since string   Show logs since timestamp (e.g.
                       "2013-01-02T13:23:37Z") or relative (e.g. "42m"
                       for 42 minutes)
  -n, --tail string    Number of lines to show from the end of the logs
                       (default "all")
  -t, --timestamps     Show timestamps
      --until string   Show logs before a timestamp (e.g.
                       "2013-01-02T13:23:37Z") or relative (e.g. "42m"
                       for 42 minutes)
PS E:\git_repo\Codyssey_Pre-Course_1-1> docker logs -ft b3c  
2026-11-02T09:53:51.537636294Z 172.18.0.1 - - [02/Nov/2026:09:53:51 +0000] "GET / HTTP/1.1" 200 285 "-" "Mozilla/5.0 (Windows NT; Windows NT 10.0; ko-KR) WindowsPowerShell/5.1.26100.9711"
2026-11-02T09:53:58.029386529Z 172.18.0.1 - - [02/Nov/2026:09:53:58 +0000] "GET / HTTP/1.1" 200 285 "-" "curl/8.21.0"
2026-11-02T09:55:01.167778206Z 172.18.0.1 - - [02/Nov/2026:09:55:01 +0000] "GET / HTTP/1.1" 200 234 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36"
2026-11-02T09:55:01.307634778Z 172.18.0.1 - - [02/Nov/2026:09:55:01 +0000] "GET /favicon.ico HTTP/1.1" 404 196 "http://localhost:8080/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36"
PS E:\git_repo\Codyssey_Pre-Course_1-1> 
```