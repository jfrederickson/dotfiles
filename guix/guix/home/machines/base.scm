(define-module (home machines base)
  #:use-module (gnu packages))

(define-public %base-packages
  (map (compose list specification->package+output)
       (list "emacs-pgtk"
             "glibc-locales"
             "nss-certs"
             "font-adobe-source-code-pro"
             "guile"
             "guile-goblins")))
