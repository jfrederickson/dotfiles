(use-modules
;; (gnu packages)
 (guix packages)
 ;; (guix profiles)
 (guix download)
 (guix git-download)
 (guix build-system gnu)
 (guix build-system python)
 (gnu packages audio)
 (gnu packages python-xyz)
 (gnu packages python-web)
 (gnu packages pkg-config)
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

(define-public jfred:ladspa-bs2b
  (package
    (name "ladspa-bs2b")
    (version "0.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://downloads.sourceforge.net/project/bs2b/plugins/LADSPA%20plugin/"
                                  version "/" name "-" version ".tar.gz"))
              (sha256
               (base32
                "1b4aipbj1ba5k99gbc7gmgy14sywyrjd8rpyqj5l905j0mjv8jg2"))))
    (build-system gnu-build-system)
    (native-inputs `(("pkg-config" ,pkg-config)))
    ;;(native-inputs `(("libbs2b" ,libbs2b)))
    (inputs `(("ladspa" ,ladspa)
              ("libbs2b" ,libbs2b)))
    (home-page "https://sourceforge.net/projects/bs2b/")
    (synopsis "Bauer stereophonic-to-binaural DSP - LADSPA plugin")
    (description "The Bauer stereophonic-to-binaural DSP (bs2b)
library and plugins is designed to improve headphone listening of
stereo audio records.  Recommended for headphone prolonged listening
to disable superstereo fatigue without essential distortions. This
package contains a LADSPA plugin for use with applications that
support them (e.g. PulseAudio).")
    (license license:gpl2)))
