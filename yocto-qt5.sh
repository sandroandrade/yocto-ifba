apt-get clean && apt-get update && apt-get install -y locales
locale-gen en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

apt-get -y install gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
     xterm

mkdir yoctoproject
cd yoctoproject

git clone -b morty git://git.yoctoproject.org/poky
git clone -b morty git://git.openembedded.org/meta-openembedded
git clone -b morty git://git.yoctoproject.org/meta-raspberrypi
git clone -b morty https://github.com/meta-qt5/meta-qt5.git
git clone https://github.com/GomesWesley/meta-mylayer.git

mv -f ~/yoctoproject/meta-mylayer/build/ ~/yoctoproject/
source poky/oe-init-build-env build
echo | bitbake qt5-image
