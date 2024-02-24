NAME = garo/ipmiview

.PHONY: all build

all: build

build:
	wget https://www.supermicro.com/wdl/utility/IPMIView/Linux/IPMIView_2.18.0_build.201007_bundleJRE_Linux_x64.tar.gz
	tar zxvf IPMIView_2.18.0_build.201007_bundleJRE_Linux_x64.tar.gz
	docker build -t $(NAME):latest --rm -f Dockerfile .
	rm -r IPMIView_2.18.0_build.201007_bundleJRE_Linux_x64 IPMIView_2.18.0_build.201007_bundleJRE_Linux_x64.tar.gz
