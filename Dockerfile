FROM node:6-alpine
MAINTAINER "Mahesh" "manojv@ilimi.in"
RUN apk update \
    && apk add unzip \
    && apk add curl \
    && adduser -u 1001 -h /home/sunbird/ -D sunbird \
    && apk add --update ca-certificates  \
    && apk add --update ca-certificates openssl
USER sunbird
RUN mkdir -p /home/sunbird/telemetry
WORKDIR /home/sunbird/telemetry
COPY ./telemetry-service.zip  /home/sunbird/telemetry/
RUN unzip /home/sunbird/mw/telemetry-service.zip
WORKDIR /home/sunbird/telemetry/telemetry-service/
CMD ["node", "app.js", "&"]