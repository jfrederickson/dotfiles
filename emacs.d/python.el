(setq python-shell-interpreter "/usr/bin/python")
(setq jedi:environment-virtualenv
      (list "virtualenv" "--system-site-packages"))

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional
