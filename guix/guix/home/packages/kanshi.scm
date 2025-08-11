(define-module (home packages kanshi)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages wm))

(define-public jfred-kanshi
  (package
   (inherit kanshi)
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.freedesktop.org/emersion/kanshi.git")
           (commit "ebfd4de9c23c5f559da2bf72d6d881df7a56c349")))
     (file-name (git-file-name "kanshi" "master"))
     (sha256
      (base32
       "0n09g0hdpdflrlv6zb6m4vsag3rpjgxpxw3rkr17qma19gzf4x2m"))))))
