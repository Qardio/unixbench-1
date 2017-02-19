FROM ubuntu:latest
MAINTAINER Dmytro Gorbunov <dmitro.gorbunov@gmail.com>
#MAINTAINER Borja Burgos <borja@tutum.co>

# Install Dependencies
RUN apt-get update && \
	apt-get install -y build-essential perl perl-modules make git && \
	apt-get clean

RUN git clone https://github.com/gdm/byte-unixbench.git /tmp/byte-unixbench
RUN mkdir -p /app && mv /tmp/byte-unixbench/UnixBench /app && chmod +x /app/UnixBench/Run
WORKDIR /app/UnixBench

ENTRYPOINT ["/app/UnixBench/Run"]
