FROM openwhisk/dockerskeleton

ENV FLASK_PROXY_PORT 8080

RUN apk add --update --no-cache --force-overwrite \
    openssl openssl-dev crystal shards g++ gc-dev \
    libc-dev libevent-dev libxml2-dev llvm llvm-dev \
    llvm-libs llvm-static make pcre-dev readline-dev \
    yaml-dev zlib-dev

COPY . .

ADD main.cr /action/main.cr
Add shard.yml /action/shard.yml

RUN cd /action && shards install && crystal build main.cr -o exec --release

CMD ["/bin/bash", "-c", "cd actionProxy && python -u actionproxy.py"]
