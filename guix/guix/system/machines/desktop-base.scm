(define-module (system machines desktop-base)
  #:use-module (gnu)
  #:use-module (gnu packages wm)
  #:use-module (gnu services xorg)
  #:use-module (gnu services desktop)
  #:use-module (gnu services cups)
  #:use-module (gnu services networking)
  #:use-module (gnu services security-token)
  #:use-module (gnu services ssh))

(define-public jfred-desktop-base-system
  (operating-system
   ;; Set these in hardware-configuration.scm
   (bootloader #f)
   (host-name #f)
   (file-systems #f)

   ;; Base configs for my desktop systems
   (locale "en_US.utf8")
   (keyboard-layout (keyboard-layout "us"))
   (timezone "America/New_York")
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
            (service pcscd-service-type)
            (set-xorg-configuration
             (xorg-configuration (keyboard-layout
                                  keyboard-layout))))

           ;; This is the default list of services we
           ;; are appending to.
           (modify-services %desktop-services
                            (delete gdm-service-type))))))
