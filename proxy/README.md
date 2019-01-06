# nginx-auto-proxy
Docker Flow Proxy

This dockerfile builds an automatic reverse-proxy

See the documentation at (http://proxy.dockerflow.com)

Check out the hello-world program for a configuration example:
````bash
version: '3.7'

services:
  helloworld:
    image: tutum/hello-world
    networks:
      - proxy
    deploy:
      replicas: 2
      labels:
        - com.df.notify=true
        - com.df.distribute=true
        - com.df.serviceDomain=hello-world.${DOMAIN_NAME:-docker.usc.edu}
        - com.df.port=80
networks:
  proxy:
    external: true

````

Note the back-end network.

Here are some of the more common settings:
````bash
        - com.df.reqMode=tcp # TCP proxy
        - com.df.srcPort=8080 # Source port
        - com.df.httpsOnly=true # Redirect to https
        - com.df.port=443 # If https on the backend
        - com.df.sslVerifyNone=true # If https on the backend
        - com.df.xForwardedProto # If http on the backend AND redirect to https
````

Thanks to the author, Viktor Farcic!

Note: If you use a shib back-end, you cannot run
more than 1 docker proxy containers.