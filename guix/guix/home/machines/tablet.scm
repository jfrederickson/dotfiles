(define-module (home machines tablet)
  #:use-module (gnu home)
  #:use-module (home configs emacs)
  #:use-module (home machines base))

(home-environment
 (packages
  (append %jfred-packages %emacs-packages))
 (services %jfred-services))
