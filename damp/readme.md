# DAMP
- Docker
- Apache
- MySql
- Php

Apache + Php => tanmaysarkar/damp_php:1.0.0

# Information 

# Local

## Start
`docker-compose -f docker-compose.local.yml --env-file local.env --project-name damp up`

## Stop
`docker-compose -f docker-compose.local.yml --env-file local.env --project-name damp down`

## Portainer

Create a new Stack

## Portainer Stack Setup

| Portainer Key     | Value    |
| ----------------- | ------ |
| Repository URL* | https://github.com/sarkartanmay/reusable/ |
| Repository reference* | ref/heads/develop |
| Compose path* | damp/docker-compose.yml |


# Help 
```
docker build -t tanmaysarkar/damp_php:1.0.0 -f Dockerfile.php.local .

docker push tanmaysarkar/damp_php:1.0.0
```
## tanmaysarkar/damp_php

### 1.0.0
- PHP - 7.2-apache 
  - docker-php-ext-install
  - mysqli
  - pdo
  - pdo_mysql
  