;; macOS specific - set the exec path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(exec-path-from-shell-initialize)

(exec-path-from-shell-copy-env "SSH_AUTH_SOCK")
;;(setenv "SSH_AUTH_SOCK" (shell-command-to-string "gpgconf --list-dir agent-ssh-socket"))

(require 'better-defaults)
(require 'mingus-stays-home)

;; Enable project awareness
(projectile-mode)

;; Enable my common docsets in helm-dash
(setq helm-dash-docsets '("SaltStack" "Kubernetes" "Python 3"))

;; Set up org-mode the way I want it
(setq org-directory "~/org")
(setq org-agenda-files (mapcar (lambda (x) (concat org-directory x)) '("/inbox.org" "/gtd-active.org" "/gtd-next.org" "/gtd-someday.org")))
(setq org-refiles-jfred (mapcar (lambda (x) (concat org-directory x)) '("/inbox.org" "/gtd-active.org" "/gtd-next.org" "/gtd-someday.org" "/gtd-complete.org")))
(setq org-refile-targets '((org-refiles-jfred :maxlevel . 1)))
(setq org-outline-path-complete-in-steps nil)
(setq org-default-notes-file (concat org-directory "/inbox.org"))
(setq org-capture-templates
      '(("t" "Todo" entry (file "~/org/inbox.org")
         "* TODO %?\n  %a")
        ("j" "Journal" entry (file+olp+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")))

;; Window transparency
;;(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
;;(add-to-list 'default-frame-alist '(alpha . (90 . 90)))

(defun toggle-transparency ()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
     nil 'alpha
     (if (eql (cond ((numberp alpha) alpha)
                    ((numberp (cdr alpha)) (cdr alpha))
                    ;; Also handle undocumented (<active> <inactive>) form.
                    ((numberp (cadr alpha)) (cadr alpha)))
              100)
         '(85 . 50) '(100 . 100)))))
(global-set-key (kbd "C-c t") 'toggle-transparency)

(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))
