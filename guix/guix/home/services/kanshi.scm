(define-module (home services kanshi)
  #:use-module (guix gexp)
  #:use-module (gnu services shepherd)
  #:use-module (gnu packages wm))

(define-public kanshi-service
  (shepherd-service
   (provision '(kanshi))
   (start #~(make-forkexec-constructor
             (list #$(file-append kanshi "/bin/kanshi"))))
   (stop #~(make-kill-destructor))))
