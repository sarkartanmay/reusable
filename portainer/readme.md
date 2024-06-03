# Linux VM (Ubuntu 20) with Docker
## Linux VM Connection from Windows Machine
- Download the pem file (key1.pem)
- open power shell on the location 
- Run the following command 
```
icacls.exe .\key1.pem /reset
icacls.exe .\key1.pem /grant:r "$($env:username):(r)"
icacls.exe .\key1.pem /inheritance:r
```
- Now connect the server 
```
ssh -i key1.pem <USER_NAME>@<SERVER_ADDR>
```
or
```
ssh -i key1.pem <USER_NAME>@<SERVER_ADDR> -p <PORT>
```
## Docker setup
```
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get updatesudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null  

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo apt-get update

sudo docker -v
```

### Help Url
https://docs.docker.com/engine/install/ubuntu/

## Portainer Setup
```
curl -L https://raw.githubusercontent.com/sarkartanmay/reusable/develop/portainer/docker-compose.portainer.yml \
    -o docker-compose.portainer.yml  

sudo docker swarm init
sudo docker stack deploy --compose-file=docker-compose.portainer.yml portainer
```
### Sample Output

`docker swarm join --token SWMTKN-1-0ihm9c23ajrsonekholocopy0e06pu6e28o0ndlrev0rcbc03-8b74rvvxhcbn7yplsmf27in0b 192.168.65.3:2377`

- Validte the swarm using 
```
docker stack ls
```
### Alternate 
```
sudo docker volume create portainer_data
sudo docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
```
### Portainer Idle Issue
Run 
```
sudo docker stack deploy --compose-file=docker-compose.portainer.yml portainer
```
and get service name 
```
sudo docker service update --force <service_name>
```

# Docker Swarm Remove
- `docker stack rm portainer`