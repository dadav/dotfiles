#!/bin/bash

del_if_stopped() {
  container=$1
  shift
  docker ps -aq -f status=exited -f name="$container" | xargs docker rm &>/dev/null
}

docker_clean() {
  docker ps -qa -f status=exited | xargs -r docker rm
  docker images -q --filter "dangling=true" | xargs -r docker rmi
}

# https://github.com/docker/docker/issues/20399
docker_imagelayers() {
  [[ "$#" -lt 1 ]] && {
    echo You need to supply an image tag/id
    return
  }
  docker images -q $1 | docker inspect --format "{{range .RootFS.Layers}}{{.}} {end}}" | sort -u
}

osc() {
  ID=$(id -u)
  IMAGE=osc:latest
  # we need to escape ':'
  BUILD_DIR="$(pwd | sed -e 's|:|\\:|')"

  docker run -t -i --rm \
    --volume "${HOME}/.oscrc":/home/build/.oscrc \
    --volume "$BUILD_DIR":/build \
    --env ID=$ID \
    --env "PARAMS=$*" \
    "$IMAGE" \
    bash -c "/entrypoint.sh"
}

dnsmasq() {
  IMAGE=andyshinn/dnsmasq:2.76
  del_if_stopped dnsmasq
  docker run -d --name dnsmasq -p 53:53/tcp -p 53:53/udp --cap-add=NET_ADMIN $IMAGE $@
}


nginx() {
  IMAGE=nginx:latest
  VOLUME=${1:-$(pwd)}
  PROFILE=${2:-fileserver}
  del_if_stopped nginx
  docker run --name nginx \
    -p 80:80 \
    -v "${HOME}/docker/nginx/${PROFILE}.conf":/etc/nginx/conf.d/custom.conf \
    -v "$VOLUME":/usr/share/nginx/html:ro \
    -d nginx
}

dockerlint() {
  IMAGE=redcoolbeans/dockerlint
  docker run -it --rm -v "$PWD/Dockerfile":/Dockerfile:ro $IMAGE
}

# Select a docker container to start and attach to
function da() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}

# Select a running docker container to stop
function ds() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}

# start etherpad
etherpad() {
  PASS=password
  PORT=9001
  docker inspect ep_network &>/dev/null || docker network create ep_network
  docker run --rm -d --network ep_network -e MYSQL_ROOT_PASSWORD=$PASS --name ep_mysql mysql mysqld --default-authentication-plugin=mysql_native_password
  docker run --rm -d --network ep_network -e ETHERPAD_DB_HOST=ep_mysql -e ETHERPAD_DB_PASSWORD=$PASS -p $PORT:9001 tvelocity/etherpad-lite
}
