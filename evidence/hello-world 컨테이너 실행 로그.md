# hello-world 컨테이너 실행 로그

```text
PS E:\git_repo\Codyssey_Pre-Course_1-1> docker ps -a
CONTAINER ID   IMAGE                         COMMAND                   CREATED              STATUS                          PORTS                                     NAMES
3c068b4f13b1   hello-world                   "/hello"                  About a minute ago   Exited (0) About a minute ago                                             hello
77342d9561f9   codyssey_pre-course_1-1-web   "nginx -g 'daemon of…"   15 hours ago         Up 15 hours                     0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   ubuntu-web-test
f8af74ba8534   16079772c3eb                  "python app.py"           17 hours ago         Up 17 hours                     5000/tcp                                  codyssey_pre-course_1-1-app-1
ca588bae016e   redis                         "redis-server --appe…"   17 hours ago         Up 17 hours                     6379/tcp                                  codyssey_pre-course_1-1-redis-1
308a1c66ebd9   ubuntu                        "sleep infinity"          20 hours ago         Up 20 hours                                                               NewTestContainer
PS E:\git_repo\Codyssey_Pre-Course_1-1> docker start 3c0
3c0
PS E:\git_repo\Codyssey_Pre-Course_1-1> docker logs 3c0

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

PS E:\git_repo\Codyssey_Pre-Course_1-1> 
```