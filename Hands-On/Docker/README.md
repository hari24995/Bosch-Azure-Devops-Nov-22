# Setup Docker
```
#sudo apt-get remove -y docker docker-ce-cli docker-ce docker-engine docker.io containerd runc
```
```
#curl -fsSL get.docker.com -o get-docker.sh
```
```
#sh get-docker.sh
```
```
#sudo usermod -aG docker $USER
```

- Now should logout and login again
```
docker version
```

# Creating and Using Containers
## Starting a Nginx Web Server
```
docker container run --publish 81:80 --detach nginx
```
```
curl localhost:81
```
```
docker container ls
```
```
docker container stop 690
```
```
docker container ls
```
```
docker container ls -a
```
```
docker container run --publish 82:80 --detach --name webhost nginx
```
```
curl localhost:82
```
```
docker container ls -a
```
```
docker container logs webhost
```
```
docker container rm 63f 690 ode
```
```
docker container ls -a
```
## Getting a Shell Inside Containers - Open Terminal
```
docker container run -it --name proxy nginx bash
```
```
docker container ls
```
```
docker container ls -a
```
```
docker container run -it --name ubuntu ubuntu
```
```
exit
```

```
docker container ls
```
```
docker container ls -a
```
```
docker container start -ai ubuntu
```
```
exit
```
```
docker container exec -it mysql bash
```
```
exit
```

```
docker container ls
```
```
docker pull alpine
```
```
docker image ls
```
```
docker container run -it alpine sh
```
```
exit
```

