#!/bin/sh

podman build -t openssh-podman .
podman run --replace --detach --name=openssh-podman --hostname openssh-podman --net=host --security-opt label=disable --security-opt seccomp=unconfined --device /dev/fuse:rw -v /var/lib/mycontainer:/var/lib/containers:Z --privileged --cgroupns=host -v /sys/fs/cgroup:/sys/fs/cgroup:rw localhost/openssh-podman:latest /sbin/init
# podman exec -it openssh-podman /bin/bash
