(use-modules
 (gnu packages)
 (guix packages)
 (guix profiles)
 (guix git-download)
 (guix build-system python)
 (gnu packages python-xyz)
 (gnu packages python-web)
 ((guix licenses) #:prefix license:))

(include "jfred-packages.scm")

(packages->manifest
 (append `(,jfred:python-linode-api4)
         (map (compose list specification->package+output)
              '("glibc-utf8-locales"
                "gs-fonts"
                "font-dejavu"
                "font-gnu-freefont-ttf"
                "font-abattis-cantarell"
                ;;Dotfiles management
                "stow"
                "rofi"
                "rofi-pass"
                "xset" ;; dep for rofi-pass I think, should contribute patch
                "gnupg"
                "pinentry-gnome3"
                "pinentry-emacs"
                "emacs-password-store"
                "emacs-use-package"
                "pcsc-lite"
                "opensc"
                ;;Hacking
                "emacs"
                "emacs-debbugs"
                "git"
                "git:send-email"
                "guile@2.2"
                "guile-git"
                "autoconf"
                "font-adobe-source-code-pro"
                "emacs-guix"
                "emacs-emojify"
                "glade"
                "racket"
                "python"
                "poetry"
                ;;"python-ipython"
                "python-virtualenv"
                "emacs-jedi"
                "python-jedi"
                "gobject-introspection"
                "python-pygobject"
                "python-pygpgme"
                "d-feet"
                "python-django"
                "python-netaddr"
                "elixir"
                "emacs-elixir-mode"
                "erlang"
                "emacs-erlang"
                "ruby"
                "ruby-rails"
                "bundler"
                "go"
                "binutils"
                "linux-libre-headers"
                ;; ARM Hacking
                "dfu-programmer"
                "dfu-util"
                "avr-binutils"
                "avr-toolchain"
                "arm-none-eabi-toolchain"
                ;; Blogging
                "haunt"
                ;; Devops
                "docker"
                "docker-cli"
                "docker-compose"
                "ansible"
                "debops"
                ;; System Administration
                "pwgen"
                ;;"terminator"
                "lxc"
                "htop"
                "curl"
                "wget"
                "the-silver-searcher"
                "openssh"
                "adb"
                "atool"
                "unzip"
                "tinc"
                "bind:utils"
                "fprintd"
                "encfs"
                "qrencode"
                "openjdk"
                "java-swt"
                "fontconfig"
                "nss-certs"
                ;;"git-crypt" ; broken build
                ;; Messaging
                "mu"
                "offlineimap"
                "quaternion"
                "toot"
                "dino"
                "gnunet"
                "gajim"
                ;;# Desktop
                "gnome-tweaks"
                "gnome-calendar"
                "gnome-keyring"
                "gnome-bluetooth"
                "bluez"
                "gnome-shell-extensions"
                "gnome-shell-extension-dash-to-panel"
                "matcha-theme"
                ;;"claws-mail"
                "icecat"
                "gimp"
                "inkscape"
                "luakit"
                "flatpak"


                ;;"arc-theme"
                "arc-icon-theme"
                "dbus"
                ;; Fonts
                "font-google-noto"
                "font-terminus"
                "font-liberation"
                "font-lato"
                "font-awesome"
                "font-ibm-plex"
                ;; Media
                "vlc"
                "pavucontrol"
                "gst-plugins-bad"
                "gst-plugins-base"
                "gst-plugins-good"
                "gst-plugins-ugly"
                "gpodder"
                "shotwell"
                "youtube-dl"
                "calibre"
                ;; Fun
                "emacs-ascii-art-to-unicode"
                ;; Gaming
                "tintin++"
                "powwow"
                "harmonist-tk"
                "minetest"))))
