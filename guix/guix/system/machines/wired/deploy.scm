(define-module (system machines wired deploy)
  #:use-module (system machines wired config)
  #:use-module (gnu machine)
  #:use-module (gnu machine ssh))

(list (machine
       (operating-system wired-operating-system)
       (environment managed-host-environment-type)
       (configuration (machine-ssh-configuration
                       (host-name "wired.jfred.home")
                       (system "x86_64-linux")
                       (build-locally? #f)
                       (user "jfred")
                       (identity "~/.ssh/id_rsa")
                       (host-key "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO2YQajUExNyT6WWtnOg784/aihdwMnRYoOxz/jEHSQi root@(none)")
                       (port 22)))))
