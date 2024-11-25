FROM python:slim

WORKDIR /app

COPY . /app/

EXPOSE 3000

CMD ["python", "-m", "http.server", "3000"]