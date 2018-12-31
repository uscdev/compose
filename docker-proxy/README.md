# Supported tags and respective `Dockerfile` links

- Thanks nicholasdille/docker-auth-proxy

# Purpose

This container image launches nginx as a reverse proxy. It listens on port 2376/tcp and forwards requests to the local Docker daemon socker `/var/run/docker.sock`. It does not support insecure connections on 2375/tcp.

# Usage

The reverse proxy listens on port 2376/tcp using TLS. All requests are forwarded to the Docker daemon socket which must be mapped:

```bash
Use the compose file.
```

The certificates must be created manually before starting the reverse proxy. Please refer to the official documentation how to [protect the Docker daemon socket](https://docs.docker.com/engine/security/https/).

The certificates must be installed as secrets:

## `ca.pem`

... must contain the PEM formatted certificate for the certificate authority

## `server-key.pem`

... must contain the PEM formatted private key for the server certificate

## `server-cert.pem`

... must contain the PEM formatted server certificate