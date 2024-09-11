(define-module (home configs desktop)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages web-browsers)
  #:use-module (gnu packages xdisorg)
  #:use-module (nongnu packages mozilla))

(define-public %jfred-desktop-packages
  (list foot
        sway
        swayidle
        ;;swaylock
        wofi
        waybar
        pavucontrol
        playerctl
        font-adobe-source-code-pro))
        ;;firefox))
        ;;nyxt))
