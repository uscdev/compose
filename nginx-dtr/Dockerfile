FROM nginx

RUN apt-get update && apt-get dist-upgrade -y
RUN rm /etc/nginx/conf.d/default.conf
COPY etc /etc
