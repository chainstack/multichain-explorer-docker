FROM python:2-alpine

LABEL maintainer="alex.khaerov@chainstack.com"
LABEL vendor="Chainstack"

RUN mkdir /app

WORKDIR /app

RUN apk update \
    && apk --no-cache add \
    gcc \
    build-base \
    sqlite

ENV EXPLORER_VERSION=05-08-2019

RUN pip install -r https://raw.githubusercontent.com/chainstack/multichain-explorer/${EXPLORER_VERSION}/requirements.txt \
    && pip install https://github.com/chainstack/multichain-explorer/archive/${EXPLORER_VERSION}.zip

EXPOSE 2750
