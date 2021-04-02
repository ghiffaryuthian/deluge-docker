FROM ubuntu:18.04

LABEL maintainer="github/ghiffaryuthian"

ENV HOME /home/user

RUN groupadd -g 1000 user \
	&& useradd -r -u 1000 -g 1000 --create-home --home-dir $HOME user

RUN apt update \
    && apt -y install curl software-properties-common \
    && add-apt-repository ppa:deluge-team/stable \
    && apt update \
    && apt -y install deluged deluge-web

VOLUME /home/user/.config/deluge /Downloads

RUN	chown -R user:user $HOME && \
	chown -R user:user /Downloads

COPY entrypoints.sh /

RUN chmod +x /entrypoints.sh

EXPOSE 58846 58946 58946/udp

CMD [ "/entrypoints.sh" ]