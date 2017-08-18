;; Powerline
(require 'powerline)
(powerline-default-theme)

;; Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;(load-theme 'material)
(load-theme 'gruvbox)

;; Don't show the startup message when emacs starts
(setq inhibit-startup-message t)

(setq-default cursor-type 'bar)
