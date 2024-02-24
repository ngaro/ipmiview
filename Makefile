NAME = garo/ipmiview
IPMIVIEW_VERSION = 2.21.0_build.221118_bundleJRE_Linux_x64

.PHONY: all build

all: build

build:
	wget https://www.supermicro.com/wdl/utility/IPMIView/Linux/IPMIView_$(IPMIVIEW_VERSION).tar.gz
	tar zxvf IPMIView_$(IPMIVIEW_VERSION).tar.gz
	docker build --build-arg IPMIVIEW_VERSION=$(IPMIVIEW_VERSION) -t $(NAME):latest --rm -f Dockerfile .
	rm -r IPMIView_$(IPMIVIEW_VERSION) IPMIView_$(IPMIVIEW_VERSION).tar.gz
