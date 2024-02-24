# Docker container for Supermicro® IPMIView

Inspired from [solarkennedy/ipmi-kvm-docker](https://github.com/solarkennedy/ipmi-kvm-docker)

This container runs:

* Xvfb - X11 in a virtual framebuffer
* x11vnc - A VNC server that scrapes the above X11 server
* noNVC - A HTML5 canvas vnc viewer

## Usage
2 options for starting it
* `docker run --rm --name ipmiview -p 8080:8080 garo/ipmiview:latest`
* `docker-compose -f /path/to/the/docker-compose.yml up` if you copied the docker-compose.yml from this repo

And now browse to http://localhost:8080/vnc.html (Replacing `localhost` for remote usage is possible)
