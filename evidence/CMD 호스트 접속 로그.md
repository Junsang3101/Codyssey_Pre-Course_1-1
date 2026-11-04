# CMD 호스트 접속 로그

Docker Compose의 포트 매핑을 설정하고, CMD에서 `curl http://localhost:8080`을 실행해 호스트에서 웹 페이지에 접속되는 것을 확인했습니다. 컨테이너는 자체 네트워크에서 동작하므로 호스트에서 접근하려면 포트를 공개해야 합니다.

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