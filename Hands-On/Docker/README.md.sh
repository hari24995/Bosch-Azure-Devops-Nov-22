# Setup Docker
#sudo apt-get remove -y docker docker-ce-cli docker-ce docker-engine docker.io containerd runc
#curl -fsSL get.docker.com -o get-docker.sh
#sh get-docker.sh
#sudo usermod -aG docker $USER

# Now should logout and login again
docker version

USER_SUFFIX=${USER: -2}
echo $USER_SUFFIX

# Creating and Using Containers
## Starting a Nginx Web Server
docker container run --publish 81$USER_SUFFIX:80 --detach --name webhost$USER_SUFFIX nginx
curl localhost:81$USER_SUFFIX
docker container ls
docker container stop webhost$USER_SUFFIX
docker container ls
docker container ls -a
docker container logs webhost$USER_SUFFIX
docker container rm webhost$USER_SUFFIX
docker container ls -a

## Getting a Shell Inside Containers - Open Terminal
docker container run -itd --name ubuntu$USER_SUFFIX ubuntu
docker container ls
docker container exec -it ubuntu$USER_SUFFIX bash

## --- Run some commands in container now
exit

docker container ls
docker container stop ubuntu$USER_SUFFIX
docker container rm ubuntu$USER_SUFFIX
docker container ls -a
