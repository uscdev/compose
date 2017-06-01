RexRay Setup

````bash
docker plugin install rexray/ebs EBS_ACCESSKEY=$access EBS_SECRETKEY=$secret

docker run -ti --volume-driver=rexray/ebs -v test:/test busybox

docker volume create --driver rexray/ebs --opt size=20 

docker service create --name busybox2 --mount 'type=volume,target=/test3210,source=test1230,volume-driver=rexray/ebs,volume-opt=size=10' busybox sleep 3600
````
Docs:

https://hub.docker.com/u/rexray/

http://rexray.readthedocs.io

https://github.com/codedellemc/rexray