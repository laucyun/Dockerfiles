 To build:

 	$ cd /path/mysql
    $ docker build -t centos6/mysql:5.5 .


 To run:

    $ docker run -d -it --name mysql -e MYSQL_ROOT_PASSWORD=123qwe -p 3306:3306 centos6/mysql:5.5


 To export:

    $ sudo docker export mysql > mysql5.5.tar.gz
    $ md5sum mysql5.5.tar.gz > mysql5.5.tar.gz.sums && sha1sum mysql5.5.tar.gz >> mysql5.5.tar.gz.sums


 To import:

    $ cat mysql5.5.tar.gz | sudo docker import - centos6/mysql:5.5
    $ docker run -d -t -i --name mysql -p 3306:3306 centos6/mysql:5.5
    

 Run a command in a running container:

    $ docker exec -it mysql bash