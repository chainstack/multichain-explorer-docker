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

# Jan 29, 2019
ENV EXPLORER_VERSION=32e9af2

RUN pip install -r https://raw.githubusercontent.com/MultiChain/multichain-explorer/${EXPLORER_VERSION}/requirements.txt && \
    pip install https://github.com/MultiChain/multichain-explorer/archive/${EXPLORER_VERSION}.zip

CMD ["/bin/bash", "/app/entrypoint.sh"]

EXPOSE 2750
