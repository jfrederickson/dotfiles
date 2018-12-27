;; jfred's emacs config

;; Custom variables
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Get the package list from package.el
;; custom.el is updated automatically but isn't tracked in git
(load "~/.emacs.d/package.el")

;; Install all my packages
(package-install-selected-packages)

;; Set up the environment
(load "~/.emacs.d/env.el")

;; Python config
(load "~/.emacs.d/python.el")

;; Theme config
(load "~/.emacs.d/theme.el")

;; Keybindings and navigation
(load "~/.emacs.d/nav.el")

;; Linode-specific configs
;;(load "~/.emacs.d/linode.el")
(let ((linode-config "~/.emacs.d/linode.el"))
  (when (file-exists-p linode-config)
    (load linode-config)))
