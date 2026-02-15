#!/bin/sh
echo dupa dupa dupa dupa dupa dupa dupa > /dev/kmsg
/bin/mount -t sysfs sysfs /sys > /dev/kmsg 2>&1
/bin/mount -t securityfs securityfs /sys/kernel/security > /dev/kmsg 2>&1
/bin/mount -t proc proc /proc > /dev/kmsg 2>&1
/bin/mount -t tmpfs tmpfs /tmp > /dev/kmsg 2>&1
/bin/mount -t tmpfs tmpfs /run > /dev/kmsg 2>&1
mkdir /run/lock >/dev/kmsg 2>&1
/bin/mount -t tmpfs tmpfs /run/lock > /dev/kmsg 2>&1
/bin/mount -t devtmpfs -o mode=0755 devtmpfs /dev > /dev/kmsg 2>&1
mkdir /dev/pts > /dev/kmsg 2>&1
mkdir /dev/shm > /dev/kmsg 2>&1
/bin/mount -t tmpfs -o mode=01777 tmpfs /dev/shm > /dev/kmsg 2>&1
mnt() {
	/bin/mount -t "$@" >/dev/kmsg 2>&1
	}
mnt cgroup2 -o nsdelegate,memory_recursiveprot cgroup2 /sys/fs/cgroup ||
mnt cgroup2 -o nsdelegate cgroup2 /sys/fs/cgroup ||
mnt cgroup2 cgroup2 /sys/fs/cgroup ||
mnt tmpfs tmpfs /sys/fs/cgroup
mnt devpts -o mode=0620,gid=5 devpts /dev/pts
mnt cgroup2 -o nsdelegate cgroup2 /sys/fs/cgroup/unified ||
mnt cgroup2 cgroup2 /sys/fs/cgroup/unified
mnt cgroup -o none,name=systemd,xattr cgroup /sys/fs/cgroup/systemd || 
mnt cgroup -o none,name=systemd cgroup /sys/fs/cgroup/systemd 
mnt pstore pstore /sys/fs/pstore
mnt bpf -o mode=0700 bpf /sys/fs/bpf
#/bin/sed s/^/'verbose debug'/ /proc/cmdline > /etc/cmdline
#mount --bind /etc/cmdline /proc/cmdline
#echo zqpa zqpa zqpa zqpa zqpa zqpa zqpa > /dev/kmsg
#exec /usr/lib/systemd/systemd --log-level=debug
#/bin/mount -t proc proc /media
#while :; do /bin/cp /media/self/mounts /dev/kmsg; done &
#( strace -fp 1 -o /dev/kmsg & ) &
#sleep 0.5
exec /lib/systemd/systemd --log-level=debug "$@"
(sleep 3 && sync /) >/dev/kmsg 2>&1 &
exec /bin/strace -DDD -o /strace /lib/systemd/systemd --log-level=debug "$@"
