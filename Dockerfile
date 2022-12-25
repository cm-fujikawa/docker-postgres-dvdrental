FROM postgres:15.1

RUN apt update && \
    apt install -y wget unzip --no-install-recommends && \
    apt clean -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /docker-entrypoint-initdb.d

RUN echo 'CREATE DATABASE dvdrental;' > 01-dvdrental.sql && \
    echo 'pg_restore -U postgres -d dvdrental /docker-entrypoint-initdb.d/dvdrental.tar' > 02-dvdrental.sh

RUN wget --no-check-certificate https://www.postgresqltutorial.com/wp-content/uploads/2019/05/dvdrental.zip && \
    unzip dvdrental.zip && \
    rm -f dvdrental.zip

WORKDIR /
