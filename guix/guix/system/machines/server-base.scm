(define-module (system machines server-base)
  #:use-module (srfi srfi-1)
  #:use-module (guix gexp)
  #:use-module (gnu)
  #:use-module (gnu system)
  #:use-module (gnu packages wm)
  #:use-module (gnu services xorg)
  #:use-module (gnu services desktop)
  #:use-module (gnu services docker)
  #:use-module (gnu services cups)
  #:use-module (gnu services dbus)
  #:use-module (gnu services networking)
  #:use-module (gnu services security-token)
  #:use-module (gnu services sddm)
  #:use-module (gnu services ssh)
  #:use-module (system machines base))

(define-public jfred-server-base-system
  (operating-system
   ;; Set these in hardware-configuration.scm
   (bootloader #f)
   (host-name #f)
   (file-systems #f)
   (sudoers-file
     (plain-file "sudoers"
                 (string-append (plain-file-content %sudoers-specification)
                                (format #f "~a ALL = NOPASSWD: ALL~%"
                                        "jfred"))))

   ;; Base configs for my servers
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
            (service openssh-service-type
                     (openssh-configuration
                      (use-pam? #f)))
            (service elogind-service-type)
            (service dhcpcd-service-type)
            (service dbus-root-service-type)
            (service docker-service-type)
            (service containerd-service-type)
            (service ntp-service-type))
           (jfred-append-base-services %base-services)))))
