FROM python:3.16-rc-slim
# 컨테이너에 /app 만들어서 작업공간으로 사용
WORKDIR /app
# requirements.txt의 항목들 pip(파이선 패키지 관리자)로 설치
# '--no-cache-dir' 설치 과정 중 찌꺼기 파일(캐시)를 남기지 않음
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app.py .
# 'python app.py'
CMD ["python", "app.py"]