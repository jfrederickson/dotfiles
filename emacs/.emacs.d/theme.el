;; Powerline
;;(require 'powerline)
;;(powerline-default-theme)

;; Modeline
;;(require 'doom-modeline)
;;(doom-modeline-init)
(doom-modeline-mode)

;; Theme
(load-theme 'cyberpunk t)

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


;;(set-face-attribute 'default nil
;;                    :family "Miracode"
;;                    :height 150
;;                    :weight 'bold
;;                    :width 'normal)

(setq-default line-spacing 0)
