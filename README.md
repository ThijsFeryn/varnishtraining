# Varnish training

This repository contains the example code for the 6-hour Varnish training I created.

This is the second iteration of the training course and was first presented at [Symfony Live Berlin 2017](https://feryn.eu/presentations/varnish-in-depth-symfony-live-phantasialand-2018).

The first iteration was last delivered at [VarnishCon 2017](https://feryn.eu/presentations/varnish-training-varnishcon-2016) in Amsterdam and can be found in the v1 branch.

## Depencencies

You'll need [Docker](https://www.docker.com/) to run these examples. All these examples are based on [docker-compose](https://docs.docker.com/compose/). Each example contains a `docker-compose.yml`file.

## Setup

The Docker base boxes are as minimal as possible, you won't need a lot of bandwidth to be *up-and-running*. The Varnish base box is a little bigger than the rest.

If you want to run an example, go through the following steps

1.  Choose an example.
2.  Run `docker-compose up` or `docker-compose up -d` to boot the setup.
3.  Go to http://localhost/ to run the example.
4.  Shut the example containers down using the `docker-compose down` command.

## Varnishlog access

If you want access to the `varnishlog` binary to monitor what's happening run `docker exec -ti sflive-varnish bash` to access the bash shell on the container. You can then run `varnishlog` including all the extra parameters.

If the example contains 2 Varnish instances, run both commands in a separate shell to access the `varnishlog` binary of both Varnish containers:

```
docker exec -ti sflive-varnish bash
docker exec -ti sflive-varnish2 bash
```

## Docker images

The `docker-compose` setup for each example depends on the following container images:

* https://hub.docker.com/r/thijsferyn/nginx/
* https://hub.docker.com/r/thijsferyn/php/
* https://hub.docker.com/r/thijsferyn/varnish/
* https://hub.docker.com/r/thijsferyn/haproxy/

You can go ahead and pull these boxes using the following commands:

```
docker pull thijsferyn/nginx:primary
docker pull thijsferyn/nginx:secondary
docker pull thijsferyn/php:primary
docker pull thijsferyn/php:secondary
docker pull thijsferyn/varnish:base
docker pull thijsferyn/varnish:primary
docker pull thijsferyn/varnish:secondary
docker pull thijsferyn/haproxy:latest
```
