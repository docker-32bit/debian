#!/bin/bash -x
### Upgrade a docker image for debian i386.

. settings.sh

chroot $chroot_dir apt-get update
chroot $chroot_dir apt-get upgrade -y

### cleanup
chroot $chroot_dir apt-get autoclean
chroot $chroot_dir apt-get clean
chroot $chroot_dir apt-get autoremove

### create a tar archive from the chroot directory
tar cfz debian.tgz -C $chroot_dir .

### import this tar archive into a docker image:
cat debian.tgz | docker import - $docker_image

# ### push image to Docker Hub
# docker push $docker_image

# ### cleanup
# rm debian.tgz
# rm -rf $chroot_dir
