(define-module (home machines work)
  #:use-module (gnu home)
  #:use-module (home configs emacs)
  #:use-module (home machines base))

(home-environment
 (packages
  (append %base-packages %emacs-packages)))
