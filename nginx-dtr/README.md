# nginx-auto-proxy
Auto Reverse Proxy

This dockerfile builds an automatic nginx reverse-proxy

Currently this proxy redirects as follows:

jenkins.* -> port 8080
nexus.* -> port 8081
wordpress.* -> port 8083
mobile.* -> port 8084
