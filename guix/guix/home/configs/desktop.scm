(define-module (home configs desktop)
  #:use-module (home packages kanshi)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages music)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnome-xyz)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages lxde)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages web-browsers)
  #:use-module (gnu packages xdisorg))
  ;;#:use-module (nongnu packages mozilla))

(define-public %jfred-desktop-packages
  (list foot
        sway
        swayidle
        jfred-kanshi
        adwaita-icon-theme
        arc-icon-theme
        ;;swaylock
        swaynotificationcenter
        wofi
        waybar
        wlr-randr
        pavucontrol
        font-adobe-source-code-pro
        font-google-noto-emoji
        font-google-material-design-icons
        font-awesome
        appmenu-gtk-module
        pasystray
        lxappearance
        playerctl))
        ;;firefox))
        ;;nyxt))
