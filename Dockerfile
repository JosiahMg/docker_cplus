FROM debian:bullseye-slim

#ENV PATH /usr/local/bin:$PATH


RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		build-essential \
		wget \
		cmake \
		libssl-dev \
	; \
	rm -rf /var/lib/apt/lists/*

ENV HOME /root
WORKDIR $HOME

EXPOSE 22
CMD ["bash"]
