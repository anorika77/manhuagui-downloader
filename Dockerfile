FROM python:3.10-slim

WORKDIR /app
COPY . .

RUN pip install --upgrade pip && \
    pip install requests beautifulsoup4 lxml

# 自动检测入口模块（尝试 3 种常见模式）
# 优先使用 python -m manhuagui_downloader (如果 src/manhuagui_downloader/__main__.py 存在)
# 其次使用 python src/manhuagui_downloader/main.py
# 最后使用 python main.py
CMD ["sh", "-c", "python -m manhuagui_downloader 2>/dev/null || python src/manhuagui_downloader/main.py 2>/dev/null || python main.py"]
