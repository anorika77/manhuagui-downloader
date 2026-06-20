# 使用官方轻量级 Python 镜像
FROM python:3.10-slim

# 设置工作目录
WORKDIR /app

# 将依赖文件拷贝进去并安装
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 拷贝项目代码
COPY . .

# 运行程序 (请根据实际需要修改入口参数)
CMD ["python", "manhuagui_downloader.py"]
