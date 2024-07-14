(define-module (home configs channels)
  #:use-module (guix channels)
  #:use-module (gnu services)
  #:use-module (gnu home services guix))

(define-public %jfred-home-channels
  (list
   (simple-service
    'jfred-home-channels-service
    home-channels-service-type
    (list
     (channel
      (name 'nonguix)
      (url "https://gitlab.com/nonguix/nonguix")
      (branch "master")
      (introduction
       (make-channel-introduction
        "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
        (openpgp-fingerprint
         "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))))))
