FROM nginx:stable-alpine

# RUN apt-get remove docker docker-engine docker.io &&
#RUN apt-get update && apt-get upgrade
#RUN apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
#RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
#RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
#RUN apt-get update
#RUN apt-get install -y docker-ce

# RUN groupadd docker
# RUN $ sudo usermod -aG docker $USER
# RUN chmod a+rw /var/run/docker.sock
RUN rm /etc/nginx/conf.d/default.conf
COPY etc /etc

EXPOSE 2376
