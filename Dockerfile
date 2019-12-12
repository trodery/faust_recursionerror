FROM ubuntu:latest

# Shamelessly stolen from postgres Dockerfile to fix locale crap
RUN set -eux; \
	if [ -f /etc/dpkg/dpkg.cfg.d/docker ]; then \
# if this file exists, we're likely in "debian:xxx-slim", and locales are thus being excluded so we need to remove that exclusion (since we need locales)
		grep -q '/usr/share/locale' /etc/dpkg/dpkg.cfg.d/docker; \
		sed -ri '/\/usr\/share\/locale/d' /etc/dpkg/dpkg.cfg.d/docker; \
		! grep -q '/usr/share/locale' /etc/dpkg/dpkg.cfg.d/docker; \
	fi; \
	apt-get update; apt-get install -y locales; rm -rf /var/lib/apt/lists/*; \
	localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-get update; \
    apt-get -y install \
    apt-utils \
    build-essential \
    python3 python3-pip python3-venv \
    git \
    vim;

RUN git clone https://github.com/robinhood/faust.git;

RUN mkdir /app

ADD . /app

WORKDIR /app

RUN ./setup.sh
