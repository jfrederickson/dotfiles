(setq package-selected-packages (append package-selected-packages '(git-link json-mode gruvbox-theme groovy-mode mingus salt-mode smooth-scroll xkcd neotree markdown-mode pianobar exec-path-from-shell jedi floobits ein virtualenvwrapper matrix-client jabber magit tagedit rainbow-delimiters projectile ido-ubiquitous cider clojure-mode-extra-font-locking clojure-mode paredit elpy material-theme powerline helm better-defaults helm-dash)))

;; macOS specific - set the exec path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(exec-path-from-shell-copy-env "SSH_AUTH_SOCK")

(require 'better-defaults)
(require 'mingus-stays-home)


