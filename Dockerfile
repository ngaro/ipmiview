FROM ubuntu:22.04
MAINTAINER Nikolas Garofil

ARG IPMIVIEW_VERSION

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:0.0

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD IPMIView_${IPMIVIEW_VERSION} /opt/IPMIView

RUN apt-get update && apt-get dist-upgrade -y --no-install-recommends && apt-get install -y --no-install-recommends \
	software-properties-common \
	xvfb \
	x11vnc \
	supervisor \
	fluxbox \
	firefox \
	git && \
	git clone https://github.com/novnc/noVNC.git /opt/noVNC && \
	git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify && \
	apt-get remove --purge -y git && \
	apt-get autoremove -y && \
	apt-get clean && \
	rm -rf /build && \
	rm -rf /tmp/* /var/tmp/* && \
	rm -rf /var/lib/apt/lists/*

EXPOSE 8080

CMD ["/usr/bin/supervisord"]
