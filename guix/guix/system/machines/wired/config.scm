(define-module (system machines wired config)
  #:use-module (gnu)
  #:use-module (system machines server-base)
  #:use-module (system machines wired hardware-configuration))

(define-public wired-operating-system
  (operating-system
   (inherit hardware-configuration)
   (locale "en_US.utf8")
   (timezone "America/New_York")
   (host-name "wired")))
