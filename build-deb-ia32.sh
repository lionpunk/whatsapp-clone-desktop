#!/bin/sh

npm install
npm run build:linux32

BUILD_DIR="./build/whatsapp-desktop-ia32"

rm -R $BUILD_DIR
mkdir -p $BUILD_DIR/DEBIAN
cp build/debian/* $BUILD_DIR/DEBIAN
mkdir -p $BUILD_DIR/opt/whatsapp-desktop/
mkdir -p $BUILD_DIR/usr/share/applications/
mkdir -p $BUILD_DIR/usr/share/icons/hicolor/128x128/apps/
mkdir -p $BUILD_DIR/usr/share/icons/hicolor/64x64/apps/
cp "app/assets/icon/icon@2x.png" $BUILD_DIR/usr/share/icons/hicolor/128x128/apps/whatsapp.png
cp "app/assets/icon/icon.png" $BUILD_DIR/usr/share/icons/hicolor/64x64/apps/whatsapp.png
cp whatsappdesktop.desktop $BUILD_DIR/usr/share/applications/
cp -r dist/WhatsApp-linux-ia32/* $BUILD_DIR/opt/whatsapp-desktop/
dpkg-deb --build $BUILD_DIR
