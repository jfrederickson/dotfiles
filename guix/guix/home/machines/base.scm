(define-module (home machines base)
  #:use-module (guix gexp)
  #:use-module (gnu home)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu services)
  #:use-module (gnu home services shells)
  #:use-module (gnu home services ssh))

(define-public %jfred-packages
  (map (compose list specification->package+output)
       (list "emacs-pgtk"
             "glibc-locales"
             "glibc-utf8-locales-2.29"
             "nss-certs"
             "font-adobe-source-code-pro"
             "guile"
             "guile-goblins"
             "direnv")))

;;(define-public %jfred-services
;;  (list (service home-bash-service-type
;;                 (home-bash-configuration
;;                  (bash-profile
;;                   (list (local-file "../configs/bash_profile")))))))

(define-public %jfred-services
  (list (service home-bash-service-type
                 (home-bash-configuration
                  (bash-profile
                   (list (local-file "../configs/bash_profile")))
                  (bashrc
                   (list (local-file "../configs/bashrc")))))        (service home-ssh-agent-service-type)))
