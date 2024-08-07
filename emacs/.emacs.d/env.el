;; macOS specific - set the exec path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(exec-path-from-shell-initialize)

(exec-path-from-shell-copy-env "SSH_AUTH_SOCK")
;;(setenv "SSH_AUTH_SOCK" (shell-command-to-string "gpgconf --list-dir agent-ssh-socket"))

(require 'better-defaults)

;; Enable project awareness
(projectile-mode)

;; Fuzzy completion
(setq completion-styles '(basic partial-completion emacs22 flex))

;; Enable my common docsets in helm-dash
(setq helm-dash-docsets '("SaltStack" "Kubernetes" "Python 3"))

;; Set up org-mode the way I want it
(setq org-directory "~/org")
(setq org-agenda-files (mapcar (lambda (x) (concat org-directory x)) '("/Inbox.org" "/Next.org" "/Someday.org" "/Recurring.org")))
(setq org-refiles-jfred (mapcar (lambda (x) (concat org-directory x)) '("/Inbox.org" "/Next.org" "/Someday.org" "/Complete.org" "/Recurring.org")))
(setq org-refile-targets '((org-refiles-jfred :maxlevel . 1)))
(setq org-outline-path-complete-in-steps nil)
(setq org-default-notes-file (concat org-directory "/Inbox.org"))
(setq org-capture-templates
      '(("t" "Todo" entry (file "~/org/Inbox.org")
         "* TODO %?\n  %a")
        ("tn" "Todo - no link" entry (file "~/org/inbox.org")
         "* TODO %?")
        ("j" "Journal" entry (file+olp+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")
        ("m" "Meeting Notes" entry (file+olp+datetree "~/org/meetings.org")
         "* Meeting Notes - %?")))

;; Window transparency
(set-frame-parameter (selected-frame) 'alpha-background 80)
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

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (shell . t)
   (python . t)
   ))

;; Mastodon settings
(setq mastodon-instance-url "https://jawns.club")
(setq mastodon-active-user "jfred")

;;(add-to-list 'debbugs-gnu-all-packages "guix-patches")

(setq git-link-open-in-browser t)
(setq warning-minimum-level :error)

;; Send mail using SMTP via mail.example.org.
(setq smtpmail-smtp-server "smtp.fastmail.com")

;; Send mail using SMTP on the mail submission port 587.
(setq smtpmail-smtp-service 465)


(with-eval-after-load 'mu4e (setq mu4e-contexts
                                  `( ,(make-mu4e-context
                                       :name "Personal"
                                       :enter-func (lambda () (mu4e-message "Entering Personal context"))
                                       :leave-func (lambda () (mu4e-message "Leaving Personal context"))
                                       ;; we match based on the contact-fields of the message
                                       :match-func (lambda (msg)
                                                     (when msg
                                                       (mu4e-message-contact-field-matches msg
                                                                                           :to "jonathan@terracrypt.net")))
                                       :vars '( ( user-mail-address	    . "jonathan@terracrypt.net"  )
                                                ( user-full-name	    . "Jonathan Frederickson" )
                                                ( mu4e-compose-signature .
                                                  (concat
                                                   "Jonathan Frederickson\n")))))))
(setq mu4e-compose-format-flowed t)
