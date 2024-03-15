(define-module (home configs emacs)
  #:use-module (gnu packages))

(define-public %emacs-packages
  (map (compose list specification->package+output)
       (list "emacs-git-link"
             "emacs-json-mode"
             "emacs-groovy-modes"
             "emacs-jenkinsfile-mode"
             "emacs-jabber"
             "emacs-magit"
             "emacs-all-the-icons"
             "emacs-ag"
             "emacs-editorconfig"
             "emacs-nginx-mode"
             "emacs-visual-fill-column"
             "emacs-dockerfile-mode"
             "emacs-expand-region"
             "emacs-helm"
             "emacs-cyberpunk-theme"
             "emacs-doom-modeline"
             "emacs-exec-path-from-shell"
             "emacs-better-defaults"
             "emacs-projectile"
             "emacs-elpy"
             "emacs-geiser")))


