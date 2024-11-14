(define-module (home configs desktop)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages music)
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
        kanshi
        wofi
        waybar
        wlr-randr
        pavucontrol
        font-adobe-source-code-pro
        font-google-noto-emoji
        playerctl))
        ;;firefox))
        ;;nyxt))
