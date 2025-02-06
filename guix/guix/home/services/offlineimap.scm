(define-module (home services offlineimap)
  #:use-module (guix packages)
  #:use-module (guix records)
  #:use-module (guix gexp)
  #:use-module (gnu services)
  #:use-module (gnu packages mail)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu home services)
  #:use-module (gnu home services mail))

(define offlineimap-with-keyring
  (package
   (inherit offlineimap3)
   (inputs (modify-inputs
            (package-inputs offlineimap3)
            (append python-keyring)))))

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
              (".offlineimap.py" ,(local-file "../files/offlineimap.py" #:recursive? #t)))))
          (service-extension
           home-profile-service-type
           (const (list offlineimap-with-keyring)))))
   (description "jfred's mail services")
   (default-value (mail-configuration))))

(define-public %mail-services
  (list (service mail-service-type)
        (service home-msmtp-service-type
                 (home-msmtp-configuration
                  (accounts
                   (list
                    (msmtp-account
                     (name "default")
                     (configuration
                      (msmtp-configuration
                       (host "smtp.fastmail.com")
                       (port 465)
                       (tls? #t)
                       (tls-starttls? #f)
                       (auth? #t)
                       (user "jonathan@terracrypt.net")
                       (password-eval "/home/jfred/.offlineimap.py"))))))))))
