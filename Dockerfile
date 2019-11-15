FROM alpine:3.6

WORKDIR /tmp

COPY requirements.txt .

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN apk add --no-cache --virtual build-deps python3-dev build-base \
    gcc make g++ openssl-dev  libffi-dev && \
    apk add --no-cache py3-lxml libxslt-dev \
    python3 py3-pip libxml2-dev openssl ca-certificates && \
    pip3 install -r requirements.txt && \
    apk del build-deps

RUN ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip

WORKDIR /tests

VOLUME ["/tests"]

VOLUME ["/output"]

VOLUME ["/packages"]

ENTRYPOINT ["ash", "/usr/local/bin/entrypoint.sh"]

CMD ["--help"] 
