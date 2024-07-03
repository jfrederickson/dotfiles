(define-module (home configs sway)
  #:use-module (guix gexp)
  #:use-module (gnu services)
  #:use-module (gnu home services))

(define-public %sway-config-services
  (list
   (simple-service
    'sway-config-service
    home-xdg-configuration-files-service-type
    `(("sway/config" ,(local-file "../../../../sway/.config/sway/config"))))))

