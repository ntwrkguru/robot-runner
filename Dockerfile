FROM alpine:3.6

WORKDIR /tmp

COPY requirements.txt .

RUN apk add --no-cache --virtual build-deps python3-dev build-base \
    gcc make g++ openssl-dev  libffi-dev && \
    apk add --no-cache py3-lxml libxslt-dev \
    python3 py3-pip libxml2-dev openssl ca-certificates
RUN pip install -r requirements.txt && \
    apk del build-deps

WORKDIR /tests

VOLUME tests

VOLUME output

ENTRYPOINT ["robot"]

CMD ["--help"] 
