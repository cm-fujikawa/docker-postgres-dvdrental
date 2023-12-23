# docker-postgres-dvdrental

PostreSQL公式Dockerイメージにサンプルデータベース([PostgreSQL Sample Database](https://www.postgresqltutorial.com/postgresql-sample-database/))を作成し、使用できるようにします。

## Dockerイメージを作成

1. Dockerイメージを作成します。

    ```shell
    docker build -t ghcr.io/cm-fujikawa/dvdrental:latest .
    ```

## GitHub Container registryからDockerイメージをプル

1. GitHub Container registryからDockerイメージをプルします。

    ```shell
    docker pull ghcr.io/cm-fujikawa/dvdrental:latest
    ```

## 共通

1. Dockerコンテナを起動します。

    ```shell
    docker run --rm -it -d \
        -p 5432:5432/tcp \
        -e POSTGRES_PASSWORD=mysecretpassword \
        --name dvdrental \
        ghcr.io/cm-fujikawa/dvdrental:latest
    ```

1. コンテナに接続します。

    ```shell
    docker exec -it dvdrental /bin/sh
    ```

## PostgreSQLサーバに接続

1. psqlコマンドでPostgreSQLサーバに接続します。

    ```shell
    psql -U postgres
    ```

1. データベース一覧を表示します。

    ```sql
    \l
    ```

1. dvdrentalデータベースに接続します。

    ```sql
    \c dvdrental
    ```

1. オブジェクト一覧を表示します。

    ```sql
    \d
    ```

1. psqlコマンドを終了します。

    ```sql
    \q
    ```

1. コンテナから抜けます。

    ```shell
    exit
    ```

## 終了方法

1. コンテナを停止します。

    ```shell
    docker stop dvdrental
    ```
