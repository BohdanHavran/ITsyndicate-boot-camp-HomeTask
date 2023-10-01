FROM python:3.11-alpine

WORKDIR /app

RUN apk add --no-cache bash

COPY ./requirements.txt ./
COPY ./ ./

RUN adduser -D -u 1001 appuser && \
    pip install --no-cache-dir -r requirements.txt && \
    chown -R appuser:appuser /app

USER appuser

CMD ["sh", "-c", "./script.sh"]
