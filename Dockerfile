FROM debian:bullseye-slim

ENV HOME /root
WORKDIR $HOME

RUN sed -i s/deb.debian.org/mirrors.aliyun.com/g /etc/apt/sources.list

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		build-essential \
		wget \
		cmake \
		libssl-dev \
        git \
        vim \
        curl \
	; \
	rm -rf /var/lib/apt/lists/*

RUN git clone https://gitee.com/sogou/workflow \
    && cd workflow \
    && make \
    && cd tutorial \
    && make

EXPOSE 8888
CMD ["./workflow/tutorial/helloworld"]
