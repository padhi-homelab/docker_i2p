# docker_i2p <a href='https://github.com/padhi-homelab/docker_i2p/actions?query=workflow%3A%22Docker+CI+Release%22'><img align='right' src='https://img.shields.io/github/workflow/status/padhi-homelab/docker_i2p/Docker%20CI%20Release?logo=github&logoWidth=24&style=flat-square'></img></a>

<a href='https://hub.docker.com/r/padhihomelab/i2p'><img src='https://img.shields.io/docker/image-size/padhihomelab/i2p/latest?label=size%20%5Blatest%5D&logo=docker&logoWidth=24&style=for-the-badge'></img></a>
<a href='https://hub.docker.com/r/padhihomelab/i2p'><img src='https://img.shields.io/docker/image-size/padhihomelab/i2p/testing?label=size%20%5Btesting%5D&logo=docker&logoWidth=24&style=for-the-badge'></img></a>

A multiarch [i2p] Docker image, based on [Alpine Linux].

|           386            |       amd64        |          arm/v6          |          arm/v7          |       arm64        |         ppc64le          |          s390x           |
| :----------------------: | :----------------: | :----------------------: | :----------------------: | :----------------: | :----------------------: | :----------------------: |
| :heavy_multiplication_x: | :heavy_check_mark: | :heavy_multiplication_x: | :heavy_multiplication_x: | :heavy_check_mark: | :heavy_multiplication_x: | :heavy_multiplication_x: |


## Usage

```
docker run \
    -e JVM_XMX=256m \
    -v /my/path/to/i2phome:/i2p/.i2p \
    -v /my/path/to/i2ptorrents:/i2psnark \
    -p 4444:4444 \        # HTTP proxy
    -p 6668:6668 \        # IRC proxy
    -p 7657:7657 \        # Router console
    -p 54321:12345 \      # I2NP needs TCP & UDP.
    -p 54321:12345/udp \  # I2NP needs TCP & UDP.
    padhihomelab/i2p
```

Runs `i2p` server and only exposes the ports above.

_<More details to be added soon>_



[Alpine Linux]:  https://alpinelinux.org/
[i2p]:           https://geti2p.net/en/
