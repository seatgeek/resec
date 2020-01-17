FROM alpine:latest

RUN apk --no-cache add curl bind-tools bash redis
