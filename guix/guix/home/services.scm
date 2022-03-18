(use-modules
 (gnu services shepherd)
 (gnu packages wm))

(define kanshi-service
  (shepherd-service
   (provision '(kanshi))
   (start #~(make-forkexec-constructor
             (list #$(file-append kanshi "/bin/kanshi"))))
   (stop #~(make-kill-destructor))))
