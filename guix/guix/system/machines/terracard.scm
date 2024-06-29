;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules (gnu) (nongnu packages linux) (gnu packages wm)
             (system machines hardware terracard))
(use-service-modules cups desktop networking ssh xorg)

(operating-system
 (inherit hardware-configuration)
 (locale "en_US.utf8")
 (timezone "America/New_York")
 (host-name "terracard")

  ;; The list of user accounts ('root' is implicit).
  (users (cons* (user-account
                  (name "jfred")
                  (comment "Jonathan Frederickson")
                  (group "users")
                  (home-directory "/home/jfred")
                  (supplementary-groups '("wheel" "netdev" "audio" "video")))
                %base-user-accounts))
  
  (packages %base-packages)
  
  (services
   (append (list
            (service screen-locker-service-type
                     (screen-locker-configuration
                      (name "swaylock")
                      (program (file-append swaylock "/bin/swaylock"))
                      (using-setuid? #f)
                      (using-pam? #t)))
                 (set-xorg-configuration
                  (xorg-configuration (keyboard-layout
                                       (operating-system-keyboard-layout
                                        hardware-configuration)))))

           ;; This is the default list of services we
           ;; are appending to.
           (modify-services %desktop-services
                            (delete gdm-service-type)))))
