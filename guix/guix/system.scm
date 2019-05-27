;; This is an operating system configuration template
;; for a "desktop" setup with GNOME and Xfce where the
;; root partition is encrypted with LUKS.

(use-modules (gnu) (gnu system nss)
             (gnu packages linux)
             (gnu services xorg)
             (gnu services authentication)
             (gnu services security-token)
             (gnu services docker))
(use-service-modules desktop)
(use-package-modules certs gnome)

(operating-system
  (host-name "lambdacrypt")
  (timezone "America/New_York")
  (locale "en_US.utf8")

  ;; Use the UEFI variant of GRUB with the EFI System
  ;; Partition mounted on /boot/efi.
  (bootloader (bootloader-configuration
                (bootloader grub-bootloader)
                (target "/dev/sda")))

  (initrd-modules (cons* "i915" %base-initrd-modules))

  ;; Specify a mapped device for the encrypted root partition.
  ;; The UUID is that returned by 'cryptsetup luksUUID'.
  (mapped-devices
   (list (mapped-device
          (source (uuid "2cff4602-b5d1-4738-bd88-efa6a6c5e96f"))
          (target "root")
          (type luks-device-mapping))))

  (file-systems (append (list (file-system
                               (device "/dev/mapper/root")
                               (mount-point "/")
                               (type "ext4")
                               (dependencies mapped-devices))
                              (file-system
                               (device "/dev/sda1")
                               (mount-point "/boot")
                               (type "ext4")))
                        %base-file-systems))

  (users (cons (user-account
                (name "jfred")
                (group "users")
                (supplementary-groups '("wheel" "netdev"
                                        "audio" "video"))
                (home-directory "/home/jfred"))
               %base-user-accounts))

  ;; This is where we specify system-wide packages.
  (packages (cons* nss-certs         ;for HTTPS access
                   gvfs              ;for user mounts
		   sysfsutils
                   %base-packages))

  ;; Add GNOME and/or Xfce---we can choose at the log-in
  ;; screen with F1.  Use the "desktop" services, which
  ;; include the X11 log-in service, networking with
  ;; NetworkManager, and more.
  (services (cons* (service gnome-desktop-service-type)
		   (service xfce-desktop-service-type)
                   (service fprintd-service-type)
                   (service pcscd-service-type)
                   (service docker-service-type)
                   %desktop-services))

  ;; Allow resolution of '.local' host names with mDNS.
  (name-service-switch %mdns-host-lookup-nss))