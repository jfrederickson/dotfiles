(define-module (home configs sway)
  #:use-module (guix gexp)
  #:use-module (gnu services)
  #:use-module (gnu home services))

(define-public %sway-config-services
  (list
   (simple-service
    'sway-config-service
    home-xdg-configuration-files-service-type
    `(("sway/config" ,(local-file "../../../../sway/.config/sway/config"))))
   (simple-service
    'waybar-config-service
    home-xdg-configuration-files-service-type
    `(("waybar/config" ,(local-file "../files/waybar/config"))
      ("waybar/style.css" ,(local-file "../files/waybar/style.css"))))
   (simple-service
    'wallpaper-service
    home-files-service-type
    `((".wallpapers/gnu-art.jpg" ,(local-file "../files/wallpapers/gnu-art.jpg"))
      (".wallpapers/user-manual.jpg" ,(local-file "../files/wallpapers/user-manual.jpg"))
      (".wallpapers/frieren.jpg" ,(local-file "../files/wallpapers/frieren.jpg"))))
   (simple-service
    'foot-service
    home-xdg-configuration-files-service-type
    `(("foot/foot.ini" ,(local-file "../files/foot/foot.ini"))))))

