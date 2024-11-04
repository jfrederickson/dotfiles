(define-module (home packages et-book)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system font))

(define-public font-et-book
  (package
    (name "font-et-book")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/edwardtufte/et-book")
                    (commit "24d3a3bbfc880095d3df2b9e9d60d05819138e89")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1bhpk1fbp8jdhzc5j8y5v3bpnzy2sz3dpgjgzclb0dnm51hqqrpn"))))
    (build-system font-build-system)
    (home-page "https://edwardtufte.github.io/et-book/")
    (synopsis "ET Book fonts")
    (description
     "ET Book is a Bembo-like font for the computer designed by Dmitry Krasny, Bonnie Scranton, and Edward Tufte.")
    (license license:expat)))

