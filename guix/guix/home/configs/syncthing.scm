(define-module (home configs syncthing)
  #:use-module (gnu services)
  #:use-module (gnu home services syncthing))

(define-public %syncthing-services
  (list
   (service home-syncthing-service-type)))
