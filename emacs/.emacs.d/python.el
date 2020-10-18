;;(setq python-shell-interpreter "/usr/local/bin/python3")
(setq python-shell-interpreter "/usr/local/Cellar/python/3.7.7/Frameworks/Python.framework/Versions/3.7/bin/python3.7")
;;(setq jedi:environment-virtualenv
;;      (list "/Users/jfrederickson/Library/Python/3.7/bin/virtualenv" "--system-site-packages"))
;;(setq elpy-rpc-virtualenv-path "/Users/jfrederickson/Library/Python/3.7/bin/virtualenv")

(setq elpy-rpc-python-command "python")
(setq python-shell-interpreter "python")

(setq elpy-shell-echo-output nil) ;; avoids ^G spam when sending python code to repl

(add-hook 'python-mode-hook 'jedi:setup)
(elpy-enable)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional
