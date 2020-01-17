FROM alpine:latest

COPY ./redis-counter.sh bin/redis-counter.sh

RUN apk --no-cache add curl bind-tools bash redis
