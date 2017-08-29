# shadowsocks-go

Current version: 1.2.1


A Dockerfile for building image of [shadowsocks-go](https://github.com/shadowsocks/shadowsocks-go) with its [binary(compiled) files](https://github.com/shadowsocks/shadowsocks-go/releases). 

The image is based on  [Busybox](https://hub.docker.com/_/busybox/) which is extreamly tiny, and using binary files, so the whole image only takes **9.71MB**. 


Quick Start
-----------

Build an image from a Dockerfile:
    
    docker build -t ss .


This image uses ENTRYPOINT to run the containers as an executable:

    docker run -d --name=ss -p 8388:8388 laucyun/ss -p 8388 -k SS_SERVER_PASSWORD -m aes-256-cfb -t 600
    or
    docker run -d --name=ss -p 8388:8388 laucyun/ss -c /opt/shadowsocks/ss.json 


Run a commandline in a running container:

    $ docker exec -it ss bash


You can configure the service to run on a port of your choice. Just make sure the port number given to Docker is the same as the one given to shadowsocks. Also, it is  highly recommended that you store the shadowsocks password in an environment variable as shown above. This way the password will not show in plain text when you run `docker ps`.

For more command line options, refer to the [shadowsocks-go documentation](https://github.com/shadowsocks/shadowsocks-go)