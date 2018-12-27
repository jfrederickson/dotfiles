(setq package-selected-packages (append package-selected-packages '(git-link json-mode gruvbox-theme groovy-mode mingus salt-mode smooth-scroll xkcd neotree markdown-mode pianobar exec-path-from-shell jedi floobits ein virtualenvwrapper matrix-client jabber magit tagedit rainbow-delimiters projectile ido-ubiquitous cider clojure-mode-extra-font-locking clojure-mode paredit elpy material-theme powerline helm better-defaults helm-dash quelpa quelpa-use-package ledger-mode js2-mode doom-modeline all-the-icons org-jira)))

(require 'quelpa-use-package)

(use-package matrix-client
  :quelpa ((matrix-client :fetcher github :repo "jgkamat/matrix-client-el"
                          :files (:defaults "logo.png" "matrix-client-standalone.el.sh"))))

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
