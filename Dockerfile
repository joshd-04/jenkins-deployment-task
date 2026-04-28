ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION:-3.8}
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
ARG AUTHOR
LABEL author=${AUTHOR}
LABEL description="some app"
LABEL version="1.0.1"
ENV YOUR_NAME="josh"
EXPOSE 5500
ENTRYPOINT ["python", "app.py"]