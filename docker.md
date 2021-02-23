# Docker

* [Install Docker on Windows and MacOS](#install-docker-on-windows-and-macos)
* [Install Docker on Ubuntu Linux](#install-docker-on-ubuntu-linux)
* [Basic Docker Commands](#basic-docker-commands)
  

## Install Docker on Windows and MacOS
On Windows and MacOS you can use [Docker for Desktop][DockerDesktop].

## Install Docker on Ubuntu Linux
On Ubuntu follow the steps below which are also summarized in [this script](scripts/docker.sh).
```
sudo apt update
sudo apt install docker.io
```

Start Docker:
```
$ sudo systemctl start docker
```

Test Docker with `sudo`:
```
$ sudo docker run hello-world
Hello from Docker!
This message shows that your installation appears to be working correctly.
```

Prepare Docker to work to work without root:
```
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```
Run *hello-world* without `sudo`.
```
$ docker run hello-world
Hello from Docker!
This message shows that your installation appears to be working correctly.
```
And reboot the virtual machine to ensure that the permissions are fixed.


# Basic Docker Commands

Let's keep the house in order.
* [Purge All = Totally brutal approach](#purge-all)
* [Removing Images](#removing-docker-images)
* [Removing Containers](#removing-docker-containers)


## Purge All

* Purging All Unused or Dangling Images, Containers, Volumes, and Networks
```
docker system prune
```
* To additionally remove any stopped containers and all unused images (not just dangling images), add the -a flag to the command:
```
docker system prune -a
```

## Removing Docker Images

### Removing one or more Docker Images

* Remove all images
* List:
```
docker images -a
```
* Remove all:
```
docker rmi $(docker images -a -q)
```

* Remove individual by name:
```
docker rmi Image Image
```

* List certain images only:
```
docker images -a |  grep "pattern"
```

* Remove these images:
```
docker images -a | grep "pattern" | awk '{print $3}' | xargs docker rmi
```

## Removing Docker Containers

### Removing one or more Docker Containers

* List:
```
docker ps -a
```

* Remove all:
```
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
```

* Remove individual containers:
```
docker rm ID_or_Name ID_or_Name
```


### Remove all exited containers

* List:
```
docker ps -a -f status=exited
```

* Remove:
```
docker rm $(docker ps -a -f status=exited -q)
```


### Remove containers according to a pattern

* List:
```
docker ps -a |  grep "pattern”
```

* Remove:
```
docker ps -a | grep "pattern" | awk '{print $1}' | xargs docker rm
```

---
More: https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes




[DockerDesktop]: https://www.docker.com/products/docker-desktop
