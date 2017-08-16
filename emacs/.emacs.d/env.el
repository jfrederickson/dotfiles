;; macOS specific - set the exec path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(exec-path-from-shell-copy-env "SSH_AUTH_SOCK")

(require 'better-defaults)


