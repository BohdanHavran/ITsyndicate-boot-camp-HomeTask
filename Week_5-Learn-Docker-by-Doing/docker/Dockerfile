FROM python:3.11-alpine

WORKDIR /app

RUN apk add --no-cache bash

COPY sample-django/requirements.txt ./
COPY sample-django/. ./

RUN adduser -D -u 1001 appuser && \
    pip install --no-cache-dir -r requirements.txt && \
    chown -R appuser:appuser /app

EXPOSE 8000

USER appuser

CMD ["sh", "-c", ".script.sh"]
