;;;  -*- lexical-binding: t; -*-

;; (require 'doom-themes)
;; (load-theme 'doom-challenger-deep)
;; (load-theme 'doom-acario-dark) ;;an original dark theme (thanks to gagbo)
;; (load-theme 'doom-acario-light) ;;an original light theme (thanks to gagbo)
;; (load-theme 'doom-city-lights) ;;based on Atom's City lights (thanks to fuxialexander)
;; (load-theme 'doom-challenger-deep) ;;based on Vim's Challenger deep theme (thanks to fuxialexander)
;; (load-theme 'doom-dark+ ported from VS Code's Dark+ theme (thanks to ema2159)
;; (load-theme 'doom-dracula) ;;an implementation of Dracula theme (thanks to fuxialexander)
;; (load-theme 'doom-ephemeral) ;;inspired in the Ephemeral Theme from elenapan's dotfiles (thanks to karetsu)
;; (load-theme 'doom-fairy-floss) ;;a candy colored Sublime theme by sailorhg (thanks to ema2159)
;; (load-theme 'doom-gruvbox) ;;adapted from Morhetz's Gruvbox (thanks to JongW)
;; (load-theme 'doom-horizon) ;;ported from VS Code's Horizon (thanks to karetsu)
;; (load-theme 'doom-Iosvkem) ;;adapted from Iosvkem (thanks to neutaaaaan)
;; (load-theme 'doom-laserwave) ;;a clean 80's synthwave / outrun theme inspired by VS Code's laserwave (thanks to hyakt)
;; (load-theme 'doom-material) ;; adapted from Material Themes (thanks to tam5)
;; (load-theme 'doom-manegarm) ;;an original autumn-inspired dark theme (thanks to kenranunderscore)
;; (load-theme 'doom-molokai) ;;a theme based on Texmate's Monokai
;; (load-theme 'doom-monokai-classic) ;;port of Monokai's Classic variant (thanks to ema2159)
;; (load-theme 'doom-monokai-pro) ;;port of Monokai's Pro variant (thanks to kadenbarlow)
;; (load-theme 'doom-moonlight) ;;ported from VS Code's Moonlight Theme (thanks to Brettm12345)
;; (load-theme 'doom-nord) ;;dark variant of Nord (thanks to fuxialexander)
;; (load-theme 'doom-nord-light) ;;light variant of Nord (thanks to fuxialexander)
;; (load-theme 'doom-nova) ;;adapted from Nova (thanks to bigardone)
;; (load-theme 'doom-oceanic-next) ;;adapted from Oceanic Next theme (thanks to juanwolf)
;; (load-theme 'doom-opera) ;;an original dark theme (thanks to jwintz)
;; (load-theme 'doom-opera-light) ;;an original light theme (thanks to jwintz)
;; (load-theme 'doom-outrun-electric) ;;a neon colored theme inspired in VS Code's Outrun Electric (thanks to ema2159)
;; (load-theme 'doom-palenight) ;;adapted from Material Themes (thanks to Brettm12345)
(load-theme 'doom-peacock) ;;based on Peacock from daylerees' themes (thanks to teesloane)
;; (load-theme 'doom-rouge) ;;ported from VSCode's Rouge Theme (thanks to JordanFaust)
;; (load-theme 'doom-snazzy) ;;a dark theme inspired in Atom's Hyper Snazzy (thanks to ar1a)
;; (load-theme 'doom-solarized-dark) ;;dark variant of Solarized (thanks to ema2159)
;; (load-theme 'doom-solarized-light) ;;light variant of Solarized (thanks to fuxialexander)
;; (load-theme 'doom-sourcerer) ;;based on Sourcerer (thanks to defphil)
;; (load-theme 'doom-spacegrey) ;;I'm sure you've heard of it (thanks to teesloane)
;; (load-theme 'doom-tomorrow-day) ;;Tomorrow's light variant (thanks to emacswatcher)
;; (load-theme 'doom-tomorrow-night) ;;one of the dark variants of Tomorrow (thanks to emacswatcher)
;; (load-theme 'doom-wilmersdorf) ;;port of Ian Pan's Wilmersdorf (thanks to ema2159)

(setq doom-font (font-spec :family "PragmataPro Liga 1.1" :size 23))
;; (setq doom-font (font-spec :family "SF Mono" :size 19))
(setq doom-variable-pitch-font (font-spec :family "SF Pro Display" :size 17))
;; (setq doom-variable-pitch-font (font-spec :family "Roboto" :size 15))
;; (setq doom-font (font-spec :family "Monoid" :size 19))
;; (set-face-foreground 'font-lock-preprocessor-face (doom-darken 'blue 0.3))
;; (set-face-foreground 'font-lock-variable-name-face (doom-lighten 'blue 0.4))
(set-face-foreground 'font-lock-variable-name-face (doom-lighten 'cyan 0.4))
;; (set-face-foreground 'font-lock-function-name-face (doom-color 'red))
;; (set-face-foreground 'font-lock-comment-face (doom-darken 'magenta 0.3))
(set-face-foreground 'font-lock-comment-face (doom-blend (doom-darken 'cyan 0.2) (doom-color 'grey) 0.5))
(set-face-bold 'font-lock-type-face t)
(set-face-bold 'font-lock-function-name-face t)
(set-face-background 'font-lock-string-face (doom-lighten 'bg 0.05))

(after! hl-line
  (set-face-background 'hl-line (doom-lighten 'bg 0.2))
  )

(after! company
  (set-face-foreground 'company-tooltip-selection (doom-color 'black))
  (set-face-foreground 'company-tooltip-common (doom-color 'black))
  (set-face-foreground 'company-tooltip-annotation (doom-color 'grey))
  )

(after! haskell-mode
  (set-face-foreground 'haskell-keyword-face "coral")
  (set-face-foreground 'haskell-pragma-face (doom-color 'red))
  (set-face-background 'haskell-pragma-face (doom-darken 'bg 0.5))
  (set-face-foreground 'haskell-operator-face (doom-color 'orange))
  (set-face-foreground 'haskell-definition-face (doom-color 'blue))
  (set-face-foreground 'haskell-quasi-quote-face (doom-color 'magenta))
  (set-face-bold 'haskell-type-face t)
  (set-face-bold 'haskell-definition-face t)
  )

(after! hl-todo
  (setq hl-todo-keyword-faces
        `(("TODO"  . ,(face-foreground 'warning))
          ("FIXME" . ,(face-foreground 'error))
          ("XXX" . ,(face-foreground 'error))
          ("NOTE"  . ,(face-foreground 'success))))
  )

(after! treemacs
  (set-face-attribute 'treemacs-root-face nil :height 1.6)
  (set-face-bold 'treemacs-root-face t)
  )

;;; rust
(after! rustic
  (set-face-italic 'rustic-string-interpolation-face nil)
  (set-face-foreground 'rustic-string-interpolation-face
                       (doom-lighten 'fg 0.1))
  )
