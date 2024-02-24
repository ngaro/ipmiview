NAME = garo/ipmiview
IPMIVIEW_VERSION = 2.21.0_build.221118_bundleJRE_Linux_x64

.PHONY: all build

all: build

build:
	tar zxvf IPMIView_$(IPMIVIEW_VERSION).tar.gz
	docker-compose build --build-arg IPMIVIEW_VERSION=$(IPMIVIEW_VERSION)
	rm -r IPMIView_$(IPMIVIEW_VERSION)
