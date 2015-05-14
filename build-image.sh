#!/bin/bash -x
### Build a docker image for debian i386.

. settings.sh

### make sure that the required tools are installed
apt-get install -y docker.io debootstrap dchroot

### install a minbase system with debootstrap
export DEBIAN_FRONTEND=noninteractive
debootstrap --arch $arch $suite $chroot_dir $apt_mirror

cat $chroot_dir/etc/apt/sources.list

### update the list of package sources
cat <<EOF > $chroot_dir/etc/apt/sources.list
deb $apt_mirror $suite main
deb $apt_mirror $suite-updates main
deb http://security.debian.org/ $suite/updates main
EOF

./upgrade-image.sh
