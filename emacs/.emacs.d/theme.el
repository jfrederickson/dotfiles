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
;;(load-theme 'spacemacs-dark)
;;(load-theme 'base16-default-light)
;;(load-theme 'base16-eighties)
;;(load-theme 'base16-tomorrow)
;;(load-theme 'base16-chalk)
(load-theme 'base16-twilight)
;;(load-theme 'base16-tube)

;;(load-theme 'base16-spacemacs)
;;(load-theme 'base16-tomorrow-night-eighties)
;;y(load-theme 'base16-google-dark)
;;(load-theme 'base16-helios)
;;(load-theme 'base16-chalk)
;;(load-theme 'flatui)
;;(load-theme 'tron)


;;(require 'moe-theme)
;;(require 'moe-theme-switcher)

;; Don't show the startup message when emacs starts
(setq inhibit-startup-message t)

(setq-default cursor-type 'bar)

(if (eq system-type 'darwin)
    (setq jfred/font-height 150) ;; work laptop, retina display
  (setq jfred/font-height 120)) ;; linux laptops

(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height jfred/font-height
                    :weight 'normal
                    :width 'normal)
