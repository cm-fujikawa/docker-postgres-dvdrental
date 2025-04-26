FROM postgres:16.5-alpine3.19

WORKDIR /docker-entrypoint-initdb.d

RUN apk update --no-cache && \
    rm -rf /var/cache/apk/*

RUN echo 'CREATE DATABASE dvdrental;' > 01-dvdrental.sql && \
    echo 'pg_restore -U postgres -d dvdrental /docker-entrypoint-initdb.d/dvdrental.tar' > 02-dvdrental.sh

RUN wget --no-check-certificate https://www.postgresqltutorial.com/wp-content/uploads/2019/05/dvdrental.zip && \
    unzip dvdrental.zip && \
    rm -f dvdrental.zip

WORKDIR /

HEALTHCHECK --interval=30s --timeout=10s --retries=5 \
  CMD pg_isready -U $POSTGRES_USER || exit 1
