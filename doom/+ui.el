;;;  -*- lexical-binding: t; -*-

;; (require 'doom-themes)
;; (load-theme 'doom-one t) ;; doom-themes' flagship theme, inspired by Atom's One Dark themes
;; (load-theme 'doom-one-light t) ;; light version of doom-one (thanks to ztlevi)
;;;;(load-theme 'doom-acario-dark t) ;; an original dark theme (thanks to gagbo)
;;;; (load-theme 'doom-acario-light t) ;; an original light theme (thanks to gagbo)
;; (load-theme 'doom-city-lights t) ;; based on Atom's City lights (thanks to fuxialexander)
;; (load-theme 'doom-challenger-deep t) ;; based on Vim's Challenger deep theme (thanks to fuxialexander)
;;;;(load-theme 'doom-dark+) ;; ported from VS Code's Dark+ theme (thanks to ema2159)
;; (load-theme 'doom-dracula t) ;; an implementation of Dracula theme (thanks to fuxialexander)
;;;;(load-theme 'doom-ephemeral t) ;; inspired in the Ephemeral Theme from elenapan's dotfiles (thanks to karetsu)
;; (load-theme 'doom-fairy-floss t) ;; a candy colored Sublime theme by sailorhg (thanks to ema2159)
;; broken? (load-theme 'doom-flatwhite t) ;; a unique light theme ported from Flatwhite Syntax (thanks to ShaneKilkelly)
;; (load-theme 'doom-gruvbox t) ;; adapted from Morhetz's Gruvbox (thanks to JongW)
;; (load-theme 'doom-gruvbox-light t) ;; adapted from Morhetz's Gruvbox light variant (thanks for jsoa)
;;;; (load-theme 'doom-henna t) ;; based on VS Code's Henna (thanks to jsoa)
;;;; (load-theme 'doom-horizon t) ;; ported from VS Code's Horizon (thanks to karetsu)
;;;; (load-theme 'doom-Iosvkem t) ;; adapted from Iosvkem (thanks to neutaaaaan)
;;;; (load-theme 'doom-laserwave t) ;; a clean 80's synthwave / outrun theme inspired by VS Code's laserwave (thanks to hyakt)
;; (load-theme 'doom-material t) ;; adapted from Material Themes (thanks to tam5)
;;;; (load-theme 'doom-manegarm t) ;; an original autumn-inspired dark theme (thanks to kenranunderscore)
;; broken? (load-theme 'doom-miramare t) ;; a port of Franbach's Miramare, a variant of gruvbox theme (thanks to sagittaros)
;; (load-theme 'doom-molokai t) ;; a theme based on Texmate's Monokai
;; (load-theme 'doom-monokai-classic t) ;; port of Monokai's Classic variant (thanks to ema2159)
;; (load-theme 'doom-monokai-pro t) ;; port of Monokai's Pro variant (thanks to kadenbarlow)
;; (load-theme 'doom-moonlight t) ;; ported from VS Code's Moonlight Theme (thanks to Brettm12345)
;; (load-theme 'doom-nord t) ;; dark variant of Nord (thanks to fuxialexander)
;; (load-theme 'doom-nord-light t) ;; light variant of Nord (thanks to fuxialexander)
;; (load-theme 'doom-nova t) ;; adapted from Nova (thanks to bigardone)
;; (load-theme 'doom-oceanic-next t) ;; adapted from Oceanic Next theme (thanks to juanwolf)
;; (load-theme 'doom-old-hope t) ;; based on An Old Hope theme (thanks to teesloane)
;; (load-theme 'doom-opera t) ;; an original dark theme (thanks to jwintz)
;; (load-theme 'doom-opera-light t) ;; an original light theme (thanks to jwintz)
;; (load-theme 'doom-outrun-electric t) ;; a neon colored theme inspired in VS Code's Outrun Electric (thanks to ema2159)
;; (load-theme 'doom-palenight t) ;; adapted from Material Themes (thanks to Brettm12345)
;; (load-theme 'doom-plain t) ;; based on plain (thanks to mateossh)
;; (load-theme 'doom-peacock t) ;; based on Peacock from daylerees' themes (thanks to teesloane)
;; (load-theme 'doom-rouge t) ;; ported from VSCode's Rouge Theme (thanks to JordanFaust)
;; (load-theme 'doom-snazzy t) ;; a dark theme inspired in Atom's Hyper Snazzy (thanks to ar1a)
;; (load-theme 'doom-solarized-dark t) ;; dark variant of Solarized (thanks to ema2159)
;; (load-theme 'doom-solarized-light t) ;; light variant of Solarized (thanks to fuxialexander)
;;;;(load-theme 'doom-sourcerer t) ;; based on Sourcerer (thanks to defphil)
(load-theme 'doom-spacegrey t) ;; I'm sure you've heard of it (thanks to teesloane)
;; (load-theme 'doom-tomorrow-day t) ;; Tomorrow's light variant (thanks to emacswatcher)
;; (load-theme 'doom-tomorrow-night t) ;; one of the dark variants of Tomorrow (thanks to emacswatcher)
;; (load-theme 'doom-wilmersdorf t) ;; port of Ian Pan's Wilmersdorf (thanks to ema2159)
;; (load-theme 'doom-zenburn t) ;; port of the popular Zenburn theme (thanks to jsoa)
;; (load-theme 'doom-mono-light t) ;; a minimalistic, monochromatic theme
;;;; (load-theme 'doom-tron t) ;; based on Tron Legacy from daylerees' themes

;; (setq-default line-spacing 4)
(setq doom-font (font-spec :family "PragmataPro Liga 1.1" :size 18))
;; (setq doom-font (font-spec :family "Rec Mono Linear" :size 22))
;; (setq doom-font (font-spec :family "Input" :size 22))
;; (setq doom-font (font-spec :family "JetBrains Mono" :size 22))
;; (setq doom-font (font-spec :family "SF Mono" :size 19))
(setq doom-variable-pitch-font (font-spec :family "SF Pro Display" :size 18))
;; (setq doom-variable-pitch-font (font-spec :family "Roboto" :size 15))
;; (setq doom-variable-pitch-font (font-spec :family "Roboto" :size 18))
;; (setq doom-font (font-spec :family "Monoid" :size 19))
(custom-set-faces!
  `(font-lock-type-face :weight bold)
  `(font-lock-function-name-face :weight bold)
  `(font-lock-string-face :background ,(doom-color 'bg))
  `(mode-line :family "SF Pro Display")
  `(mode-line-inactive :family "SF Pro Display")
  ;; `(popup-face :height 0.7)
  )

(custom-theme-set-faces! 'doom-spacegrey
  `(line-number :foreground "#353b45"
                :background ,(doom-darken 'bg 0.1))
  `(font-lock-keyword-face :weight bold
                           :foreground ,(doom-blend (doom-color 'magenta) (doom-color 'grey) 0.4))
  `(font-lock-constant-face :weight bold
                            :foreground ,(doom-lighten (doom-color 'blue) 0.3))
  `(font-lock-variable-name-face :foreground ,(doom-color 'blue))
  `(font-lock-preprocessor-face :foreground "tomato")
  `(font-lock-string-face :foreground ,(doom-lighten (doom-color 'green) 0.3))
  `(font-lock-type-face :foreground ,(doom-darken (doom-color 'red) 0.1))
  `(font-lock-function-name-face :foreground ,(doom-color 'green))
  `(font-lock-doc-face :foreground ,(doom-color 'orange))
 )

(custom-theme-set-faces! 'doom-tomorrow-day
  `(font-lock-string-face :background "#ccddee")
  `(treemacs-root-face :background ,(doom-darken 'bg 0.1))
  )

(after! doom-modeline
  (setq doom-modeline-major-mode-icon t)
  (custom-set-faces!
    `(doom-modeline-project-dir :weight bold :background ,(doom-color 'default))
    `(doom-modeline-persp-name :slant normal)
    )
  )

(after! haskell
  (custom-set-faces!
    `(haskell-keyword-face :foreground "coral")
    `(haskell-pragma-face :weight bold
                          :foreground ,(doom-color 'red)
                          :background ,(doom-darken 'bg 0.5))
    `(haskell-operator-face :foreground ,(doom-color 'orange))
    `(haskell-definition-face :foreground ,(doom-color 'blue))
    `(haskell-quasi-quote-face :foreground ,(doom-color 'magenta))
    `(haskell-type-face :weight bold :foreground ,(doom-color 'orange))
    `(haskell-definition-face :weight bold)
    )
  )

(after! hl-todo
  (setq hl-todo-keyword-faces
        `(("TODO"  . ,(face-foreground 'warning))
          ("FIXME" . ,(face-foreground 'error))
          ("XXX" . ,(face-foreground 'error))
          ("NOTE"  . ,(face-foreground 'success))))
  )

(after! treemacs
  (custom-set-faces!
    `(treemacs-root-face :height 1.2 :weight bold :slant normal :family "SF Pro Display" :background ,(doom-color 'bg))
    `(treemacs-directory-collapsed-face :weight normal :slant normal :family "SF Pro Display")
    `(treemacs-directory-face :weight normal :slant normal :family "SF Pro Display")
    `(treemacs-file-face :weight normal :slant normal :family "SF Pro Display")
    `(treemacs-fringe-indicator-face :weight normal :slant normal :family "SF Pro Display")
    `(treemacs-git-added-face :weight normal :slant normal :family "SF Pro Display")
    `(treemacs-git-conflict-face :weight normal :slant normal :family "SF Pro Display")
    `(treemacs-git-ignored-face :weight normal :slant normal :family "SF Pro Display")
    `(treemacs-git-modified-face :weight normal :slant normal :family "SF Pro Display")
    `(treemacs-git-renamed-face :weight normal :slant normal :family "SF Pro Display")
    `(treemacs-git-unmodified-face :weight normal :slant normal :family "SF Pro Display")
    `(treemacs-git-untracked-face :weight normal :slant normal :family "SF Pro Display")
    `(treemacs-help-column-face :weight normal :slant normal :family "SF Pro Display")
    `(treemacs-help-title-face :weight normal :slant normal :family "SF Pro Display")
    `(treemacs-on-failure-pulse-face :weight normal :slant normal :family "SF Pro Display")
    `(treemacs-on-success-pulse-face :weight normal :slant normal :family "SF Pro Display")
    `(treemacs-tags-face :weight normal :slant normal :family "SF Pro Display")
    `(treemacs-term-node-face :weight normal :slant normal :family "SF Pro Display")
    )
  (custom-theme-set-faces!
    `(treemacs-root-face :background ,(doom-darken (doom-color 'bg) 0.1))
    )
  (setq treemacs-width 30)
  )

(defface code-face
  '((t (:inherit default :height 1.3)))
  "code-face")
(add-hook! (prog-mode toml-mode conf-toml-mode yaml-mode git-commit-mode)
  (face-remap-add-relative 'default 'code-face)
  (face-remap-add-relative 'solaire-default-face 'code-face)
  (face-remap-add-relative 'line-number 'code-face)
  )

;;; flycheck
;; (defface flycheck-small-face
;;   '((t (:inherit default :height 0.7)))
;;    "flycheck-small-face")
;; (add-hook! flycheck-mode-major-mode (face-remap-add-relative 'default 'flycheck-small-face))
;; (add-hook! flycheck-mode-major-mode-hook (face-remap-add-relative 'default 'flycheck-small-face))

;;; rust
(after! rustic
  (custom-set-faces!
    `(rustic-string-interpolation-face :slant normal)
    `(rustic-string-interpolation-face :foreground ,(doom-lighten (doom-color 'magenta) 0.1)
                                       :background ,(doom-lighten 'bg 0.07))
    `(rustic-builtin-formatting-macro :foreground "tomato")
    )
  )

(add-hook! rustic-mode (face-remap-add-relative 'solaire-default-face 'code-face))
;; (add-hook! rustic-mode (face-remap-add-relative 'default 'code-face))

;; (defface compilation-face
;;   '((t (:inherit default :height 0.7)))
;;    "compilation-face")
;; (add-hook! rustic-compilation-mode (face-remap-add-relative 'default 'compilation-face))
;; (add-hook! compilation-mode (face-remap-add-relative 'default 'compilation-face))
;; (add-hook! rustic-mode (face-remap-add-relative 'default 'code-face))

