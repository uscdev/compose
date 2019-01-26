FROM nginx:stable-alpine

RUN apk update && apk upgrade && apk add shadow
RUN groupadd --gid 50 docker && usermod -aG docker nginx

RUN rm /etc/nginx/conf.d/default.conf
COPY etc /etc

EXPOSE 2376
