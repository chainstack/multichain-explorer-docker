FROM python:2-alpine

LABEL maintainer="alex.khaerov@chainstack.com"
LABEL vendor="Chainstack"

RUN mkdir /app

WORKDIR /app

ADD ./entrypoint.sh .

RUN apk --no-cache add \
    bash \
    build-base \
    gcc \
    sqlite

ENV EXPLORER_VERSION=4ea79dad1f6d518c0cb5098820e13c6e2b2cdfd9 # 29 Dec 2018

RUN pip install https://raw.githubusercontent.com/MultiChain/multichain-explorer/${EXPLORER_VERSION}/requirements.txt && \
    pip install https://github.com/MultiChain/multichain-explorer/archive/${EXPLORER_VERSION}.zip

CMD ["/bin/bash", "/app/entrypoint.sh"]

EXPOSE 2750
