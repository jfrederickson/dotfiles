(define-module (home services offlineimap)
  #:use-module (guix gexp)
  #:use-module (gnu services)
  #:use-module (gnu packages mail)
  #:use-module (gnu home services))

(define-public %offlineimap-config-services
  (list
   (simple-service
    'offlineimap-config-service
    home-files-service-type
    `((".offlineimaprc" ,(local-file "../files/offlineimaprc"))
      (".offlineimap.py" ,(local-file "../files/offlineimap.py"))))
   (simple-service
    'offlineimap-packages-service
    home-profile-service-type
    (list offlineimap3))))
