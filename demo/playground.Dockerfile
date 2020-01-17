FROM alpine:latest

COPY ./redis-counter.sh .
COPY ./wait-for-redis.sh .

RUN apk --no-cache add curl bind-tools bash redis
