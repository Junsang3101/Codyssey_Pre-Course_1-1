import socket
import redis
from flask import Flask, jsonify

app = Flask(__name__)
# Docker compose 가 내부적으로 DNS가 있어 host="redis"로 redis 컨테이너로 접근 가능
r = redis.Redis(host="redis", port=6379, decode_responses=True)

# flask 데코레이터 '/hello'로 함수 실행하게 함 '/hello' HTTP 요청 -> API호출/Endpoint호출
@app.route("/hello")
def hello():
    return jsonify(message="Hello from app!", container=socket.gethostbyname())

@app.route("/count")
def count():
    visit = r.incr("visits")
    return jsonify(visit=visit, container=socket.gethostname())

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)