;;;  -*- lexical-binding: t; -*-

;; (require 'doom-themes)
;; Flagship themes
;; (load-theme 'doom-one t)
;; (load-theme 'doom-one-light t)
;; (load-theme 'doom-vibrant t)
;;
;; Additional themes
;; (load-theme 'doom-1337 t)
;; (load-theme 'doom-acario-dark t)
;; (load-theme 'doom-acario-light t)
(load-theme 'doom-ayu-mirage t)
;; (load-theme 'doom-ayu-light t)
;; (load-theme 'doom-city-lights t)
;; (load-theme 'doom-challenger-deep t)
;; (load-theme 'doom-dark+ t)
;; (load-theme 'doom-dracula t)
;; (load-theme 'doom-ephemeral t)
;; (load-theme 'doom-fairy-floss t)
;; (load-theme 'doom-flatwhite t)
;; (load-theme 'doom-gruvbox t)
;; (load-theme 'doom-gruxbox-light t)
;; (load-theme 'doom-henna t)
;; (load-theme 'doom-homage-white t)
;; (load-theme 'doom-homage-black t)
;; (load-theme 'doom-horizon t)
;; (load-theme 'doom-Iosvkem t)
;; (load-theme 'doom-ir-black t)
;; (load-theme 'doom-laserwave t)
;; (load-theme 'doom-material t)
;; (load-theme 'doom-manegarm t)
;; (load-theme 'doom-miramare t)
;; (load-theme 'doom-molokai t)
;; (load-theme 'doom-monokai-classic t)
;; (load-theme 'doom-monokai-pro t)
;; (load-theme 'doom-monokai-machine t)
;; (load-theme 'doom-monokai-octagon t)
;; (load-theme 'doom-monokai-ristretto t)
;; (load-theme 'doom-monokai-spectrum t)
;; (load-theme 'doom-moonlight t)
;; (load-theme 'doom-nord t)
;; (load-theme 'doom-nord-light t)
;; (load-theme 'doom-nova t)
;; (load-theme 'doom-oceanic-next t)
;; (load-theme 'doom-old-hope t)
;; (load-theme 'doom-opera t)
;; (load-theme 'doom-opera-light t)
;; (load-theme 'doom-outrun t)
;; (load-theme 'doom-palenight t)
;; (load-theme 'doom-peacock t)
;; (load-theme 'doom-plain t)
;; (load-theme 'doom-plain-dark t)
;; (load-theme 'doom-rouge t)
;; (load-theme 'doom-snazzy t)
;; (load-theme 'doom-solarized-dark t)
;; (load-theme 'doom-solarized-light t)
;; (load-theme 'doom-sourcerer t)
;; (load-theme 'doom-spacegrey t)
;; (load-theme 'doom-tomorrow-night t)
;; (load-theme 'doom-tomorrow-day t)
;; (load-theme 'doom-wilmersdorf t)
;; (load-theme 'doom-zenburn t)

(setq-default line-spacing 0)
(setq doom-font (font-spec :family "PragmataPro Liga" :size 17))
;; (setq doom-font (font-spec :family "Iosevka" :size 18))
;; (setq doom-font (font-spec :family "Rec Mono Duotone" :size 18))
;; (setq doom-font (font-spec :family "Input" :size 22))
;; (setq doom-font (font-spec :family "JetBrains Mono" :size 17))
;; (setq doom-font (font-spec :family "SF Mono" :size 19))
;; (setq doom-variable-pitch-font (font-spec :family "SF Pro" :size 19))
;; (setq doom-variable-pitch-font (font-spec :family "Roboto" :size 15))
;; (setq doom-variable-pitch-font (font-spec :family "Avenir Next" :size 18))
;; (setq doom-font (font-spec :family "Monoid" :size 16))
;; (setq doom-font (font-spec :family "Victor Mono" :size 19))
;; (after! solaire-mode (solaire-global-mode -1)) ;; disable solaire mode
(custom-set-faces!
  `(font-lock-type-face :weight bold)
  `(font-lock-function-name-face :weight bold)
  `(font-lock-string-face :background ,(doom-blend 'bg 'blue 0.95))
  `(font-lock-constant-face :weight bold)
  `(font-lock-builtin-face :weight bold)
  `(font-lock-function :weight bold)
  `(line-number :height 1.0)
  `(mode-line :family "Avenir Next")
  `(mode-line-inactive :family "Avenir Next")
  `(variable-pitch :family "Avenir Next")
  `(+workspace-tab-face :family "Avenir Next")
  `(+workspace-tab-selected-face :family "Avenir Next")
  `(header-line :background ,(doom-color 'bg) :family "Avenir Next" :height 1.0 :weight bold)
  `(lsp-headerline-breadcrumb-project-prefix-face :background ,(doom-color 'bg) :family "Avenir Next" :height 1.0 :weight bold)
  `(lsp-headerline-breadcrumb-path-face :background ,(doom-color 'bg) :family "Avenir Next" :height 1.0)
  `(lsp-headerline-breadcrumb-symbols-face :background ,(doom-color 'bg) :family "Avenir Next" :height 1.0)
  `(lsp-headerline-breadcrumb-path-hint-face :background ,(doom-color 'bg) :family "Avenir Next" :height 1.0)
  `(lsp-headerline-breadcrumb-path-info-face :background ,(doom-color 'bg) :family "Avenir Next" :height 1.0)
  `(lsp-headerline-breadcrumb-separator-face :background ,(doom-color 'bg) :family "Avenir Next" :height 1.0)
  `(lsp-headerline-breadcrumb-deprecated-face :background ,(doom-color 'bg) :family "Avenir Next" :height 1.0)
  `(lsp-headerline-breadcrumb-path-error-face :background ,(doom-color 'bg) :family "Avenir Next" :height 1.0)
  `(lsp-headerline-breadcrumb-symbols-hint-face :background ,(doom-color 'bg) :family "Avenir Next" :height 1.0)
  `(lsp-headerline-breadcrumb-symbols-info-face :background ,(doom-color 'bg) :family "Avenir Next" :height 1.0)
  `(lsp-headerline-breadcrumb-path-warning-face :background ,(doom-color 'bg) :family "Avenir Next" :height 1.0)
  `(lsp-headerline-breadcrumb-symbols-error-face :background ,(doom-color 'bg) :family "Avenir Next" :height 1.0)
  `(lsp-headerline-breadcrumb-symbols-warning-face :background ,(doom-color 'bg) :family "Avenir Next" :height 1.0)
  `(lsp-headerline-breadcrumb-unknown-project-prefix-face :background ,(doom-color 'bg) :family "Avenir Next" :height 1.0)
  )

(custom-theme-set-faces! 'doom-spacegrey
  ;; `(default :foreground "#b1bbcb" :background "#171b21")
  ;; `(solaire-default-face :foreground "#87939c" :background ,(doom-color 'bg))
  ;; `(solaire-header-line-face :background "#171b21" :family "Avenir Next" :height 1.2 :weight bold)
  ;; `(header-line :background "#171b21" :foreground ,(doom-color 'fg))
  `(line-number :foreground "#393e45"
                :background ,(doom-darken 'bg 0.1)
                :height 1.1)
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
  `(line-number :inherit default
                :foreground ,(doom-lighten 'bg 0.2)
                :background ,(doom-darken 'bg 0.1)
                :height 1.0)
  `(solaire-header-line-face :height 1.1)
  `(font-lock-keyword-face :foreground ,(doom-color 'cyan) :weight bold)
  `(font-lock-builtin-face :foreground ,(doom-color 'blue) :weight bold)
  `(font-lock-constant-face :foreground ,(doom-color 'blue) :weight bold)
  `(font-lock-string-face :background ,(doom-lighten (doom-color 'bg) 0.1) :foreground ,(doom-blend (doom-color 'red) "#aaaaaa" 0.2))
  `(font-lock-function-name-face :weight bold)
  `(font-lock-type-face :foreground ,(doom-color 'red) :weight bold)
  `(font-lock-variable-name-face :foreground ,(doom-blend (doom-color 'blue) "#aaaaaa" 0.2) :weight bold)
  `(font-lock-doc-face :foreground ,(doom-color 'blue))
  `(font-lock-comment-face :foreground ,(doom-blend (doom-color 'blue) "#888888" 0.4))
  )

(custom-theme-set-faces! 'doom-oceanic-next
  `(default :background "#212c39" :foreground "#91a6bf")
  `(line-number :foreground "#373947"
                :height 1.1)
  `(solaire-header-line-face :height 1.1)
  `(font-lock-keyword-face :weight bold)
  `(font-lock-builtin-face :weight bold)
  `(font-lock-string-face :background ,(doom-lighten 'bg 0.01))
  `(font-lock-function-name-face :weight bold)
  `(font-lock-type-face :weight bold)
  `(mode-line :background ,(doom-darken 'bg 0.2))
  `(solaire-mode-line-face :background ,(doom-darken 'bg 0.1))
  )

(custom-theme-set-faces! 'doom-old-hope
  `(default :foreground "#87939c" :background "#0A0E14")
  ;; `(solaire-default-face :foreground "#87939c" :background "#0A0E14")
  `(line-number :foreground ,(doom-darken 'fg 0.8)
                :background ,(doom-darken 'bg 0.5)
                :height 1.1)
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

(custom-theme-set-faces! 'doom-1337
  `(default :foreground ,(doom-lighten (doom-color 'cyan) 0.5))
  `(font-lock-string-face :background ,(doom-lighten 'bg 0.1)
                          :foreground ,(doom-lighten (doom-color 'blue) 0.4))
  `(mode-line :background ,(doom-blend (doom-color 'blue) "#333333" 0.1))
  )

(after! doom-modeline
  (setq doom-modeline-major-mode-icon t)
  (custom-set-faces!
    `(doom-modeline-project-dir :weight bold :background ,(doom-color 'default))
    `(doom-modeline-persp-name :slant normal)
    )
  )


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
    `(treemacs-root-face :height 1.2 :weight bold :slant normal :family "Avenir Next" :background ,(doom-color 'bg))
    `(treemacs-directory-collapsed-face :weight normal :slant normal :family "Avenir Next")
    `(treemacs-directory-face :weight normal :slant normal :family "Avenir Next")
    `(treemacs-file-face :weight normal :slant normal :family "Avenir Next")
    `(treemacs-fringe-indicator-face :weight normal :slant normal :family "Avenir Next")
    `(treemacs-git-added-face :weight normal :slant normal :family "Avenir Next")
    `(treemacs-git-conflict-face :weight normal :slant normal :family "Avenir Next")
    `(treemacs-git-ignored-face :weight normal :slant normal :family "Avenir Next")
    `(treemacs-git-modified-face :weight normal :slant normal :family "Avenir Next")
    `(treemacs-git-renamed-face :weight normal :slant normal :family "Avenir Next")
    `(treemacs-git-unmodified-face :weight normal :slant normal :family "Avenir Next")
    `(treemacs-git-untracked-face :weight normal :slant normal :family "Avenir Next")
    `(treemacs-help-column-face :weight normal :slant normal :family "Avenir Next")
    `(treemacs-help-title-face :weight normal :slant normal :family "Avenir Next")
    `(treemacs-on-failure-pulse-face :weight normal :slant normal :family "Avenir Next")
    `(treemacs-on-success-pulse-face :weight normal :slant normal :family "Avenir Next")
    `(treemacs-tags-face :weight normal :slant normal :family "Avenir Next")
    `(treemacs-term-node-face :weight normal :slant normal :family "Avenir Next")
    )
  (setq treemacs-width 40)
  (setq treemacs-position 'right)
  )

(defface code-face
  '((t (:inherit default
        :height 1.25
        :family "PragmataPro Liga")))
  "code-face")
(add-hook! (prog-mode
            text-mode
            toml-mode
            haskell-cabal-mode
            )
  (face-remap-add-relative 'default 'code-face)
  (face-remap-add-relative 'solaire-default-face 'code-face)
  (setq-local default-text-properties '(line-spacing 0.3 line-height 1.4))
  (hl-line-mode 1)
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
    `(flycheck-posframe-background-face :background ,(doom-darken 'bg 0.5))
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

;; (defface compilation-face
;;   '((t (:inherit default :height 0.7)))
;;    "compilation-face")
;; (add-hook! rustic-compilation-mode (face-remap-add-relative 'default 'compilation-face))
;; (add-hook! compilation-mode (face-remap-add-relative 'default 'compilation-face))
;; (add-hook! rustic-mode (face-remap-add-relative 'default 'code-face))

(defface org-face
  '((t (:inherit default-face :family "Avenir Next" :height 1.1)))
  "org-face")
(defface org-code-face
  '((t (:inherit default-face :family "PragmataPro Liga" :height 0.8)))
  "org-code-face")
(after! org
  (custom-set-faces!
    `(org-table :family "PragmataPro Liga")
    `(org-code :family "PragmataPro Liga")
    `(org-block :family "PragmataPro Liga")
    `(org-default :inherit 'org-face :foreground "#8FA1B3" :background ,(doom-color 'bg))
    `(org-quote :inherit 'org-face :background ,(doom-lighten 'bg 0.1) :slant italic)
    `(org-tag :foreground ,(doom-blend (doom-color 'magenta) (doom-color 'grey) 0.4))
    ;; `(header-line :inherit 'default :height 1.2)
    ;; `(solaire-header-line-face :inherit 'default :height 1.2)
    `(org-superstar-header-bullet :inherit 'org-face :foreground "#ECBE7B")
    `(org-level-8 :inherit 'org-face :height 0.8)
    `(org-level-7 :inherit 'org-face :height 0.8)
    `(org-level-6 :inherit 'org-face :height 0.8)
    `(org-level-5 :inherit 'org-face :height 0.8)
    `(org-level-4 :inherit 'org-face :height 0.8 :weight bold :foreground "#8FA1B3")
    `(org-level-3 :inherit 'org-face :height 0.9 :weight normal :foreground "#8FA1B3")
    `(org-level-2 :inherit 'org-face :height 1.0 :weight bold :foreground "#8FA1B3")
    `(org-level-1 :inherit 'org-face :height 1.2 :weight normal :foreground "#8FA1B3")
    `(org-document-title :inherit 'org-face :height 1.1 :weight bold)
    )
  )

(add-hook! org-mode
  ;; (mixed-pitch-mode t)
  (hl-line-mode t)
  (face-remap-add-relative 'solaire-default-face 'org-face)
  (face-remap-add-relative 'default 'org-face)
  (setq-local default-text-properties '(line-spacing 0.4 line-height 1.4))
  (setq-local left-margin-width 5)
  (setq-local right-margin-width 5)
  (setq-local display-line-numbers-type nil)
  (display-line-numbers-mode -1)
  (setq-local header-line-format " ")
  (setq treemacs-sorting 'mod-time-desc)
  (set-window-buffer nil (current-buffer))
  (auto-save-mode t)
  )

(after! tree-sitter
  (custom-set-faces!
    `(tree-sitter-hl--append-text-property :slant normal)
    `(tree-sitter-hl-face:method.call :slant normal)
    `(tree-sitter-hl-face:operator :slant normal)
    '(tree-sitter-hl-face:property :slant normal)
    )
  )

(after! (rustic tree-sitter)
  (custom-theme-set-faces! 'doom-ayu-mirage
    `(tree-sitter-hl-face:type :foreground ,(doom-color 'red) :weight bold)
    `(tree-sitter-hl-face:constructor :foreground ,(doom-lighten 'red 0.3) :weight bold)
    `(tree-sitter-hl-face:method.call :weight bold)
    `(tree-sitter-hl-face:keyword :foreground ,(doom-darken (doom-color 'cyan) 0.1) :weight bold)
    `(tree-sitter-hl-face:function :foreground ,(doom-lighten (doom-color 'cyan) 0.1) :weight bold)
    `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'cyan) 0.2) :weight bold)
    `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'cyan) 0.2) :weight bold)
    `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'cyan) 0.2) :weight bold)
    `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'cyan) 0.2) :weight bold)
    `(tree-sitter-hl-face:operator :foreground ,(doom-darken (doom-color 'cyan) 0.2) :weight bold)
    `(tree-sitter-hl-face:constant :foreground ,(doom-color 'blue) :weight bold)
    `(tree-sitter-hl-face:comment :foreground ,(doom-blend (doom-color 'blue) "#888888" 0.4))
    `(tree-sitter-hl-face:variable :foreground ,(doom-blend (doom-color 'blue) "#aaaaaa" 0.2) :weight bold)
    `(tree-sitter-hl-face:string :background ,(doom-lighten (doom-color 'bg) 0.1) :foreground ,(doom-blend (doom-color 'blue) "#888888" 0.5))
    )
  (custom-theme-set-faces! 'doom-1337
    `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
    `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
    `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
    `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
    `(tree-sitter-hl-face:constant :foreground ,(doom-color 'blue))
    )
  (custom-theme-set-faces! 'doom-spacegrey
    `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
    `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
    `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
    `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
    `(tree-sitter-hl-face:constant :foreground ,(doom-color 'blue))
    )
  )

(after! marginalia
  (custom-set-faces!
    `(marginalia-file-name :slant normal)
    )
  )
