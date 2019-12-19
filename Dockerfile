FROM python:2-alpine

LABEL vendor="Chainstack"

RUN mkdir /app

WORKDIR /app

RUN apk update \
    && apk --no-cache add \
    gcc \
    build-base \
    sqlite

ENV EXPLORER_VERSION=v1.0.0

RUN pip install -r https://raw.githubusercontent.com/chainstack/multichain-explorer/${EXPLORER_VERSION}/requirements.txt \
    && pip install https://github.com/chainstack/multichain-explorer/archive/${EXPLORER_VERSION}.zip

EXPOSE 2750
