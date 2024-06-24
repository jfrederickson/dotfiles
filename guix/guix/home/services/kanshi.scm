(define-module (home services kanshi)
  #:use-module (guix gexp)
  #:use-module (gnu services shepherd)
  #:use-module (gnu packages wm))

(define-public kanshi-service
  (shepherd-service
   (provision '(kanshi))
   (start #~(make-forkexec-constructor
             (list #$(file-append kanshi "/bin/kanshi")
                   "-c"
                   #$(local-file "../files/kanshi/config"))
             ;;#:log-file (string-append %user-log-dir "/kanshi.log")))
             #:log-file "/home/jfrederi/.local/state/shepherd/kanshi.log"
             #:environment-variables (cons "WAYLAND_DISPLAY=wayland-1"
                                           (default-environment-variables))))
   (stop #~(make-kill-destructor))))
