#Information 

### tanmaysarkar/damp:1.0.0
PHP - 7.2-apache
MYSQL - 5.7
PhpMyAdmin - 5.2.1


# Local

## Start
`docker-compose -f docker-compose.local.yml --env-file local.env --project-name damp up`

## Stop
`docker-compose -f docker-compose.local.yml --env-file local.env --project-name damp down`


#Help 
```
docker build -t tanmaysarkar/damp_php:1.0.0 -f Dockerfile.php.local .

docker push tanmaysarkar/damp_php:1.0.0
```