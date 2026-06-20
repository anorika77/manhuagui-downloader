FROM python:3.10-slim

WORKDIR /app
COPY . .

RUN pip install --upgrade pip && \
    pip install requests beautifulsoup4 lxml

# 入口：假设是 src 下的模块（如果有的话），否则用 main.py
# 请根据实际情况修改 ENTRYPOINT
ENTRYPOINT ["python", "-m", "manhuagui_downloader"]
