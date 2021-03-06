;;;  -*- lexical-binding: t; -*-

;; (require 'doom-themes)
;; (load-theme 'doom-one t) ;; doom-themes' flagship theme, inspired by Atom's One Dark themes
;; (load-theme 'doom-one-light t) ;; light version of doom-one (thanks to ztlevi)
;;;;(load-theme 'doom-acario-dark t) ;; an original dark theme (thanks to gagbo)
;;;; (load-theme 'doom-acario-light t) ;; an original light theme (thanks to gagbo)
(load-theme 'doom-ayu-mirage t) ;; Mirage variant from Ayu themes (thanks to LoveSponge)
;; doom-ayu-light: Light variant from Ayu themes(thanks to LoveSponge)
;; (load-theme 'doom-city-lights t) ;; based on Atom's City lights (thanks to fuxialexander)
;; (load-theme 'doom-challenger-deep t) ;; based on Vim's Challenger deep theme (thanks to fuxialexander)
;; (load-theme 'doom-dark+) ;; ported from VS Code's Dark+ theme (thanks to ema2159)
;; (load-theme 'doom-dracula t) ;; an implementation of Dracula theme (thanks to fuxialexander)
;;;;(load-theme 'doom-ephemeral t) ;; inspired in the Ephemeral Theme from elenapan's dotfiles (thanks to karetsu)
;; (load-theme 'doom-fairy-floss t) ;; a candy colored Sublime theme by sailorhg (thanks to ema2159)
;; broken? (load-theme 'doom-flatwhite t) ;; a unique light theme ported from Flatwhite Syntax (thanks to ShaneKilkelly)
;; (load-theme 'doom-gruvbox t) ;; adapted from Morhetz's Gruvbox (thanks to JongW)
;; (load-theme 'doom-gruvbox-light t) ;; adapted from Morhetz's Gruvbox light variant (thanks for jsoa)
;;;; (load-theme 'doom-henna t) ;; based on VS Code's Henna (thanks to jsoa)
;; (load-theme 'doom-horizon t) ;; ported from VS Code's Horizon (thanks to karetsu)
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
;; (load-theme 'doom-spacegrey t) ;; I'm sure you've heard of it (thanks to teesloane)
;; (load-theme 'doom-tomorrow-day t) ;; Tomorrow's light variant (thanks to emacswatcher)
;; (load-theme 'doom-tomorrow-night t) ;; one of the dark variants of Tomorrow (thanks to emacswatcher)
;; (load-theme 'doom-wilmersdorf t) ;; port of Ian Pan's Wilmersdorf (thanks to ema2159)
;; (load-theme 'doom-zenburn t) ;; port of the popular Zenburn theme (thanks to jsoa)
;; (load-theme 'doom-mono-light t) ;; a minimalistic, monochromatic theme
;;;; (load-theme 'doom-tron t) ;; based on Tron Legacy from daylerees' themes

(setq-default line-spacing 8)
(setq doom-font (font-spec :family "PragmataPro Liga" :size 19))
;; (setq doom-font (font-spec :family "Rec Mono Duotone" :size 18))
;; (setq doom-font (font-spec :family "Input" :size 22))
;; (setq doom-font (font-spec :family "JetBrains Mono" :size 18))
;; (setq doom-font (font-spec :family "SF Mono" :size 19))
;; (setq doom-variable-pitch-font (font-spec :family "Proxima Nova" :size 19))
(setq doom-variable-pitch-font (font-spec :family "Proxima Nova" :size 15))
;; (setq doom-variable-pitch-font (font-spec :family "Roboto" :size 18))
;; (setq doom-font (font-spec :family "Monoid" :size 16))
;; (setq doom-font (font-spec :family "Victor Mono" :size 19))
;; disable solaire mode on GUI
;; (after! solaire-mode
;;   (when (display-graphic-p)
;;     (solaire-global-mode -1)))
(custom-set-faces!
  `(font-lock-type-face :weight bold)
  `(font-lock-function-name-face :weight bold)
  `(font-lock-string-face :background ,(doom-lighten 'bg 0.1))
  `(line-number :height 1.2)
  `(mode-line :family "Proxima Nova")
  `(mode-line-inactive :family "Proxima Nova")
  `(variable-pitch :family "Proxima Nova")
  `(tooltip :background ,(doom-lighten 'bg 0.2) :background ,(doom-color 'grey))
  `(+workspace-tab-face :family "Proxima Nova")
  `(+workspace-tab-selected-face :family "Proxima Nova")
  `(header-line :background "#1F242F" :family "Proxima Nova" :height 1.1 :weight bold)
  `(lsp-headerline-breadcrumb-project-prefix-face :background "#1f242f" :family "Proxima Nova" :height 1.0 :weight bold)
  `(lsp-headerline-breadcrumb-path-face :background "#1f242f" :family "Proxima Nova" :height 1.0 :weight normal)
  `(lsp-headerline-breadcrumb-symbols-face :background "#1f242f" :family "Proxima Nova" :height 1.0)
  `(lsp-headerline-breadcrumb-path-hint-face :background "#1f242f" :family "Proxima Nova" :height 1.0)
  `(lsp-headerline-breadcrumb-path-info-face :background "#1f242f" :family "Proxima Nova" :height 1.0)
  `(lsp-headerline-breadcrumb-separator-face :background "#1f242f" :family "Proxima Nova" :height 1.0)
  `(lsp-headerline-breadcrumb-deprecated-face :background "#1f242f" :family "Proxima Nova" :height 1.0)
  `(lsp-headerline-breadcrumb-path-error-face :background "#1f242f" :family "Proxima Nova" :height 1.0)
  `(lsp-headerline-breadcrumb-symbols-hint-face :background "#1f242f" :family "Proxima Nova" :height 1.0)
  `(lsp-headerline-breadcrumb-symbols-info-face :background "#1f242f" :family "Proxima Nova" :height 1.0)
  `(lsp-headerline-breadcrumb-path-warning-face :background "#1f242f" :family "Proxima Nova" :height 1.0)
  `(lsp-headerline-breadcrumb-symbols-error-face :background "#1f242f" :family "Proxima Nova" :height 1.0)
  `(lsp-headerline-breadcrumb-symbols-warning-face :background "#1f242f" :family "Proxima Nova" :height 1.0)
  `(lsp-headerline-breadcrumb-unknown-project-prefix-face :background "#1f242f" :family "Proxima Nova" :height 1.0)
  `(ediff-fine-diff-A :background ,(doom-blend 'red 'bg 0.3) :bold 'bold)
  )

;; (after! tree-sitter
  (custom-set-faces!
    '(tree-sitter-hl-face:property :slant normal)
    )
  ;; )

(custom-theme-set-faces! 'doom-spacegrey
  `(default :foreground "#b1bbcb" :background "#1f242f")
  `(solaire-default-face :foreground "#87939c" :background "#1f242f")
  `(solaire-header-line-face :background "#1f242f" :family "Proxima Nova" :height 1.3 :weight bold)
  `(line-number :foreground "#292e35"
                :background ,(doom-darken 'bg 0.5))
  `(font-lock-keyword-face :weight bold
                           :foreground ,(doom-blend (doom-color 'magenta) (doom-color 'grey) 0.4))
  `(font-lock-constant-face :weight bold
                            :foreground ,(doom-lighten (doom-color 'blue) 0.3))
  `(font-lock-builtin-face :weight bold)
  `(font-lock-variable-name-face :foreground ,(doom-color 'blue))
  `(font-lock-preprocessor-face :foreground "tomato")
  `(font-lock-string-face :foreground ,(doom-lighten (doom-color 'green) 0.3))
  `(font-lock-type-face :foreground ,(doom-darken (doom-color 'red) 0.1))
  `(font-lock-function-name-face :foreground ,(doom-color 'green))
  `(font-lock-doc-face :foreground ,(doom-color 'orange))
 )

(custom-theme-set-faces! 'doom-ayu-mirage
  `(line-number :foreground ,(doom-lighten 'bg 0.1)
                :background ,(doom-darken 'bg 0.1))
  `(solaire-header-line-face :height 1.3)
  `(font-lock-keyword-face :weight bold :foreground ,(doom-color 'orange))
  `(font-lock-builtin-face :weight bold :foreground ,(doom-color 'orange))
  `(font-lock-constant-face :weight bold)
  `(font-lock-builtin-face :weight bold)
  `(font-lock-function-name-face :weight bold :foreground ,(doom-color 'red))
  `(font-lock-function :weight bold)
  `(font-lock-type-face :weight bold :foreground ,(doom-color 'orange))
  `(font-lock-string-face :background ,(doom-lighten 'bg 0.01))
  `(font-lock-variable-name-face :foreground ,(doom-lighten 'fg 0.1))
  `(font-lock-doc-face :foreground ,(doom-color 'blue))
  )

(custom-theme-set-faces! 'doom-old-hope
  `(default :foreground "#87939c" :background "#0A0E14")
  ;; `(solaire-default-face :foreground "#87939c" :background "#0A0E14")
  `(line-number :foreground ,(doom-darken 'fg 0.8)
                :background ,(doom-darken 'bg 0.5)
                )
  `(font-lock-keyword-face :weight bold
                           :foreground "#FF8F40"
                           )
  `(font-lock-builtin-face :weight bold
                           :foreground "#F29668")
  `(font-lock-constant-face :weight bold
                            :foreground "#FFEE99"
                            )
  `(font-lock-variable-name-face :foreground "#59C2FF")
  `(font-lock-preprocessor-face :foreground "tomato")
  `(font-lock-string-face :foreground "#b6ce89" :background "#1c2512")
  `(font-lock-type-face :weight bold :foreground "#F07178")
  `(font-lock-function-name-face :foreground "#FFB454")
  `(font-lock-doc-face :foreground "#A1AC88")
  `(font-lock-comment-face :foreground "#626A73")
  `(highlight-numbers-number :foreground "#E6B673")
  `(border :foreground "#4D5566")
 )

(custom-theme-set-faces! 'doom-tomorrow-day
  `(font-lock-string-face :background "#ccddee")
  `(treemacs-root-face :background ,(doom-darken 'bg 0.1))
  )

;; (after! doom-modeline
  (setq doom-modeline-major-mode-icon t)
  (custom-set-faces!
    `(doom-modeline-project-dir :weight bold :background ,(doom-color 'default))
    `(doom-modeline-persp-name :slant normal)
    )
  ;; )

(use-package! terraform-mode
  :defer
  :config
  (custom-set-faces!
    `(terraform--resource-name-face :weight bold :foreground ,(doom-color 'green))
    `(terraform--resource-type-face :weight bold :foreground ,(doom-color 'blue))
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
    `(treemacs-root-face :height 1.2 :weight bold :slant normal :family "Proxima Nova" :background ,(doom-darken (doom-color 'bg) 0.3))
    `(treemacs-directory-collapsed-face :weight normal :slant normal :family "Proxima Nova")
    `(treemacs-directory-face :weight normal :slant normal :family "Proxima Nova")
    `(treemacs-file-face :weight normal :slant normal :family "Proxima Nova")
    `(treemacs-fringe-indicator-face :weight normal :slant normal :family "Proxima Nova")
    `(treemacs-git-added-face :weight normal :slant normal :family "Proxima Nova")
    `(treemacs-git-conflict-face :weight normal :slant normal :family "Proxima Nova")
    `(treemacs-git-ignored-face :weight normal :slant normal :family "Proxima Nova")
    `(treemacs-git-modified-face :weight normal :slant normal :family "Proxima Nova")
    `(treemacs-git-renamed-face :weight normal :slant normal :family "Proxima Nova")
    `(treemacs-git-unmodified-face :weight normal :slant normal :family "Proxima Nova")
    `(treemacs-git-untracked-face :weight normal :slant normal :family "Proxima Nova")
    `(treemacs-help-column-face :weight normal :slant normal :family "Proxima Nova")
    `(treemacs-help-title-face :weight normal :slant normal :family "Proxima Nova")
    `(treemacs-on-failure-pulse-face :weight normal :slant normal :family "Proxima Nova")
    `(treemacs-on-success-pulse-face :weight normal :slant normal :family "Proxima Nova")
    `(treemacs-tags-face :weight normal :slant normal :family "Proxima Nova")
    `(treemacs-term-node-face :weight normal :slant normal :family "Proxima Nova")
    )
  (setq treemacs-width 60)
  (setq treemacs-position 'right)
  )

(defface code-face
  '((t (:inherit default
        :height 1.2
        :family "PragmataPro Liga")))
  "code-face")
(add-hook! (prog-mode
            text-mode
            conf-toml-mode
            conf-space-mode
            protobuf-mode
            toml-mode)
  (face-remap-add-relative 'default 'code-face)
  (face-remap-add-relative 'solaire-default-face 'code-face)
  ;; (face-remap-add-relative 'line-number 'code-face)
  )

;;; flycheck
;; (defface flycheck-small-face
;;   '((t (:inherit default :height 0.7)))
;;    "flycheck-small-face")
;; (add-hook! flycheck-mode-major-mode (face-remap-add-relative 'default 'flycheck-small-face))
;; (add-hook! flycheck-mode-major-mode-hook (face-remap-add-relative 'default 'flycheck-small-face))

(after! flycheck-posframe
  (custom-set-faces!
    `(flycheck-posframe-background-face :background ,(doom-lighten 'bg 0.1))
    )
  )
;;; rust
;; (after! rustic
  ;; (custom-set-faces!
  ;;   `(rustic-string-interpolation-face :slant normal)
  ;;   `(rustic-string-interpolation-face :foreground ,(doom-lighten (doom-color 'magenta) 0.1)
  ;;                                      :background ,(doom-lighten 'bg 0.07))
  ;;   `(rustic-builtin-formatting-macro :foreground "tomato")
  ;;   )
  ;; )

;; (add-hook! rustic-mode (face-remap-add-relative 'solaire-default-face 'code-face))
;; (add-hook! rustic-mode (face-remap-add-relative 'default 'code-face))

(defface compilation-face
  '((t (:inherit default :height 0.7)))
   "compilation-face")
(add-hook! rustic-compilation-mode (face-remap-add-relative 'default 'compilation-face))
(add-hook! compilation-mode (face-remap-add-relative 'default 'compilation-face))
(add-hook! rustic-mode (face-remap-add-relative 'default 'code-face))

(defface org-face
  '((t (:inherit default-face :family "Proxima Nova" :height 1.1)))
  "org-face")
(defface org-code-face
  '((t (:inherit default-face :family "PragmataPro Liga")))
  "org-code-face")
(after! org
  (custom-set-faces!
    `(org-table :family "PragmataPro Liga")
    `(org-code :family "PragmataPro Liga")
    `(org-block :family "PragmataPro Liga")
    `(org-default :inherit 'org-face :foreground "#8FA1B3" :background ,(doom-color 'bg))
    `(org-quote :inherit 'org-face :background ,(doom-lighten 'bg 0.1) :slant italic)
    `(org-tag :foreground ,(doom-blend (doom-color 'magenta) (doom-color 'grey) 0.4))
    ;; `(header-line :inherit 'default :height 1.3)
    ;; `(solaire-header-line-face :inherit 'default :height 1.3)
    `(org-superstar-header-bullet :inherit 'org-face :foreground "#ECBE7B")
    `(org-level-8 :inherit 'org-face :height 0.7)
    `(org-level-7 :inherit 'org-face :height 0.7)
    `(org-level-6 :inherit 'org-face :height 0.7)
    `(org-level-5 :inherit 'org-face :height 0.7)
    `(org-level-4 :inherit 'org-face :height 0.7 :weight bold :foreground "#8FA1B3")
    `(org-level-3 :inherit 'org-face :height 0.8 :weight normal :foreground "#8FA1B3")
    `(org-level-2 :inherit 'org-face :height 1.0 :weight bold :foreground "#8FA1B3")
    `(org-level-1 :inherit 'org-face :height 1.2 :weight normal :foreground "#8FA1B3")
    `(org-document-title :inherit 'org-face :height 1.1 :weight bold)
    )
  )

(add-hook! org-mode
  (hl-line-mode t)
  (face-remap-add-relative 'solaire-default-face 'org-face)
  (face-remap-add-relative 'default 'org-face)
  (setq-local line-spacing 8)
  (setq-local left-margin-width 5)
  (setq-local right-margin-width 5)
  (setq-local display-line-numbers-type nil)
  (display-line-numbers-mode -1)
  (setq-local header-line-format " ")
  (setq treemacs-sorting 'mod-time-desc)
  (set-window-buffer nil (current-buffer))
  (auto-save-mode t)
  )

(after! (rustic tree-sitter)
  (custom-theme-set-faces! 'doom-spacegrey
    `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
    `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
    `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
    `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
    `(tree-sitter-hl-face:constant :foreground ,(doom-color 'blue))
    )
  (custom-theme-set-faces! 'doom-ayu-mirage
    `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'cyan) 0.2))
    `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'cyan) 0.2))
    `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'cyan) 0.2))
    `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'cyan) 0.2))
    `(tree-sitter-hl-face:function.method.call :foreground ,(doom-color 'red))
    `(tree-sitter-hl-face:function.call :foreground ,(doom-color 'red))
    `(tree-sitter-hl-face:constant :foreground ,(doom-color 'blue))
    `(tree-sitter-hl-face:variable :foreground ,(doom-color 'yellow))
    `(tree-sitter-hl-face:property :foreground ,(doom-color 'yellow))
    )
  )

(after! ccls
  (custom-set-faces!
    `(ccls-skipped-range-face :inherit 'font-lock-comment-face)
    )
  )
