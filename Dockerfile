FROM debian:jessie


#RUN apt-get update && \
#    apt-get install -y build-essential && \
#	apt-get install -y postgresql-common && \
#	rm -rf /var/lib/apt/lists/*


ENV HOME /root
WORKDIR $HOME

EXPOSE 22
CMD ["bash"]
