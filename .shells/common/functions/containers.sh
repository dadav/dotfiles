
# Remove stopped containers and unreferenced images
function f_docker_clean() {
  docker ps -qa -f status=exited | xargs -r docker rm
  docker system prune -a
}

# Remove stopped containers and unreferenced images
function f_podman_clean() {
  podman ps -qa -f status=exited | xargs -r podman rm
  podman system prune -a
}
