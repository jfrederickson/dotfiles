(define-module (system machines server-base)
  #:use-module (srfi srfi-1)
  #:use-module (guix gexp)
  #:use-module (gnu)
  #:use-module (gnu packages wm)
  #:use-module (gnu services xorg)
  #:use-module (gnu services desktop)
  #:use-module (gnu services cups)
  #:use-module (gnu services networking)
  #:use-module (gnu services security-token)
  #:use-module (gnu services sddm)
  #:use-module (gnu services ssh)
  #:use-module (system machines base))

(define (jfred-append-base-services base)
  (modify-services base
    (guix-service-type config =>
                       (guix-configuration
                        (inherit config)
                        ;; Fetch substitutes from example.org.
                        (substitute-urls
                          (list "https://substitutes.nonguix.org"
                                "https://ci.guix.gnu.org"
                                "https://bordeaux.guix.gnu.org"))
                        (authorized-keys
                         (append (list (local-file "../keyring/terracard.pub")
                                       (local-file "../keyring/wired.pub"))
                                 %default-authorized-guix-keys))))))

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
            (service pcscd-service-type))
           (jfred-append-base-services %base-services))))
