# syntax=docker/dockerfile:1

FROM python:3-alpine

WORKDIR /app

# Install MySQL client dependencies
RUN apk add --no-cache mariadb-connector-c-dev

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

# Copy MySQL configuration files
COPY config /etc/mysql/conf.d

CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
