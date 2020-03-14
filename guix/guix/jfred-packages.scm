(use-modules
;; (gnu packages)
 (guix packages)
;; (guix profiles)
 (guix git-download)
 (guix build-system python)
 (gnu packages python-xyz)
 (gnu packages python-web)
 ((guix licenses) #:prefix license:))

(define-public jfred:python-linode-api4
  (package
    (name "python-linode-api4")
    (version "2.3.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/linode/linode_api4-python.git")
             (commit version)))
       (sha256
        (base32
         "09j5ym7k543mz1w733zib6289xddsla6w9xyriwy58mbrk9b7623"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         ;;(replace 'check
         ;;  (lambda _
         ;;    (invoke "tox"))))))
         (delete 'check))))
    ;;(native-inputs
    ;; `(("python-mock" ,python-mock)
    ;;   ("python-tox" ,python-tox)
    ;;   ("python-pytest" ,python-pytest)
    ;;   ("python-coverage" ,python-coverage)
    ;;   ("python-pytest-mock" ,python-pytest-mock)
    ;;   ("python-pylint" ,python-pylint)))
    (propagated-inputs
     `(("python-future" ,python-future)
       ("python-requests" ,python-requests)))
    (home-page
     "https://github.com/linode/linode_api4-python")
    (synopsis
     "The official python SDK for Linode API v4")
    (description
     "The official python SDK for Linode API v4")
    (license license:bsd-3)))
