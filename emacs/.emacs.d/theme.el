;; Powerline
(require 'powerline)
(powerline-default-theme)

;; Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'material)
(load-theme 'gruvbox)
;;(load-theme 'flatui)
;;(load-theme 'tron)


;;(require 'moe-theme)
;;(require 'moe-theme-switcher)

;; Don't show the startup message when emacs starts
(setq inhibit-startup-message t)

(setq-default cursor-type 'bar)
