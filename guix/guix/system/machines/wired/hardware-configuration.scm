(define-module (system machines wired hardware-configuration)
  #:use-module (gnu)
  #:use-module (nongnu packages linux)
  #:use-module (system machines server-base))

(define-public hardware-configuration
  (operating-system
   (inherit jfred-server-base-system)
   (kernel linux)
   (firmware (list linux-firmware))
   (keyboard-layout (keyboard-layout "us"))

   (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))
                (keyboard-layout keyboard-layout)))

   (mapped-devices (list (mapped-device
                          (source (uuid
                                   "a1775b70-cfc4-44d5-9fc3-0ddaff9eb694"))
                          (target "cryptroot")
                          (type luks-device-mapping))))

   (file-systems (cons* (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "AF86-B19B"
                                       'fat32))
                         (type "vfat"))
                       (file-system
                         (mount-point "/")
                         (device "/dev/mapper/cryptroot")
                         (type "ext4")
                         (dependencies mapped-devices)) %base-file-systems))

   (host-name #f)))
