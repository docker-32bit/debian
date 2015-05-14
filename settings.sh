### settings
arch=i386
suite=${1:-jessie}
chroot_dir="/var/chroot/$suite"
apt_mirror="http://http.debian.net/debian"
# docker_image="debian:$suite"
docker_image="32bit/debian:$suite"
