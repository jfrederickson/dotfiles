;; Powerline
;;(require 'powerline)
;;(powerline-default-theme)

;; Modeline
;;(require 'doom-modeline)
;;(doom-modeline-init)
;;(doom-modeline-mode)

;; Theme
;;(load-theme 'cyberpunk t)
;;(load-theme 'one-light t)
(load-theme 'modus-operandi t)

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

;; From https://zzamboni.org/post/beautifying-org-mode-in-emacs/
(let* ((variable-tuple
        (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
              ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
              ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
              ((x-list-fonts "Verdana")         '(:font "Verdana"))
              ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
              (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  (custom-theme-set-faces
   'user
   `(org-level-8 ((t (,@headline ,@variable-tuple))))
   `(org-level-7 ((t (,@headline ,@variable-tuple))))
   `(org-level-6 ((t (,@headline ,@variable-tuple))))
   `(org-level-5 ((t (,@headline ,@variable-tuple))))
   `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
   `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.115))))
   `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.125))))
   `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.25))))
   `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

(custom-theme-set-faces
 'user
 '(variable-pitch ((t (:family "ETBembo" :height 1.2)))))
(setq mixed-pitch-set-height t)

(use-package mixed-pitch-mode
  :hook (org-mode . mixed-pitch-mode))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))
(use-package olivetti
  :hook (org-mode . olivetti-mode))

;;(set-face-attribute 'default nil
;;                    :family "Miracode"
;;                    :height 150
;;                    :weight 'bold
;;                    :width 'normal)

(setq-default line-spacing 0)
