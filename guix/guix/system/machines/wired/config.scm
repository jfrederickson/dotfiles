(define-module (system machines wired config)
  #:use-module (gnu)
  #:use-module (gnu packages luanti)
  #:use-module (system machines server-base)
  #:use-module (system machines wired hardware-configuration))

(define-public wired-operating-system
  (operating-system
   (inherit hardware-configuration)
   (locale "en_US.utf8")
   (timezone "America/New_York")
   (host-name "wired")
   (packages
    (append
     (list luanti-server
           minetest-game
           luanti-voxelibre
           luanti-technic
           luanti-mobs-monster
           luanti-mobs-animal
           luanti-unified-inventory
           luanti-pipeworks
           luanti-mesecons
           luanti-homedecor-modpack
           luanti-advtrains
           luanti-basic-trains)
     (operating-system-packages hardware-configuration)))))
