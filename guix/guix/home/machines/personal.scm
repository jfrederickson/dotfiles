
(define-module (home machines personal)
  #:use-module (gnu home)
  #:use-module (home configs channels)
  #:use-module (home configs desktop)
  #:use-module (home configs emacs)
  #:use-module (home configs gnupg)
  #:use-module (home configs syncthing)
  #:use-module (home configs sway)
  #:use-module (home services offlineimap)
  #:use-module (home machines base)
  #:use-module (home packages offpunk)
  #:use-module (gnu packages ebook)
  #:use-module (gnu packages inkscape)
  #:use-module (gnu services))

(define-public %jfred-personal-packages
  (list
   ;;calibre
   ;;inkscape
   offpunk))

(home-environment
 (packages
  (append %jfred-packages
          %jfred-personal-packages
          %jfred-desktop-packages
          %emacs-packages))
 (services
  (append %jfred-services
          %jfred-home-channels
          %syncthing-services
          (list (service mail-service-type))
          %sway-config-services)))
          ;;%jfred-gnupg-services)))
