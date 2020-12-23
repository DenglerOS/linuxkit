# linuxkit

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
