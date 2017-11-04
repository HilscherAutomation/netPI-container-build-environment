## Docker Development Environment

Made for [netPI](https://www.netiot.com/netpi/), the Open Edge Connectivity Ecosystem

### Debian with SSH, Docker and Git as container development environment

The image provided hereunder deploys a container with installed Docker and Git to be used as container development environment.

Base of this image builds a tagged version of [debian:jessie](https://hub.docker.com/r/resin/armv7hf-debian/tags/) with enabled [SSH](https://en.wikipedia.org/wiki/Secure_Shell), a fully featured [Docker environment](https://www.docker.com/) and [Git](https://git-scm.com/) version control system.

#### Container prerequisites

##### Port mapping

For remote login to the container across SSH the container's SSH port `22` needs to be mapped to any free netPI host port.

##### Privileged mode

Only the privileged mode option lifts the enforced container limitations to allow usage of Docker in a container.

#### Getting started

STEP 1. Open netPI's landing page under `https://<netpi's ip address>`.

STEP 2. Click the Docker tile to open the [Portainer.io](http://portainer.io/) Docker management user interface.

STEP 3. Enter the following parameters under **Containers > Add Container**

* **Image**: `hilschernetpi/netpi-container-build-environment`

* **Port mapping**: `Host "22" (any unused one) -> Container "22"` 

* **Restart policy"** : `always`

* **Runtime > Privileged mode** : `On`

STEP 4. Press the button **Actions > Start container**

Pulling the image from Docker Hub may take up to 5 minutes.

#### Accessing

The container starts the SSH service and the Docker daemon automatically. 

Login to it with an SSH client such as [putty](http://www.putty.org/) using netPI's IP address along with the mapped SSH port. Use the credentials `root` as user and `root` as password when asked and you are logged in as root.

Use [Docker CLI](https://docs.docker.com/engine/reference/commandline/docker/) commands as usual.

#### GitHub sources
The image is built from the GitHub project [netPI-container-build-environment](https://github.com/Hilscher/netPI-container-build-environment). It complies with the [Dockerfile](https://docs.docker.com/engine/reference/builder/) method to build a Docker image [automated](https://docs.docker.com/docker-hub/builds/).

To build the container for an ARM CPU on [Docker Hub](https://hub.docker.com/)(x86 based) the Dockerfile uses the method described here [resin.io](https://resin.io/blog/building-arm-containers-on-any-x86-machine-even-dockerhub/).

[![N|Solid](http://www.hilscher.com/fileadmin/templates/doctima_2013/resources/Images/logo_hilscher.png)](http://www.hilscher.com)  Hilscher Gesellschaft fuer Systemautomation mbH  www.hilscher.com
