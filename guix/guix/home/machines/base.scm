(define-module (home machines base)
  #:use-module (home services kanshi)
  #:use-module (guix gexp)
  #:use-module (gnu home)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu services)
  #:use-module (gnu home services)
  #:use-module (gnu home services desktop)
  #:use-module (gnu home services shells)
  #:use-module (gnu home services sound)
  #:use-module (gnu home services ssh)
  #:use-module (gnu home services shepherd))

(define-public %jfred-packages
  (map (compose list specification->package+output)
       (list "emacs-pgtk"
             "alsa-plugins"
             "alsa-plugins:pulseaudio"
             "xdg-desktop-portal"
             "xdg-desktop-portal-wlr"
             "glibc-locales"
             "glibc-utf8-locales-2.29"
             "nss-certs"
             "font-adobe-source-code-pro"
             "guile"
             "guile-goblins"
             "grimshot"
             "direnv"
             "stow"
             "git"
             "make"
             "sicp"
             "gnupg"
             "openssh")))

(define-public %jfred-services
  (list (service home-bash-service-type
                 (home-bash-configuration
                  (bash-profile
                   (list (local-file "../configs/bash_profile")))
                  (bashrc
                   (list (local-file "../configs/bashrc")))))
        (service home-dbus-service-type)
        ;;(service home-ssh-agent-service-type)
        (service home-pipewire-service-type)
        (service home-shepherd-service-type
                   (home-shepherd-configuration
                    (services
                     (list kanshi-service))))
        (simple-service 'test-config
                   home-xdg-configuration-files-service-type
                   (list `("kanshi/config"
                           ,(local-file "../files/kanshi/config"))))))
