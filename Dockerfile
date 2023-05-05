FROM debian:bullseye-slim

ENV HOME /root
WORKDIR $HOME

RUN sed -i s/deb.debian.org/mirrors.aliyun.com/g /etc/apt/sources.list
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone


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

RUN git config --global http.sslverify false  \
    && git config --global https.sslverify false \
    && git clone https://gitee.com/sogou/workflow \
    && cd workflow \
    && make \
    && make install \
    && cd tutorial \
    && make

EXPOSE 8888
CMD ["./workflow/tutorial/helloworld"]
