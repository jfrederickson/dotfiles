;; This is an operating system configuration template
;; for a "desktop" setup with GNOME and Xfce where the
;; root partition is encrypted with LUKS.

(use-modules (gnu) (gnu system nss)
             (srfi srfi-1)
             (gnu packages linux)
             (gnu packages xdisorg)
             (gnu packages package-management)
             (gnu services sddm)
             (gnu services xorg)
             (gnu packages xfce)
             (gnu services authentication)
             (gnu services dbus)
             (gnu services desktop)
             (gnu services linux)
             (gnu services sound)
             (gnu packages security-token)
             (gnu services security-token)
             (gnu packages certs)
             (gnu packages gnome)
             (gnu packages freedesktop)
             (gnu packages wm)
             (gnu services docker))
             ;;(gnu packages wireguard))
;;(use-service-modules desktop dbus)
;;(use-package-modules certs gnome)

(load "jfred-packages.scm")


(define %powertop-service
  (simple-service 'powertop activation-service-type
		  #~(zero? (system* #$(file-append powertop "/sbin/powertop")
				    "--auto-tune"))))

(define %u2f-udev-rule
  (file->udev-rule
    "70-u2f.rules"
    (local-file "udev/70-u2f.rules")))

(define %nfc-udev-rule
  (file->udev-rule
    "99-nfc.rules"
    (local-file "udev/99-nfc.rules")))

(define %trackpoint-udev-rule
  (file->udev-rule
   "10-trackpoint.rules"
   (local-file "udev/10-trackpoint.rules")))

(operating-system
  (host-name "lambdacrypt")
  (timezone "America/New_York")
  (locale "en_US.utf8")

  ;; Use the UEFI variant of GRUB with the EFI System
  ;; Partition mounted on /boot/efi.
  (bootloader (bootloader-configuration
                (bootloader grub-bootloader)
                (target "/dev/nvme0n1")))

  (initrd-modules (cons* "i915" %base-initrd-modules))

  ;; Specify a mapped device for the encrypted root partition.
  ;; The UUID is that returned by 'cryptsetup luksUUID'.
  (mapped-devices
   (list (mapped-device
          (source (uuid "c5534827-97d0-465c-9d4d-576a84fd2cf0"))
          (target "root")
          (type luks-device-mapping))))

  (file-systems (append (list (file-system
                               (device "/dev/mapper/root")
                               (mount-point "/")
                               (type "ext4")
                               (dependencies mapped-devices))
                              (file-system
                               (device (uuid "d48387cc-bed2-4fb5-b399-430fa632efc0"))
                               (mount-point "/boot")
                               (type "ext4")))
                        %base-file-systems))

  (swap-devices '("/swapfile"))

  (users (cons (user-account
                (name "jfred")
                (group "users")
                (supplementary-groups '("wheel" "netdev"
                                        "audio" "video"
                                        "lp" "plugdev"
                                        "dialout"))
                (home-directory "/home/jfred"))
               %base-user-accounts))

  (groups (cons (user-group
                 (name "plugdev"))
                %base-groups))

  ;; This is where we specify system-wide packages.
  (packages (cons* nss-certs         ;for HTTPS access
                   gvfs              ;for user mounts
		   sysfsutils
                   xfce4-screensaver
                   jfred:ladspa-bs2b
                   ;;xscreensaver
                   flatpak
                   xdg-desktop-portal
                   xdg-desktop-portal-gtk
                   i3-gaps
                   i3status
                   polybar
                   network-manager-applet
                   ;;wireguard-tools
                   sway
                   swaybg
                   swayidle
                   swaylock
                   bemenu
                   %base-packages))

  ;; Add GNOME and/or Xfce---we can choose at the log-in
  ;; screen with F1.  Use the "desktop" services, which
  ;; include the X11 log-in service, networking with
  ;; NetworkManager, and more.
  (services (cons* (service gnome-desktop-service-type)
		   (service xfce-desktop-service-type)
                   (service mate-desktop-service-type)
                   ;;(service fprintd-service-type)
                   (service pcscd-service-type)
                   (service docker-service-type)
                   (service earlyoom-service-type)
                   (screen-locker-service xfce4-screensaver "xfce4-screensaver")
                   (screen-locker-service xscreensaver)
                   ;;(service dbus-root-service-type
                   ;;         (dbus-configuration (services (list xfce4-screensaver))))
                   ;;(service dbus-service)
                   ;;(service bluetooth-service-type ;; removed temporarily due to bluetooth vuln
                   ;;         (bluetooth-configuration
                   ;;          (auto-enable? #t)))
                   (service ladspa-service-type
                            (ladspa-configuration (plugins (list jfred:ladspa-bs2b))))
                   (service sddm-service-type
                            (sddm-configuration
                             (display-server "wayland")
                             (remember-last-user? #t)))
                   ;;(modify-services %desktop-services
                   ;;  (dbus-root-service-type
                   ;;   config =>
                   ;;   (dbus-configuration (inherit config)
                   ;;                       (services (cons* xfce4-screensaver
                   ;;                                        (dbus-configuration-services config))))))
                   %powertop-service
                   (modify-services
                    %desktop-services
                    (delete gdm-service-type)
                    (udev-service-type
                     config =>
                     (udev-configuration (inherit config)
                                         (rules (cons* libu2f-host
                                                       %trackpoint-udev-rule
                                                       (udev-configuration-rules config))))))))
  ;;(modify-services %desktop-services
                   ;;                 (udev-service-type config =>
                   ;;                                    (udev-configuration (inherit config)
                   ;;                                                        (rules (append (udev-configuration-rules config)
                   ;;                                                                       (list %u2f-udev-rule %nfc-udev-rule))))))))

  ;; Allow resolution of '.local' host names with mDNS.
  (name-service-switch %mdns-host-lookup-nss))
