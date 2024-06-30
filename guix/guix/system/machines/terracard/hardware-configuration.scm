(define-module (system machines terracard hardware-configuration)
  #:use-module (gnu)
  #:use-module (nongnu packages linux)
  #:use-module (gnu packages wm))

(define-public hardware-configuration
  (operating-system
   (kernel linux)
   (firmware (list linux-firmware))
   (keyboard-layout (keyboard-layout "us"))
   (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))
                (keyboard-layout keyboard-layout)))

   (initrd-modules (append '("mmc_block" "sdhci_pci") %base-initrd-modules))
   (mapped-devices (list (mapped-device
                          (source (uuid
                                   "6d741295-0025-4832-a2e0-b622106c1903"))
                          (target "cryptroot")
                          (type luks-device-mapping))))

   ;; The list of file systems that get "mounted".  The unique
   ;; file system identifiers there ("UUIDs") can be obtained
   ;; by running 'blkid' in a terminal.
   (file-systems (cons* (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "11E3-B395"
                                       'fat16))
                         (type "vfat"))
                        (file-system
                         (mount-point "/")
                         (device "/dev/mapper/cryptroot")
                         (type "ext4")
                         (dependencies mapped-devices)) %base-file-systems))

   (host-name #f)))
