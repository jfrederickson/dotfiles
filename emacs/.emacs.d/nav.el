;; Toggles window split from horizontal to vertical
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))

(defun yank-with-indent ()
  (interactive)
  (let ((indent
         (buffer-substring-no-properties (line-beginning-position) (line-end-position))))
    (message indent)
    (yank)
    (narrow-to-region (mark t) (point))
    (pop-to-mark-command)
    (replace-string "\n" (concat "\n" indent))
    (widen)))

;;; Stefan Monnier <foo at acm.org>. It is the opposite of 
;;; fill-paragraph. Takes a multi-line paragraph and makes 
;;; it into a single line of text.
(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

;; Lines to comma-separated list, from https://stackoverflow.com/questions/17922208/emacs-convert-items-on-separate-lines-to-a-comma-separated-list/26433323
(defun lines-to-cslist (start end &optional arg)
  (interactive "r\nP")
  (let ((insertion
         (mapconcat 
          (lambda (x) (format "%s" x))
          (split-string (buffer-substring start end)) ", ")))
    (delete-region start end)
    (insert insertion)
    (when arg (forward-char (length insertion)))))

;; Get a block of text at the indentation level of the first
;; line. Useful for e.g. running commands on indented YAML strings
(defun get-indented-text (start end)
  (let ((linestart
         (save-excursion
           (goto-char start)
           (move-beginning-of-line nil)))
        (lineend
         (save-excursion
           (goto-char end)
           (move-end-of-line nil)
           (point)))
        (indentlevel
         (save-excursion
           (goto-char start)
           (back-to-indentation)
           (current-column))))
    (save-excursion
      (let ((buf (make-temp-name "indentcopy")))
        (copy-to-buffer buf linestart lineend)
        (set-buffer buf)
        (let ((rectend
               (save-excursion
                 (goto-char lineend)
                 (move-beginning-of-line nil)
                 (forward-char indentlevel)
                 (point))))
          (kill-rectangle (point-min) rectend)
          (let ((result (buffer-substring (point-min) (point-max))))
            (kill-buffer buf)
            result))))))

(defun gpg-analyze (start end)
  (interactive "r")
  (if (use-region-p)
      (save-excursion
        (let ((encrypted (get-indented-text start end)))
          (with-temp-buffer
            (insert encrypted)
            (shell-command-on-region (point-min) (point-max) "gpg --list-packets"))))))

(defun ssl-analyze (start end)
  (interactive "r")
  (if (use-region-p)
      (save-excursion
        (let ((cert (get-indented-text start end)))
          (with-temp-buffer
            (insert cert)
            (shell-command-on-region (point-min) (point-max) "openssl x509 -text -noout"))))))

(defun interactive-get-indent (start end)
  (interactive "r")
  (if (use-region-p)
      (message (get-indented-text start end))))

;; Accept prefix arg to avoid linebreaks in base64-encode-region
(defun base64-encode-region-prefix-arg (&rest _args)
  "Pass prefix arg as third arg to `base64-encode-region'."
  (interactive "r\nP"))
(advice-add 'base64-encode-region :before #'base64-encode-region-prefix-arg)

(define-key ctl-x-4-map "t" 'toggle-window-split)
(global-set-key (kbd "C-x |") 'toggle-window-split)

;; Helm keybindings
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
;;(global-set-key (kbd "C-x g b") 'helm-bookmarks)

;; Dash keybindings
(global-set-key (kbd "C-x ?") 'helm-dash)
(global-set-key (kbd "C-x /") 'helm-dash-at-point)

;; Magit keybindings
(global-set-key (kbd "C-c g s") 'magit-status)
(global-set-key (kbd "C-c g b") 'magit-blame)
(global-set-key (kbd "C-c g c") 'magit-clone)
(global-set-key (kbd "C-c g l") 'git-link)
(global-set-key (kbd "C-c <") 'smerge-keep-mine)
(global-set-key (kbd "C-c >") 'smerge-keep-other)
(global-set-key (kbd "C-c n") 'smerge-next)

;; Guix keybindings
(global-set-key (kbd "C-c g g") 'guix)

;; Search for stuff
(global-set-key (kbd "C-c s") 'ag)

;; Mingus keybindings
;;(global-set-key (kbd "C-x p") 'mingus-toggle)
;;(global-set-key (kbd "C-x \\") 'mingus-next)

;; Org-Mode keybindings
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)

;; Elfeed keybindings
(global-set-key (kbd "C-c f") 'elfeed)

;; Avy keybindings
(global-set-key (kbd "C-c j") 'avy-goto-word-or-subword-1)
(global-set-key (kbd "s-w") 'ace-window)
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)

;; Pass keybindings
(global-set-key (kbd "C-c p c") 'password-store-copy)
(global-set-key (kbd "C-c p g") 'password-store-generate)
(global-set-key (kbd "C-c p e") 'password-store-edit)

;; Hideshow keybindings
(global-set-key (read-kbd-macro "<C-tab>") 'hs-toggle-hiding)

;; Docker keybindings
(global-set-key (kbd "C-c d") 'docker)
(global-set-key (kbd "C-c k") 'kubernetes-overview)


;;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ;; two lines at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;; Quickly switch between windows without the mouse
(global-set-key (kbd "C-.") #'other-window)
(global-set-key (kbd "C-,") #'prev-window)
(defun prev-window ()
  (interactive)
  (other-window -1))

;; Make a new eshell buffer (equivalent to C-u M-x eshell)
(defun new-eshell ()
  (interactive)
  (let ((current-prefix-arg '(4)))
    (call-interactively 'eshell)))

;; Make a new eshell frame
(global-set-key (kbd "s-n") (lambda () (interactive) (select-frame (make-frame)) (funcall #'new-eshell)))
;; Start a new terminal
(global-set-key (kbd "C-x t") 'ansi-term)

(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'super))

(setq yequake-frames
      '(("Scratch" .
         ((width . 0.85)
          (height . 0.75)
          (alpha . 0.95)
          (buffer-fns . ("*scratch*"))
          (frame-parameters . ((undecorated . t)))))))

(global-set-key (kbd "C-;") 'er/expand-region)
