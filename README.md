# linuxkit

Linuxkit Docker Image with added git remote build context. 

## Build Docker Image

Build Docker image with remote context.
```
docker build -t crunos/linuxkit https://github.com/crunos/linuxkit.git#main
```

## Usage

Run linuxkit in current directory. Default CMD is `--help`
```
docker run --rm -ti -v $(pwd):$(pwd) -w $(pwd) -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker crunos/linuxkit 
```

Build actions require additional `docker` (alpine compatible) binary inside of the linuxkit container. 
```
docker run --rm -ti -v $(pwd):$(pwd) -w $(pwd) -v $(which docker):/usr/bin/docker -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker crunos/linuxkit 
```
Get static binaries of host binary isn't compatible: https://download.docker.com/mac/static/stable

Instead of first `git clone <REPO>` and use the local path of the repo for linuxkit command just use the following syntax.
```
<GIT_PKG_REPO>#<PKG_REPO_BRANCH>/[PKG_REPO_SUBDIR]
```
"/" for repo root path is needed!

# Run CrunOS build

To run CrunOS build inside of a qemu vm additional qemu / qemu img is needed! 
Instead of `linuxkit run [qemu]` you can use a qemu(-kvm) container with https://github.com/crunos/qemu
