FROM python:3.10-slim AS builder

WORKDIR /app
COPY . .

RUN pip install --upgrade pip && \
    if [ -f requirements.txt ]; then pip install -r requirements.txt; \
    elif [ -f Pipfile ]; then pip install pipenv && pipenv install --system; \
    elif [ -f pyproject.toml ]; then pip install .; \
    else pip install .; fi

FROM python:3.10-slim
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
COPY --from=builder /app /app

# 假设入口是 src 下的模块
ENTRYPOINT ["python", "-m", "manhuagui_downloader"]
