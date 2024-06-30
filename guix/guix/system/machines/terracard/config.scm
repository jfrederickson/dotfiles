;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules (gnu) (nongnu packages linux) (gnu packages wm)
             (system machines desktop-base)
             (system machines terracard hardware-configuration))
(use-service-modules cups desktop networking ssh xorg)

(operating-system
 (inherit hardware-configuration)
 (locale "en_US.utf8")
 (timezone "America/New_York")
 (host-name "terracard"))
