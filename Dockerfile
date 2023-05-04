FROM debian:bullseye-slim

RUN sed -i s/deb.debian.org/mirrors.aliyun.com/g /etc/apt/sources.list

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		build-essential \
		wget \
		cmake \
		libssl-dev \
        libworkflow-dev \
	; \
	rm -rf /var/lib/apt/lists/*

ENV HOME /root
WORKDIR $HOME

EXPOSE 22
CMD ["bash"]
