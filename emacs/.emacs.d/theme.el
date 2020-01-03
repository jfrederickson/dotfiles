;; Powerline
;;(require 'powerline)
;;(powerline-default-theme)

;; Modeline
(require 'doom-modeline)
(doom-modeline-init)

;; Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'material)
;;(load-theme 'gruvbox)
;;(load-theme 'sourcerer)
;;(load-theme 'one-light)
(load-theme 'spacemacs-dark)
;;(load-theme 'flatui)
;;(load-theme 'tron)


;;(require 'moe-theme)
;;(require 'moe-theme-switcher)

;; Don't show the startup message when emacs starts
(setq inhibit-startup-message t)

(setq-default cursor-type 'bar)
;;(set-frame-font "-ADBO-Source Code Pro-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")

(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 110
                    :weight 'normal
                    :width 'normal)
