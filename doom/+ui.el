;;;  -*- lexical-binding: t; -*-

(require 'doom-themes)
(setq doom-theme 'doom-challenger-deep)
(setq doom-font (font-spec :family "PragmataPro Liga 1.1" :size 19))
(setq doom-variable-pitch-font (font-spec :family "SF Pro Display" :size 17))
;; (setq doom-variable-pitch-font (font-spec :family "Roboto" :size 15))
;; (setq doom-font (font-spec :family "Monoid" :size 19))
(load-theme 'doom-challenger-deep)
(set-face-foreground 'font-lock-preprocessor-face (doom-darken 'blue 0.3))
(set-face-foreground 'font-lock-variable-name-face (doom-lighten 'blue 0.4))
(set-face-foreground 'font-lock-function-name-face (doom-color 'red))
(set-face-foreground 'font-lock-comment-face (doom-darken 'magenta 0.5))
(set-face-bold 'font-lock-type-face t)
(set-face-bold 'font-lock-function-name-face t)
(set-face-background 'font-lock-string-face (doom-lighten 'bg 0.05))

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
  (set-face-attribute 'treemacs-root-face nil :height 1.8)
  (set-face-bold 'treemacs-root-face t)
  )

;;; rust
(after! rustic
  (set-face-italic 'rustic-string-interpolation-face nil)
  (set-face-foreground 'rustic-string-interpolation-face
                       (doom-lighten 'fg 0.1))
  )
