

## docker
```
docker run -d --name sonarqube -p 9000:9000 sonarqube:lts-community

https://localhost:9000/
# login admin/admin
# set new password
```

## docker compose

```
wget https://raw.githubusercontent.com/SonarSource/docker-sonarqube/refs/heads/master/example-compose-files/sq-with-postgres/docker-compose.yml

docker compuse up -d
docker compuse logs -f
```
