(define-module (system machines base)
  #:use-module (guix gexp)
  #:use-module (gnu))

(define-public (jfred-append-base-services base)
  (modify-services base
    (guix-service-type config =>
                       (guix-configuration
                        (inherit config)
                        ;; Fetch substitutes from example.org.
                        (substitute-urls
                          (list "https://substitutes.nonguix.org"
                                "https://ci.guix.gnu.org"
                                "https://bordeaux.guix.gnu.org"))
                        (authorized-keys
                         (append (list (local-file "../keyring/terracard.pub")
                                       (local-file "../keyring/wired.pub")
                                       (local-file "../keyring/nonguix.pub"))
                                 %default-authorized-guix-keys))))))
