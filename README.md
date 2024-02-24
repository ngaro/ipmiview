# Docker container for Supermicro® IPMIView

Inspired from [solarkennedy/ipmi-kvm-docker](https://github.com/solarkennedy/ipmi-kvm-docker)

This container runs:

* Xvfb - X11 in a virtual framebuffer
* x11vnc - A VNC server that scrapes the above X11 server
* noNVC - A HTML5 canvas vnc viewer
* Fluxbox - a small window manager

## Usage

```
docker run --rm --name ipmiview -p 8080:8080 garo/ipmiview:latest
```
or if you copied the `docker-compose.yml` file out the repo you can also run 

```
docker-compose -f /path/to/the/docker-compose.yml up
```

After starting it you can open browse to `http://localhost:8080/vnc.html`.
