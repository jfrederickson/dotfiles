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

(define-key ctl-x-4-map "t" 'toggle-window-split)
(global-set-key (kbd "C-x |") 'toggle-window-split)

;; Helm keybindings
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x g b") 'helm-bookmarks)

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
