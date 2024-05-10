(define-module (home machines reform)
  #:use-module (gnu home)
  #:use-module (home configs emacs)
  #:use-module (home configs syncthing)
  #:use-module (home machines base))

(home-environment
 (packages
  (append %base-packages %emacs-packages))
 (services %syncthing-services))
