# This enables root to run X server - the linux window system
xhost local:root

# Generate folder for persistent data
mkdir -p `pwd`/persistent_data/genymotion/.Genymobile
chown -R root:root `pwd`/persistent_data/*

# Run the container to extract files from
docker run -d \
    --privileged \
    --net=host \
    -e DISPLAY=unix$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v `pwd`/persistent_data/genymotion:/root/ \
    --name dkms \
    matthewhartstonge/genymotion

# Copy the vbox driver and libs from the named dkms container
docker cp dkms:/usr/lib/virtualbox/vboxdrv.sh .
docker cp dkms:/usr/share/virtualbox /usr/share

# Ensure you have the kernel sources available and built, for example:
#  zypper in kernel-source kernel-default-devel
#  ln -s /usr/src/linux-* /usr/src/linux
#  cd /usr/src/linux
#  make oldconfig prepare scripts

# Install the DKMS modules on the host
./vboxdrv.sh setup

# Remove libs and build script
rm vboxdrv.sh
rm -rf /usr/share/virtualbox

# Kill off and cleanup unneeded container
docker kill dkms
docker rm dkms
