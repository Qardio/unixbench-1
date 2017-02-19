FROM ubuntu:latest
MAINTAINER Devops Qardio <devops@getqardio.com>
#MAINTAINER Borja Burgos <borja@tutum.co>

# Install Dependencies
RUN apt-get update && \
	apt-get install -y build-essential libx11-dev libgl1-mesa-dev libxext-dev perl perl-modules make git && \
	apt-get clean

RUN git clone https://github.com/Qardio/byte-unixbench.git /tmp/byte-unixbench
RUN mkdir -p /app && mv /tmp/byte-unixbench/UnixBench /app && chmod +x /app/UnixBench/Run
WORKDIR /app/UnixBench

ENTRYPOINT ["/app/UnixBench/Run"]
