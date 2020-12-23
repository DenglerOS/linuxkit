# linuxkit

## Build Docker Image

Linuxkit Docker Image with added git remote build context. Instead of `git clone <REPO>` and the local path of the repo just use the following syntax 
```
<GIT_PKG_REPO>#<PKG_REPO_BRANCH>/[PKG_REPO_SUBDIR]
```

Build Docker image with remote context.

```
docker build -t crunos/linuxkit https://github.com/crunos/linuxkit.git#main
```

## Usage

Run linuxkit in current directory. Default CMD is `--help`, some actions require additional `docker` (alpine compatible) binary or `qemu` / `qemu-img` (`run qemu [...]`).
```
docker run --rm -ti -v $(pwd):$(pwd) -w $(pwd) -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker crunos/linuxkit 
```
