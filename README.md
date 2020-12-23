# linuxkit

Linuxkit Docker Image with added git remote build context. 

## Build Docker Image

Build Docker image with remote context.
```
docker build -t crunos/linuxkit https://github.com/crunos/linuxkit.git#main
```

## Usage

Run linuxkit in current directory. Default CMD is `--help`, some actions require additional `docker` (alpine compatible) binary or `qemu` / `qemu-img` (`run qemu [...]`).
```
docker run --rm -ti -v $(pwd):$(pwd) -w $(pwd) -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker crunos/linuxkit 
```

Instead of first `git clone <REPO>` and use the local path of the repo for linuxkit command just use the following syntax.
```
<GIT_PKG_REPO>#<PKG_REPO_BRANCH>/[PKG_REPO_SUBDIR]
```
"/" for repo root path is needed!
