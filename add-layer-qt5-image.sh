git clone -b morty git://git.yoctoproject.org/poky
git clone -b morty git://git.openembedded.org/meta-openembedded
git clone -b morty git://git.yoctoproject.org/meta-raspberrypi
git clone -b morty https://github.com/meta-qt5/meta-qt5.git

mkdir build
source poky/oe-init-build-env build

devtoll add meta-mylayer git clone -b https://github.com/GomesWesley/meta-mylayer.git
bitbake qt5-image
