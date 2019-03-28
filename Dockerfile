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

# Mar 28, 2019
ENV EXPLORER_VERSION=9ced7cf

RUN pip install -r https://raw.githubusercontent.com/chainstack/multichain-explorer/${EXPLORER_VERSION}/requirements.txt && \
    pip install https://github.com/chainstack/multichain-explorer/archive/${EXPLORER_VERSION}.zip

CMD ["/bin/bash", "/app/entrypoint.sh"]

EXPOSE 2750
