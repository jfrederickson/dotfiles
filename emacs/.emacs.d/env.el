;; macOS specific - set the exec path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(exec-path-from-shell-initialize)

(exec-path-from-shell-copy-env "SSH_AUTH_SOCK")
;;(setenv "SSH_AUTH_SOCK" (shell-command-to-string "gpgconf --list-dir agent-ssh-socket"))

(use-package better-defaults)

;; Enable project awareness
(projectile-mode)

;; Fuzzy completion
(setq completion-styles '(basic partial-completion emacs22 flex))

;; Enable my common docsets in helm-dash
(setq helm-dash-docsets '("SaltStack" "Kubernetes" "Python 3"))

(use-package org
  :mode (("\\.org$" . org-mode))
  :config
  (progn
  ;; Set up org-mode the way I want it
    (setq org-directory "~/org")
    (setq org-agenda-files (mapcar (lambda (x) (concat org-directory x)) '("/Inbox.org" "/Next.org" "/Someday.org" "/Recurring.org")))
    (setq org-refiles-jfred (mapcar (lambda (x) (concat org-directory x)) '("/Inbox.org" "/Next.org" "/Someday.org" "/Complete.org" "/Recurring.org")))
    (setq org-refile-targets '((org-refiles-jfred :maxlevel . 1)))
    (setq org-refile-use-outline-path 'file)
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
             "* Meeting Notes - %?")))))

(setq org-agenda-include-diary t)

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
  :commands 'mu4e
  :config

  ;; Refresh mail using isync every 10 minutes
  ;;(setq mu4e-update-interval (* 10 60))
  (setq mu4e-get-mail-command "offlineimap")
  (setq mu4e-maildir "~/Maildir")
  (setq message-confirm-send t)

  (define-key mu4e-headers-mode-map (kbd "C-c c") 'mu4e-org-store-and-capture)
  (define-key mu4e-view-mode-map    (kbd "C-c c") 'mu4e-org-store-and-capture)

  (setq mu4e-contexts
        (list
         ;; Personal account
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
                  (mu4e-trash-folder  . "/Terracrypt/Trash")))
         (make-mu4e-context
          :name "Hive76"
          :match-func
          (lambda (msg)
            (when msg
              (string-prefix-p "/Hive76" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address . "jfred@hive76.org")
                  (user-full-name . "Jonathan Frederickson")
                  (mu4e-drafts-folder . "/Hive76/Drafts")
                  (mu4e-sent-folder . "/Hive76/[Gmail].Sent Mail")
                  (mu4e-refile-folder . "/Hive76/[Gmail].All Mail")
                  (mu4e-trash-folder . "/Hive76/[Gmail].Trash")))
         (make-mu4e-context
          :name "Work"
          :match-func
            (lambda (msg)
              (when msg
                (string-prefix-p "/Work" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address . "jfrederi@akamai.com")
                  (user-full-name    . "Jonathan Frederickson")
                  (mu4e-drafts-folder  . "/Work/Drafts")
                  (mu4e-sent-folder  . "/Work/Sent Items")
                  (mu4e-refile-folder  . "/Work/Archive")
                  (mu4e-trash-folder  . "/Work/Deleted Items")))))

  (setq mu4e-bookmarks
        '(( :name  "Unread messages in inbox"
            :query "flag:unread AND NOT flag:trashed AND (maildir:/Terracrypt/Inbox OR maildir:/Hive76/INBOX)"
            :key ?u)
          ( :name "All messages in inboxes"
            :query "maildir:/Terracrypt/Inbox OR maildir:/Hive76/INBOX"
            :key ?i)
          ( :name "Today's messages"
            :query "date:today..now"
            :key ?t)
          ( :name "Last 7 days"
            :query "date:7d..now"
            :hide-unread t
            :key ?w)))
  (setq mu4e-maildir-shortcuts
        '(("/Terracrypt/Inbox"             . ?i)
          ("/Terracrypt/Sent" . ?s)
          ("/Terracrypt/Trash"     . ?t)
          ("/Terracrypt/Drafts"    . ?d)
          ("/Hive76/INBOX" . ?h)))

  (setq mu4e-compose-format-flowed t))

(use-package org-re-reveal
  :after 'org-mode)

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

(use-package elfeed
  :commands 'elfeed
  :config
  (progn
;; TODO Add netrc to elfeed-curl-extra-arguments
;; https://old.reddit.com/r/emacs/comments/8mcpd9/elegant_way_to_provide_encrypted_credentials_to/dzml1hu/
;; And get CA cert stuff working with curl backend
    (setq elfeed-use-curl nil)))

(use-package elfeed-protocol
  :after 'elfeed
  :config
  (progn
    (setq elfeed-protocol-ttrss-maxsize 200) ;; bigger than 200 is invalid
    (setq elfeed-protocol-feeds
          '(
            ("ttrss+https://sandstorm@api-c12c97900b429f1a6192f5f294010f3b.sandstorm.terracrypt.net"
             :use-authinfo t
             )))

    (setq elfeed-protocol-enabled-protocols '(ttrss))

    (elfeed-protocol-enable)))

;; Temp bugfix
;; https://ph-uhl.com/emacs-password-management-on-linux/
(defun secrets-unlock-item (collection item)
  "Unlock item labeled ITEM from collection labeled COLLECTION.
  If successful, return the object path of the item."
  (let ((item-path (secrets-item-path collection item)))
    (unless (secrets-empty-path item-path)
      (secrets-prompt
       (cadr
        (dbus-call-method
         :session secrets-service secrets-path secrets-interface-service
         "Unlock" `(:array :object-path ,item-path)))))
    item-path))

(defun secrets-get-secret (collection item)
  "Return the secret of item labeled ITEM in COLLECTION.
    If there are several items labeled ITEM, it is undefined which
    one is returned.  If there is no such item, return nil.

    ITEM can also be an object path, which is used if contained in COLLECTION."
  (let ((item-path (secrets-unlock-item collection item)))
    (unless (secrets-empty-path item-path)
      (dbus-byte-array-to-string
       (nth 2
            (dbus-call-method
             :session secrets-service item-path secrets-interface-item
             "GetSecret" :object-path secrets-session-path))))))

(setq auth-sources '(default
                     "secrets:app-secrets"
                     "~/.authinfo"))
