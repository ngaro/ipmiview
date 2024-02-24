FROM ubuntu:22.04
MAINTAINER Nikolas Garofil

ARG IPMIVIEW_VERSION

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:0.0

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN apt-get update && apt-get dist-upgrade -y --no-install-recommends && \
	apt-get install -y --no-install-recommends software-properties-common xvfb x11vnc supervisor fluxbox firefox curl novnc && \
	cd /opt && \
	curl -O https://www.supermicro.com/wdl/utility/IPMIView/Linux/IPMIView_${IPMIVIEW_VERSION}.tar.gz && \
	tar -zxvf IPMIView_${IPMIVIEW_VERSION}.tar.gz && rm IPMIView_${IPMIVIEW_VERSION}.tar.gz && mv IPMIView_${IPMIVIEW_VERSION} IPMIView && \
	apt-get remove --purge -y curl && \
	apt-get autoremove -y && apt-get clean && rm -rf /build && rm -rf /tmp/* /var/tmp/* && rm -rf /var/lib/apt/lists/*

EXPOSE 8080

CMD ["/usr/bin/supervisord"]
