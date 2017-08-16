;; macOS specific - set the exec path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
