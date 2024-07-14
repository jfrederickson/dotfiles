(define-module (home machines reform)
  #:use-module (gnu home)
  #:use-module (home configs emacs)
  #:use-module (home configs syncthing)
  #:use-module (home machines base)
  #:use-module (home machines personal))

(home-environment
 (packages
  (append %jfred-packages
          %jfred-personal-packages
          %jfred-desktop-packages
          %emacs-packages))
 (services
  (append %jfred-services %syncthing-services)))
