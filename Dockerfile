FROM debian:bullseye-slim


RUN set -eux; \
    sed -i s/deb.debian.org/mirrors.aliyun.com/g /etc/apt/sources.list \
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
