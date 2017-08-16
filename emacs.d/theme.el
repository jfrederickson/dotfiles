;; Powerline
(require 'powerline)
(powerline-default-theme)

;; Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'material)

;; Don't show the startup message when emacs starts
(setq inhibit-startup-message t)
