(define-module (home machines base)
  #:use-module (home services kanshi)
  #:use-module (home packages et-book)
  #:use-module (guix gexp)
  #:use-module (guix transformations)
  #:use-module (gnu home)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages messaging)
  #:use-module (gnu services)
  #:use-module (gnu home services)
  #:use-module (gnu home services desktop)
  #:use-module (gnu home services shells)
  #:use-module (gnu home services sound)
  #:use-module (gnu home services ssh)
  #:use-module (gnu home services shepherd))

(define senpai-transform
  (options->transformation
   ;; Disable tests on this package due to build failure
   '((without-tests . "go-github-com-burntsushi-graphics-go"))))

(define-public %jfred-packages
  (append (list
           font-et-book
           (senpai-transform senpai))
          (map (compose list specification->package+output)
               (list "emacs-pgtk"
                     "alsa-plugins"
                     "alsa-plugins:pulseaudio"
                     "xdg-desktop-portal"
                     "xdg-desktop-portal-wlr"
                     "xdg-desktop-portal-gtk"
                     "glibc-locales"
                     "nss-certs"
                     "font-adobe-source-code-pro"
                     "guile"
                     "guile-goblins"
                     "guile-hoot"
                     "guile-hall"
                     "g-golf"
                     "grimshot"
                     "direnv"
                     "stow"
                     "git"
                     "make"
                     "sicp"
                     "ledger"
                     ;;"gnupg"
                     "openssh"))))

(define-public %jfred-services
  (list (service home-bash-service-type
                 (home-bash-configuration
                  (bash-profile
                   (list (local-file "../configs/bash_profile")))
                  (bashrc
                   (list (local-file "../configs/bashrc")))))
        (service home-dbus-service-type)
        (service home-ssh-agent-service-type)
        (service home-pipewire-service-type)
        (simple-service 'test-config
                   home-xdg-configuration-files-service-type
                   (list `("kanshi/config"
                           ,(local-file "../files/kanshi/config"))))))
