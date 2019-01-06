# hello-world
Docker Flow Proxy Example

This dockerfile builds an automatic reverse-proxy

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
