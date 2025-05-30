(define-module (home configs emacs)
  #:use-module (gnu packages))

(define-public %emacs-packages
  (map (compose list specification->package+output)
       (list "emacs-guix"
             "emacs-arei"
             "emacs-auctex"
             "guile-ares-rs"
             "emacs-git-link"
             "emacs-json-mode"
             "emacs-typescript-mode"
             "emacs-jsonnet-mode"
             "emacs-groovy-modes"
             "emacs-go-mode"
             "emacs-jenkinsfile-mode"
             "emacs-jabber"
             "emacs-magit"
             "emacs-nix-mode"
             "emacs-all-the-icons"
             "emacs-ag"
             "emacs-direnv"
             "emacs-editorconfig"
             "emacs-elfeed"
             "emacs-elfeed-goodies"
             "emacs-elfeed-protocol"
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
             "mu" ;; includes mu4e, I think
             ;;"emacs-elpy"
             "emacs-yaml-mode"
             "emacs-markdown-mode"
             "emacs-terraform-mode"
             "emacs-geiser-guile"
             "emacs-org-present"
             ;;"emacs-org-reveal"
             "emacs-org-re-reveal"
             "emacs-org-bullets"
             "emacs-olivetti"
             "emacs-htmlize"
             "emacs-lispy"
             "emacs-vertico"
             "emacs-consult"
             "emacs-emprise"
             "emacs-excorporate"
             "emacs-mixed-pitch")))
