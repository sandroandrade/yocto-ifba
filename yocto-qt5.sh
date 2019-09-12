apt-get clean && apt-get update && apt-get install -y locales
locale-gen en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

apt-get -y install gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
     xterm

git clone -b warrior git://git.yoctoproject.org/poky.git ~/poky-warrior
cd ~/poky-warrior
git clone -b warrior git://git.openembedded.org/meta-openembedded
git clone -b warrior https://github.com/meta-qt5/meta-qt5
git clone -b warrior git://git.yoctoproject.org/meta-raspberrypi

mkdir ~/rpi
cd ~/rpi
git clone -b warrior git://github.com/jumpnow/meta-rpi

mkdir -p ~/rpi/build/conf

source ~/poky-warrior/oe-init-build-env ~/rpi/build

cp ~/rpi/meta-rpi/conf/local.conf.sample ~/rpi/build/conf/local.conf
cp ~/rpi/meta-rpi/conf/bblayers.conf.sample ~/rpi/build/conf/bblayers.conf

bitbake qt5-image
