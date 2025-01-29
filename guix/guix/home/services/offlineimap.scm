(define-module (home services offlineimap)
  #:use-module (guix records)
  #:use-module (guix gexp)
  #:use-module (gnu services)
  #:use-module (gnu packages mail)
  #:use-module (gnu home services))

(define-record-type* <mail-configuration>
  mail-configuration make-mail-configuration
  mail-configuration?
  (email-addr mail-configuration-addr
              (default "jonathan@terracrypt.net")))

(define-public mail-service-type
  (service-type
   (name 'mail)
   (extensions
    (list (service-extension
           home-files-service-type
           (const
            `((".offlineimaprc" ,(local-file "../files/offlineimaprc"))
              (".offlineimap.py" ,(local-file "../files/offlineimap.py")))))
          (service-extension
           home-profile-service-type
           (const (list offlineimap3)))))
   (description "jfred's mail services")
   (default-value (mail-configuration))))
