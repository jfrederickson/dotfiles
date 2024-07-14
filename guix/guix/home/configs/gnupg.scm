(define-module (home configs gnupg)
  #:use-module (guix gexp)
  #:use-module (gnu services)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu home services gnupg))

(define-public %jfred-gnupg-services
  (list
   (service home-gpg-agent-service-type
            (home-gpg-agent-configuration
             (pinentry-program
              (file-append pinentry-rofi "/bin/pinentry-rofi"))
             (ssh-support? #t)))))
