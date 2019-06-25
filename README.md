Overview
--------

This is a pretty basic i3/i3-gaps/polybar/urxvt setup. It's configured with the nord color theme, but it's wired up such that
if the terminal colors are changed in xresources, they propagate in a sane way.

Dotfile Setup
-------------

```sh
git clone git@github.com:jpbetz/dotfiles.git
export dotfiles=$(pwd)/dotfiles

ln -s ${dotfiles}/.config/neofetch ~/.config/neofetch
ln -s ${dotfiles}/.config/polybar ~/.config/polybar

ln -s ${dotfiles}/.Xresources ~/.Xresources
ln -s ${dotfiles}/.Xmodmap ~/.Xmodmap
ln -s ${dotfiles}/.xsession ~/.xsessionrc
ln -s ${dotfiles}/.Xdefaults ~/.Xdefaults

# For i3, we want to be able to customize machine specific settings, so it's a bit more involved
ln -s ${dotfiles}/.config/i3 ~/.config/i3-base
mkdir ~/.config/i3
# create a ~/.config/i3/config-local with any machine specific settings

```

Debian install
--------------

### i3

```sh
sudo apt-get install i3
```

### i3-gaps

https://github.com/Airblader/i3/wiki/Building-from-source
https://gist.github.com/boreycutts/6417980039760d9d9dac0dd2148d4783

```sh
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool automake

mkdir tmp
cd tmp
git clone https://github.com/Airblader/xcb-util-xrm
cd xcb-util-xrm
git submodule update --init
./autogen.sh --prefix=/usr
make
sudo make install

mkdir ~/projects/desktop-ui
cd ~/projects/desktop-ui
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
git checkout gaps && git pull
autoreconf --force --install
rm -rf build
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc
```

### urxvt

sudo apt-get install urxvt

### polybar

https://medium.com/@tatianaensslin/install-polybar-in-3-steps-on-debian-stretch-c64ab6157fb1

```sh
sudo apt-get install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev

git clone https://github.com/jaagr/polybar.git

# not documented in above link
sudo apt-get install libxcb-composite0 libxcb-composite0-dev

cd polybar && ./build.sh

[yes to all]

```

### feh

sudo apt-get install feh

### Fonts

Updated all config files to use desired font... Lame, I should thread it in.
