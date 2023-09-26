FROM python:3

WORKDIR /app

COPY sample-django/requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

COPY sample-django/. /app/

RUN chmod +x script.sh

EXPOSE 8000

CMD ["sh", "-c", "/app/script.sh"]
