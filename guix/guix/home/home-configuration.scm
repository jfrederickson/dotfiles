;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules
  (gnu home)
  (gnu packages)
  (gnu services)
  (guix build-system copy)
  (guix gexp)
  (gnu home services shells)
  (gnu home services shepherd))

(load "../jfred-packages.scm")
(load "./services.scm")

(home-environment
 (packages
          (map (compose list specification->package+output)
               (list ;;"python-linode-api4"
	        "cryptsetup"
                "ladspa-bs2b"
                ;;"glibc-utf8-locales"
                "font-ghostscript"
                "font-dejavu"
                "font-gnu-freefont"
                "font-abattis-cantarell"
                "stow"
                "rofi"
                "rofi-pass"
                "xset"
                "gnupg"
                "pinentry-gnome3"
                "pinentry-emacs"
                "emacs-password-store"
                "emacs-use-package"
                "pcsc-lite"
                "opensc"
                "emacs"
                "emacs-debbugs"
                "git"
                "git:send-email"
                "guile@3.0.7"
                "guile-git"
                "autoconf"
                "font-adobe-source-code-pro"
                "emacs-guix"
                "emacs-emojify"
                "glade"
                "racket"
                "python"
                "poetry"
                "python-virtualenv"
                "emacs-jedi"
                "python-jedi"
                ;;"gobject-introspection"
	        "gnome-tweaks"
                "python-pygobject"
                "python-pygpgme"
                "d-feet"
                ;;"python-django@4.0.1"
                "python-netaddr"
                "emacs-elixir-mode"
                "erlang"
                "emacs-erlang"
                "ruby@3.0"
                "bundler"
                ;;"go@1.17.6"
                "binutils"
                ;;"linux-libre-headers@5.15.15"
                "gcc-toolchain"
                "haunt"
                "docker"
                "docker-cli"
                "docker-compose"
                "ansible"
                "pwgen"
                "mtr"
                "postgresql@13"
                "emacs-vterm"
                "lxc"
                "htop"
                "curl"
                "wget"
                "netcat-openbsd"
                "the-silver-searcher"
                "openssh"
                "adb"
                "atool"
                "unzip"
                "tinc"
                "bind:utils"
                "encfs"
                "qrencode"
                "openjdk"
                "java-swt"
                "fontconfig"
                "nss-certs"
                "mu"
                "offlineimap3"
                "quaternion"
                "toot"
                "dino"
                ;;"gnunet"
                ;;"gnunet-gtk"
                "gajim"
                "mumble"
                "polari"
                "tor"
                "quassel"
                "gnome-calendar"
                "gnome-keyring"
                "gnome-bluetooth"
                "bluez"
                "gnome-shell-extensions"
                "gnome-shell-extension-appindicator"
                "gnome-shell-extension-dash-to-panel"
                "matcha-theme"
                "sound-theme-freedesktop"
                "libreoffice"
                "icecat"
                "icedove"
                "gimp"
                "inkscape"
                "luakit"
                "flatpak"
                "xdg-dbus-proxy"
                "deluge"
                "arc-icon-theme"
                "dbus"
                ;;"chirp"
                "font-google-noto"
                "font-terminus"
                "font-liberation"
                "font-lato"
                "font-awesome"
                "font-ibm-plex"
                "vlc"
                "pavucontrol"
                "gst-plugins-bad"
                "gst-plugins-base"
                "gst-plugins-good"
                "gst-plugins-ugly"
                "gpodder"
                ;;"shotwell"
                "youtube-dl"
                "calibre"
                "emacs-ascii-art-to-unicode"
                "filters"
                "tintin++"
                "powwow"
                "minetest"
                "supertuxkart"
                "crawl"
                "crawl-tiles"
                "alacritty"
                "waybar"
                "wofi"
                "kanshi"
                "scummvm"
                "nheko"
                "python-diceware"
                "rbw")))
  (services
    (list (service
            home-bash-service-type
            (home-bash-configuration
              (aliases
                '(("grep='grep --color" . "auto")
                  ("ll" . "ls -l")
                  ("ls='ls -p --color" . "auto")))
              (bashrc
                (list (local-file
                        "/home/jfred/guix/home/.bashrc"
                        "bashrc")))
              (bash-profile
                (list (local-file
                        "/home/jfred/guix/home/.bash_profile"
                        "bash_profile")))))
          (service home-shepherd-service-type
                   (home-shepherd-configuration
                    (services
                     (list kanshi-service)))))))
