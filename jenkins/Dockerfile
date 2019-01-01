# Create Jenkins image with USC plugins and utilities such as docker

FROM jenkins/jenkins

USER root
RUN apt-get update && apt-get -y upgrade
RUN mv /etc/localtime /etc/localtime-old && ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
USER jenkins

RUN /usr/local/bin/install-plugins.sh \
mailer cloudbees-folder timestamper \
ldap subversion \
dependency-check-jenkins-plugin git-client git \
github-branch-source github-organization-folder ssh-slaves pam-auth \
ws-cleanup ant credentials-binding gradle \
build-timeout \
docker-build-publish docker-custom-build-environment google-play-android-publisher \
docker-traceability \
docker-workflow \
docker-plugin docker-build-step saml \
file-operations nexus-artifact-uploader \
job-dsl simple-theme \
email-ext \
matrix-auth matrix-project antisamy-markup-formatter script-security \
pipeline-utility-steps \
pipeline-model-definition \
pipeline-stage-view \
config-file-provider \
workflow-aggregator \
publish-over-ssh \
swarm \
amazon-ecr \
jquery \
envinject

USER root
RUN apt-get install -y --no-install-recommends \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add - && \
add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
       $(lsb_release -cs) \
       stable" && \
apt-get update && apt-get -y install docker-ce
RUN usermod -aG docker jenkins

USER jenkins
