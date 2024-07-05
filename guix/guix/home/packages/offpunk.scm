(define-module (home packages offpunk)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system pyproject)
  #:use-module (guix licenses)
  #:use-module (gnu packages file)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages image-viewers)
  #:use-module (gnu packages less)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages web))

(define-public offpunk
  (package
   (name "offpunk")
   (version "v2.3")
   (source (origin
            (method url-fetch)
            (uri (string-append "https://git.sr.ht/~lioploum/offpunk/archive/" version
                                ".tar.gz"))
            (sha256
             (base32 "17ibsyhn9065yzrbvgj5g7q7wfsflbs3hyn91hl7fysim4w4qglv"))))
   (build-system pyproject-build-system)
   (arguments
    (list #:tests? #f))
   (native-inputs
    (list python-hatchling))
   (inputs
    (list less
          file
          xdg-utils
          python-cryptography
          python-requests
          python-beautifulsoup4
          python-readability-lxml
          python-feedparser
          chafa))
   (synopsis "An offline first command-line browser for the smolnet")
   (description "A command-line and offline-first smolnet browser/feed reader for Gemini, Gopher, Spartan and Web by Ploum.

The goal of Offpunk is to be able to synchronise your content once (a
day, a week, a month) and then browse/organise it while staying
disconnected.")
   (home-page "https://sr.ht/~lioploum/offpunk/")
   (license agpl3)))

offpunk
