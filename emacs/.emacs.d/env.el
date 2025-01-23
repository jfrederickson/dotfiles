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

;;(with-eval-after-load 'mu4e (setq mu4e-contexts
;;                                  `( ,(make-mu4e-context
;;                                       :name "Personal"
;;                                       :enter-func (lambda () (mu4e-message "Entering Personal context"))
;;                                       :leave-func (lambda () (mu4e-message "Leaving Personal context"))
;;                                       ;; we match based on the contact-fields of the message
;;                                       :match-func (lambda (msg)
;;                                                     (when msg
;;                                                       (mu4e-message-contact-field-matches msg
;;                                                                                           :to "jonathan@terracrypt.net")))
;;                                       :vars '( ( user-mail-address	    . "jonathan@terracrypt.net"  )
;;                                                ( user-full-name	    . "Jonathan Frederickson" )
;;                                                (mu4e-sent-folder . "/Terracrypt/Sent")
;;                                                ( mu4e-compose-signature .
;;                                                  (concat
;;                                                   "Jonathan Frederickson\n")))))))

(use-package mu4e
  :ensure nil
  :config

  ;; Refresh mail using isync every 10 minutes
  ;;(setq mu4e-update-interval (* 10 60))
  ;;(setq mu4e-get-mail-command "mbsync -a")
  (setq mu4e-maildir "~/Maildir")

  (setq mu4e-contexts
        (list
         ;; Work account
         (make-mu4e-context
          :name "Personal"
          :match-func
            (lambda (msg)
              (when msg
                (string-prefix-p "/Terracrypt" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address . "jonathan@terracrypt.net")
                  (user-full-name    . "Jonathan Frederickson")
                  (mu4e-drafts-folder  . "/Terracrypt/Drafts")
                  (mu4e-sent-folder  . "/Terracrypt/Sent")
                  (mu4e-refile-folder  . "/Terracrypt/Archive")
                  (mu4e-trash-folder  . "/Terracrypt/Trash")))))

  (setq mu4e-maildir-shortcuts
        '(("/Terracrypt/Inbox"             . ?i)
          ("/Terracrypt/Sent" . ?s)
          ("/Terracrypt/Trash"     . ?t)
          ("/Terracrypt/Drafts"    . ?d)
          ("/Terracrypt/Archive"  . ?a))))

(setq mu4e-compose-format-flowed t)
(require 'org-re-reveal)

;;(setq message-send-mail-function 'sendmail-send-it)

(setq message-send-mail-function 'sendmail-send-it
      sendmail-program "msmtp"
      mail-specify-envelope-from t
      message-sendmail-envelope-from 'header
      mail-envelope-from 'header)

(defun run-erc ()
  (interactive)
  (erc-tls :server "chat.sr.ht"
           :nick "jfred"
           :user "jfred/irc.libera.chat@pocket-erc"))
