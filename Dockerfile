FROM python:2.7-alpine

LABEL maintainer="alex.khaerov@chainstack.com"
LABEL vendor="chainstack"

RUN mkdir /app

WORKDIR /app

ADD ./entrypoint.sh .

RUN apk --no-cache add \
    bash \
    build-base \
    gcc \
    sqlite \
    && pip install pycrypto 


RUN pip install https://github.com/MultiChain/multichain-explorer/archive/master.tar.gz

CMD ["/bin/bash", "/app/entrypoint.sh"]

EXPOSE 2750