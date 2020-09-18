# WhatsApp Desktop clone

![screenshot](http://i1-win.softpedia-static.com/screenshots/WhatsApp-Desktop_1.png "Main Window")

Unofficial WhatsApp Desktop Client for OSX, Linux and Windows. Build with [Electron](http://electron.atom.io/).  

This is **NOT** an official product. This project does not attempt to reverse engineer the WhatsApp API or attempt to reimplement any part of the WhatsApp client. Any communication between the user and WhatsApp servers is handled by official WhatsApp Web itself; this is just a native wrapper for WhatsApp Web, like a browser.



## Features

* Cross platform (OSX, Windows x64, Linux ia32/x64 and ARM v7l)
* Native notifications
* System tray icon
* Open links in browser
* Badge with the number of notifications in the dock/taskbar
* Dock icon bounces when a new message is received
* Focus on contact search input via CMD+F (WIN+F)
* Phone info window (s/w versions, battery status, etc)
* Auto-launch on login
* Start minimized to tray icon
* Logging system (log to console and *userData*/log.log)
* Apply custom CSS stylesheet
* Auto-hide menu bar (Windows, Linux)
* Disabling GPU rendering (useful when dealing with bugged video drivers)
* A couple of things can be configured:
  * Toggle avatar visibility
  * Toggle preview of the messages visibility
  * Set the size for the media thumbs
  * Proxy settings connect to WhatsApp web

## Install

Follow these instructions to install `whatsapp-desktop` on your system.

### Install NPM and Yarn

You need NPM and Yarn to be installed on your system before building deb package.

* NPM  : https://nodejs.org/en/download/package-manager/
* Yarn : https://yarnpkg.com/lang/en/docs/install/

### Build Debian deb 32/64bits packages

You can build `whatsapp-desktop.deb` package with:

```sh
git clone https://github.com/oOthkOo/whatsapp-desktop.git
cd whatsapp-desktop
./build-deb-x64.sh # or ./build-deb-ia32.sh for 32 bits
```

### Install Whatsapp on Debian, Ubuntu, Mint, ...

```sh
sudo dpkg -i ./build/whatsapp-desktop-x64.deb
```

## Repositories

Note that these repos are available only for `amd64` (deb+rpm) and `armhf/armv7l` (deb-only).

## Command line switches

    --debug-log         Switch file's log level to "debug" (default: "warn")

## Known issues

### Fonts rendering as rectangles after upgrade

Apparently it's caused by an issue of Electron with an older version of Pango. Upgrade Pango at least to `1.40.12` or downgrade to `1.40.5` should fix this. See https://github.com/Enrico204/Whatsapp-Desktop/issues/13

### Tray Icon is displayed wrong in KDE

This is due to some bugs between Electron and KDE on tray icons, see [this comment on issue #27](https://github.com/Enrico204/Whatsapp-Desktop/issues/27#issuecomment-338410450) and [vector-im/riot-web#3133](https://github.com/vector-im/riot-web/issues/3133). A workaround is to uninstall `libappindicator` and `libappindicator-gtk3` packages (this will change also the behavior of click on the tray icon).

## Contributions

Contributions are welcome! For feature requests and bug reports please submit an [issue](https://github.com/Enrico204/Whatsapp-Desktop/issues).

## Build from source

To build from the source, run the following commands:

    yarn install
    yarn run build:platform

where `build:platform` can be `build:linux` if you want to build for Linux (use `build:linux32` for 32-bit), `build:osx` for OSX only, `build:win` for Windows only, or simply `build` to build for all platforms.

You'll find artifacts into `dist/` directory.

## Run on-the-fly (for devs)

If you're a developer, you may want to use directly `yarn run dev` (in project root) instead of compiling the code each time. Please note that autostart feature will not work in this mode.

### Cross-build for Windows (from Linux/macOS)

Wine needs to be installed. On macOS, it is installable via Homebrew:  

    brew install wine

On GNU/Linux you can install `wine` from your distro package manager.

Please mind that `wine` requires an Xorg display, so you should set correctly your DISPLAY env var (you can use `Xvfb` if you don't have/want a real Xorg display running)
