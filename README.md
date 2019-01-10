## init

init docker swarm

```
docker swarm init
```

edit `/etc/hosts` file to add:

```
127.0.0.1   portainer.traefik django1.traefik django2.traefik postgres.traefik
```

generate SSL certificate files:

```
chmod +x util/generate-ssl-certificates.sh
./util/generate-ssl-certificates.sh 
mkdir config/traefik/certificates/
mv traefik.crt config/traefik/certificates/
mv traefik.key config/traefik/certificates/
```

update the file permission:

```
chmod +x app/entrypoint.sh
```

update the SECRET_KEY in django-stack.yml

## build

```
docker build ./app -t futoshita/django
```

## start

```
docker stack deploy -c django-stack.yml mystack
```

## use

Traefik dashboard: http://127.0.0.1:8080/dashboard/

https://portainer.traefik

https://django1.traefik

https://django2.traefik

## stop

```
docker stack rm mystack
```

## resources

https://www.melvinvivas.com/docker-stack-sample-with-traefik/

https://www.bardina.net/traefik-gitlab-docker/

https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/