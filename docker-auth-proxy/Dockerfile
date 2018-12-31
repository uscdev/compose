FROM nginx:stable-alpine

RUN apk update && apk upgrade
RUN rm /etc/nginx/conf.d/default.conf
COPY etc/nginx/conf.d /etc/nginx/conf.d

EXPOSE 2376
