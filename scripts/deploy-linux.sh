#!/bin/sh

# Run make install
make install DESTDIR=appdir
cp /usr/bin/ffmpeg ./appdir/usr/bin/

# Create appimage
export VERSION=${TRAVIS_TAG#v}

curl -Lo linuxdeployqt.AppImage "https://github.com/probonopd/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage"
chmod a+x linuxdeployqt.AppImage
./linuxdeployqt.AppImage appdir/usr/share/applications/*.desktop -appimage -qmldir=src/qml/ -executable=appdir/usr/bin/ffmpeg -executable=appdir/usr/bin/moonplayer-hlsdl -exclude-libs=libdbus-1.so.3
