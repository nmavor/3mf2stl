FROM ubuntu:20.04
RUN apt update
RUN apt install libzip-dev build-essential unzip zip -y
COPY * 3mf3stl/
WORKDIR /3mf3stl
RUN make && cp convert_to_stl.sh /sbin && cp 3mf2stl /sbin
RUN mv convert_to_stl_docker.sh convert_to_stl.sh
ENTRYPOINT ["/sbin/convert_to_stl.sh"]
