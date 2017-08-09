# compose
Compose files for swarm stacks


Swarm Version:

CFM docker
(efs = on)
connect dns x 4
connect elb 80 443

ssh -NL localhost:2376:/var/run/docker.sock -i /run/secrets/keys/aws/ssh/usc/its-bsa-dev-us-west-2-key-pair.pem docker@ec2-34-210-182-223.us-west-2.compute.amazonaws.com

docker secret create cert-swarm.usc.edu.pem /run/secrets/certificates/usc/swarm.usc.edu/haproxy/cert-swarm.usc.edu.pem
docker secret create cert-emailchoice.usc.edu.pem /run/secrets/certificates/usc/emailchoice.usc.edu/haproxy/cert-emailchoice.usc.edu.pem 
docker secret create cert-workday-account-translator.usc.edu.pem /run/secrets/certificates/usc/workday-account-translator.usc.edu/haproxy/cert-workday-account-translator.usc.edu.pem

docker network create --driver overlay proxy

docker stack deploy --compose-file docker-compose.yml docker-flow-proxy

docker volume create -d "cloudstor:aws" --opt backing=shared wordpress-data

docker stack deploy --compose-file docker-compose.yml wordpress
