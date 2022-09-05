;;;  -*- lexical-binding: t; -*-

;; (setq default-frame-alist
;;       (append (list
;;                ;; '(min-height . 1)  '(height . 45)
;;                ;; '(min-width  . 1)  '(width  . 81)
;;                '(vertical-scroll-bars . nil)
;;                ;; '(internal-border-width . 8)
;;                '(left-fringe . 10)
;;                '(right-fringe . 10)
;;                '(tool-bar-lines . 0)
;;                '(menu-bar-lines . 0))))

(defface sawyer--mono-face
  `((t :inherit default-face
       :family "PragmataPro Liga"
       ;; :family "Iosevka"
       ;; :family "Iosevka SS08"
       ;; :family "IBM Plex Mono"
       :height 1.0
       :size 20
       ))
  "font spec for all monospace text")

(defface sawyer--variable-face
  `((t :inherit default-face
       :family "IBM Plex Sans"
       :height 1.0
       :size 20
       ))
 "font spec for all variable-width text")

;; (setq nano-font-family-monospaced (face-attribute 'sawyer--mono-face :family))
;; (setq nano-font-family-proportional (face-attribute 'sawyer--variable-face :family))
;; (setq nano-font-size 20)
;; (nano-theme-dark)

;; (load-theme 'doom-ayu-mirage 't)
(load-theme 'doom-tokyo-night 't)
;; (load-theme 'doom-monokai-octagon 't)
;; (load-theme 'doom-monokai-spectrum 't)
;; (setq-default doom-monokai-spectrum-comment-bg 't)
;; (load-theme 'doom-horizon 't)
;; (load-theme 'doom-tokyo-night 't)
;; (load-theme 'doom-moonlight 't)
;; (load-theme 'doom-nord-light 't)
(doom-modeline-mode 1)
(setq-default line-spacing 3)
(setq doom-font
  (font-spec
   :family (face-attribute 'sawyer--mono-face :family)
   ;; :weight 'light
   :size 20))
(setq doom-variable-pitch-font
  (font-spec
   :family (face-attribute 'sawyer--variable-face :family)
   :weight 'light
   :size 14))

;; (custom-set-faces!
;;   `(nano-face-header-default :family "IBM Plex Sans")
;;   `(nano-face-header-faded :family "IBM Plex Sans")
;;   `(nano-face-header-filler :family "IBM Plex Sans")
;;   `(nano-face-header-popout :family "IBM Plex Sans")
;;   `(nano-face-header-strong :family "IBM Plex Sans")
;;   `(nano-face-header-subtle :family "IBM Plex Sans")
;;   `(nano-face-header-salient :family "IBM Plex Sans")
;;   `(nano-face-header-critical :family "IBM Plex Sans")
;;   `(nano-face-header-highlight :family "IBM Plex Sans")
;;   `(nano-face-header-separator :family "IBM Plex Sans")
;;   )
;; disable solaire mode on GUI
;; (after! solaire-mode (solaire-global-mode -1))
(custom-set-faces!
  `(font-lock-type-face :weight semi-bold)
  `(font-lock-function-name-face :weight semi-bold)
  `(font-lock-string-face :background ,(doom-lighten 'bg 0.1))
  `(line-number :height 0.9)
  `(line-number-current-line :height 0.9)
;;   `(solaire-line-number-face :inherit 'line-number :height 1.00)
  `(mode-line :family ,(face-attribute 'sawyer--variable-face :family))
  `(mode-line-inactive :family ,(face-attribute 'sawyer--variable-face :family))
  `(variable-pitch :family ,(face-attribute 'sawyer--variable-face :family))
;;   `(+workspace-tab-face :family ,(face-attribute 'sawyer--variable-face :family))
;;   `(+workspace-tab-selected-face :family ,(face-attribute 'sawyer--variable-face :family))
  `(header-line :inherit default :background ,(doom-color 'bg) :family ,(face-attribute 'sawyer--variable-face :family) :height 1.0 :weight semi-bold)
  `(lsp-headerline-breadcrumb-deprecated-face :background ,(doom-color 'bg) :family ,(face-attribute 'sawyer--variable-face :family) :height 1.0)
  `(lsp-headerline-breadcrumb-path-error-face :background ,(doom-color 'bg) :family ,(face-attribute 'sawyer--variable-face :family) :height 1.0)
  `(lsp-headerline-breadcrumb-path-face :background ,(doom-color 'bg) :family ,(face-attribute 'sawyer--variable-face :family) :height 1.0 :weight normal)
  `(lsp-headerline-breadcrumb-path-hint-face :background ,(doom-color 'bg) :family ,(face-attribute 'sawyer--variable-face :family) :height 1.0)
  `(lsp-headerline-breadcrumb-path-info-face :background ,(doom-color 'bg) :family ,(face-attribute 'sawyer--variable-face :family) :height 1.0)
  `(lsp-headerline-breadcrumb-path-warning-face :background ,(doom-color 'bg) :family ,(face-attribute 'sawyer--variable-face :family) :height 1.0)
  `(lsp-headerline-breadcrumb-project-prefix-face :background ,(doom-color 'bg) :family ,(face-attribute 'sawyer--variable-face :family) :height 1.0 :weight semi-bold)
  `(lsp-headerline-breadcrumb-separator-face :foreground ,(doom-color 'cyan) :background ,(doom-color 'bg) :family ,(face-attribute 'sawyer--variable-face :family) :height 1.0)
  `(lsp-headerline-breadcrumb-symbols-error-face :background ,(doom-color 'bg) :family ,(face-attribute 'sawyer--variable-face :family) :height 1.0)
  `(lsp-headerline-breadcrumb-symbols-face :foreground ,(doom-color 'default) :background ,(doom-color 'bg) :family ,(face-attribute 'sawyer--variable-face :family) :height 1.0)
  `(lsp-headerline-breadcrumb-symbols-hint-face :background ,(doom-color 'bg) :family ,(face-attribute 'sawyer--variable-face :family) :height 1.0)
  `(lsp-headerline-breadcrumb-symbols-info-face :background ,(doom-color 'bg) :family ,(face-attribute 'sawyer--variable-face :family) :height 1.0)
  `(lsp-headerline-breadcrumb-symbols-warning-face :background ,(doom-color 'bg) :family ,(face-attribute 'sawyer--variable-face :family) :height 1.0)
  `(lsp-headerline-breadcrumb-unknown-project-prefix-face :background ,(doom-color 'bg) :family ,(face-attribute 'sawyer--variable-face :family) :height 1.0)
  `(lsp-lens-face :foreground ,(doom-color 'default) :height 0.8)
;;   `(lsp-face-highlight-textual :foreground ,(doom-lighten 'fg 0.1) :background ,(doom-darken 'bg 0.5))
;;   `(ediff-fine-diff-A :background ,(doom-blend 'red 'bg 0.3) :semi-bold 'semi-bold)
;;   `(magit-blame-heading :background "#111111")
;;   ;; `(internal-border :foreground "#000000")
;;   ;; `(vertical-border :foreground "#000000")
;;   ;; `(border :foreground "#000000")
;;   `(+org-todo-active :foreground "green")
;;   `(+org-todo-cancel :foreground "red")
;;   `(+org-todo-onhold :foreground "yellow")
;;   `(org-todo :foreground "cyan")
;;   `(org-done :foreground "gray")
;;   `(org-headline-done :foreground "#555555")
)

(after! tree-sitter
  (custom-set-faces!
    '(tree-sitter-hl-face:property :slant normal)
    '(tree-sitter-hl-face:keyword :weight bold)
    `(tree-sitter-hl-face:comment :inherit font-lock-comment-face :slant normal)
    )
  )

(custom-theme-set-faces! 'doom-spacegrey
  ;; `(header-line :background "#1f242f" :family ,(face-attribute 'sawyer--variable-face :family) :height 1.2 :weight semi-bold)
  `(line-number :foreground ,(doom-lighten 'bg 0.2)
                :background ,(doom-lighten 'bg 0.02)
                :height 0.8)
  `(line-number-current-line :foreground ,(doom-lighten 'bg 0.3)
                             :background ,(doom-lighten 'bg 0.1)
                             :height 0.8)
  `(font-lock-keyword-face :weight semi-bold
                           :foreground ,(doom-blend (doom-color 'magenta) (doom-color 'grey) 0.4))
  `(font-lock-constant-face :weight semi-bold
                            :foreground ,(doom-lighten (doom-color 'blue) 0.3))
  `(font-lock-builtin-face :weight semi-bold)
  `(font-lock-variable-name-face :foreground ,(doom-color 'blue))
  `(font-lock-preprocessor-face :foreground "tomato")
  `(font-lock-string-face :foreground ,(doom-blend (doom-color 'blue) "#aaaaaa" 0.7) :background ,(doom-lighten (doom-color 'bg) 0.02))
  `(font-lock-type-face :foreground ,(doom-darken (doom-color 'red) 0.1))
  `(font-lock-function-name-face :foreground ,(doom-blend (doom-color 'cyan) "#88aa88" 0.4))
  `(font-lock-doc-face :foreground ,(doom-color 'orange))
  `(font-lock-comment-face :foreground ,(doom-darken 'cyan 0.5))
 )
(custom-theme-set-faces! 'doom-tokyo-night
;;   ;; `(default :weight light)
;;   `(line-number
;;     :foreground ,(doom-lighten (doom-color 'bg) 0.3)
;;     :height 1.0)
;;   `(line-number-current-line
;;     :foreground ,(doom-lighten (doom-color 'bg) 0.4)
;;     :height 1.0)
  `(font-lock-keyword-face :weight bold)
  `(font-lock-builtin-face :weight bold)
  `(org-document-title :foreground ,(doom-color 'fg))
;;   `(org-superstar-header-bullet :foreground ,(doom-color 'red))
;;   `(org-list-dt :foreground ,(doom-color 'red))
  `(treemacs-root-face :foreground ,(doom-color 'red))
  `(doom-themes-treemacs-root-face :foreground ,(doom-color 'red))
;;   `(treemacs-header-button-face :foreground ,(doom-color 'red))
;;   `(font-lock-variable-name-face :foreground ,(doom-blend 'red 'white 0.6))
  `(font-lock-function-name-face :weight bold)
  `(font-lock-function :weight bold)
  )

;; (custom-theme-set-faces! 'doom-ayu-mirage
;;   `(line-number :inherit default
;;                 :foreground ,(doom-lighten 'bg 0.2)
;;                 :background ,(doom-darken 'bg 0.1)
;;                 :height 1.0)
;;   `(solaire-header-line-face :height 1.1)
;;   `(font-lock-keyword-face :foreground ,(doom-color 'cyan) :weight semi-bold)
;;   `(font-lock-builtin-face :foreground ,(doom-color 'blue) :weight semi-bold)
;;   `(font-lock-constant-face :foreground ,(doom-color 'blue) :weight semi-bold)
;;   `(font-lock-string-face :background ,(doom-lighten (doom-color 'bg) 0.1) :foreground ,(doom-blend (doom-color 'red) "#aaaaaa" 0.2))
;;   `(font-lock-function-name-face :weight semi-bold)
;;   `(font-lock-type-face :foreground ,(doom-color 'red) :weight semi-bold)
;;   `(font-lock-variable-name-face :foreground ,(doom-blend (doom-color 'blue) "#aaaaaa" 0.2) :weight semi-bold)
;;   `(font-lock-doc-face :foreground ,(doom-color 'blue))
;;   `(font-lock-comment-face :foreground ,(doom-blend (doom-color 'blue) "#888888" 0.4))
;;   `(ediff-fine-diff-A :background ,(doom-blend 'red 'bg 0.3) :semi-bold 'semi-bold)
;;   )
;; (when (eq doom-theme 'doom-ayu-mirage)
;;   (setq evil-normal-state-cursor '(box "cyan")
;;       evil-insert-state-cursor '(bar "green")
;;       evil-visual-state-cursor '(hollow "yellow"))
;;   )

;; (custom-theme-set-faces! 'doom-tomorrow-night
;;   `(font-lock-string-face :background ,(doom-lighten (doom-color 'bg) 0.05)
;;                           :foreground ,(doom-blend (doom-color 'blue) "#aaaaaa" 0.5))
;;   )

;; (custom-theme-set-faces! 'doom-horizon
;;   `(font-lock-string-face :background ,(doom-lighten (doom-color 'bg) 0.05)
;;                           :foreground ,(doom-color 'fg))
;;   `(font-lock-comment-face :slant normal
;;                            :foreground "#505872")
;;   `(doom-modeline-buffer-path :foreground ,(doom-color 'blue))
;;   `(doom-modeline-buffer-file :foreground ,(doom-color 'blue))
;;   `(doom-modeline-buffer-project-root :foreground ,(doom-color 'blue))
;;   `(doom-modeline-project-dir :foreground ,(doom-color 'blue))
;;   `(doom-modeline-buffer-modified :foreground ,(doom-color 'red))
;;   `(region :background ,(doom-blend (doom-color 'blue) "#111111" 0.2))
;;   `(evil-ex-lazy-highlight
;;     :background ,(doom-darken (doom-color 'yellow) 0.1)
;;     :foreground "black")
;;   `(evil-ex-search
;;     :background ,(doom-lighten (doom-color 'yellow) 0.2)
;;     :foreground "black")
;;   )
(custom-theme-set-faces! '(doom-monokai-octagon doom-monokai-spectrum)
  `(header-line :background ,(doom-color 'bg) :family ,(face-attribute 'sawyer--variable-face :family) :height 1.0 :weight semi-bold)
  `(region :background ,(doom-blend (doom-color 'cyan) "#111111" 0.4))
  `(line-number :foreground ,(doom-lighten (doom-color 'bg) 0.1) :height 1.0)
  `(line-number-current-line :foreground ,(doom-lighten (doom-color 'bg) 0.3):height 1.0)
  `(evil-ex-lazy-highlight
    :background ,(doom-darken (doom-color 'yellow) 0.1)
    :foreground "black")
  `(evil-ex-search
    :background ,(doom-lighten (doom-color 'yellow) 0.2)
    :foreground "black")
  )
;; (after! tree-sitter
;;   (custom-theme-set-faces! 'doom-horizon
;;     `(tree-sitter-hl-face:property :foreground ,(doom-darken (doom-color 'fg) 0.1))
;;     `(tree-sitter-hl-face:keyword :foreground ,(doom-color 'orange))
;;     `(tree-sitter-hl-face:constant.builtin :weight bold)
;;     `(tree-sitter-hl-face:comment :slant normal
;;                                   :foreground "#505872")
;;     )
;;   )

;; (custom-theme-set-faces! 'doom-old-hope
;;   ;; `(default :foreground "#87939c" :background "#0A0E14")
;;   `(line-number :foreground ,(doom-darken 'fg 0.8)
;;                 :background ,(doom-darken 'bg 0.5)
;;                 )
;;   `(font-lock-keyword-face :weight semi-bold
;;                            :foreground "#FF8F40"
;;                            )
;;   `(font-lock-builtin-face :weight semi-bold
;;                            :foreground "#F29668")
;;   `(font-lock-constant-face :weight semi-bold
;;                             :foreground "#FFEE99"
;;                             )
;;   `(font-lock-variable-name-face :foreground "#59C2FF")
;;   `(font-lock-preprocessor-face :foreground "tomato")
;;   `(font-lock-string-face :foreground "#b6ce89" :background "#1c2512")
;;   `(font-lock-type-face :weight semi-bold :foreground "#F07178")
;;   `(font-lock-function-name-face :foreground "#FFB454")
;;   `(font-lock-doc-face :foreground "#A1AC88")
;;   `(font-lock-comment-face :foreground "#626A73")
;;   `(highlight-numbers-number :foreground "#E6B673")
;;   `(border :foreground "#4D5566")
;;  )

;; (custom-theme-set-faces! 'doom-tomorrow-day
;;   `(font-lock-string-face :background "#ccddee")
;;   `(treemacs-root-face :background ,(doom-darken 'bg 0.1))
;;   )

(custom-theme-set-faces! 'doom-moonlight
  `(font-lock-constant-face :foreground ,(doom-color 'magenta)
                            :weight bold)
  )

(after! doom-modeline
  (setq doom-modeline-major-mode-icon t)
  (custom-set-faces!
    `(doom-modeline-project-dir :weight semi-bold :background ,(doom-color 'default))
    `(doom-modeline-persp-name :slant normal)
    )
  )

;; (use-package! terraform-mode
;;   :defer
;;   :config
;;   (custom-set-faces!
;;     `(terraform--resource-name-face :weight semi-bold :foreground ,(doom-color 'green))
;;     `(terraform--resource-type-face :weight semi-bold :foreground ,(doom-color 'blue))
;;     )
;;   )

;; (after! haskell
;;   (custom-set-faces!
;;     `(haskell-keyword-face :foreground "coral")
;;     `(haskell-pragma-face :weight semi-bold
;;                           :foreground ,(doom-color 'red)
;;                           :background ,(doom-darken 'bg 0.5))
;;     `(haskell-operator-face :foreground ,(doom-color 'orange))
;;     `(haskell-definition-face :foreground ,(doom-color 'blue))
;;     `(haskell-quasi-quote-face :foreground ,(doom-color 'magenta))
;;     `(haskell-type-face :weight semi-bold :foreground ,(doom-color 'orange))
;;     `(haskell-definition-face :weight semi-bold)
;;     )
;;   )

(after! hl-todo
  (setq hl-todo-keyword-faces
        `(("TODO"  . ,(face-foreground 'warning))
          ("FIXME" . ,(face-foreground 'error))
          ("XXX" . ,(face-foreground 'error))
          ("NOTE"  . ,(face-foreground 'success))))
  )

;; (use-package! treemacs
;;   :defer t
;;   :config
;;   ;; make this work with nano
;;   (setq treemacs-user-mode-line-format 'none)
;;   (custom-set-faces!
;;     `(treemacs-root-face :height 1.0 :weight semi-bold :slant normal )
;;     `(treemacs-directory-collapsed-face :height 0.9 :weight light :slant normal )
;;     `(treemacs-directory-face :height 0.9 :weight light :slant normal )
;;     `(treemacs-file-face :height 0.9 :weight light :slant normal )
;;     `(treemacs-fringe-indicator-face :height 0.9 :weight light :slant normal )
;;     `(treemacs-git-added-face :height 0.9 :weight light :slant normal )
;;     `(treemacs-git-conflict-face :height 0.9 :weight light :slant normal )
;;     `(treemacs-git-ignored-face :height 0.9 :weight light :slant normal )
;;     `(treemacs-git-modified-face :height 0.9 :weight light :slant normal )
;;     `(treemacs-git-renamed-face :height 0.9 :weight light :slant normal )
;;     `(treemacs-git-unmodified-face :height 0.9 :weight light :slant normal )
;;     `(treemacs-git-untracked-face :height 0.9 :weight light :slant normal )
;;     `(treemacs-help-column-face :height 0.9 :weight light :slant normal )
;;     `(treemacs-help-title-face :height 0.9 :weight light :slant normal )
;;     `(treemacs-on-failure-pulse-face :height 0.9 :weight light :slant normal )
;;     `(treemacs-on-success-pulse-face :height 0.9 :weight light :slant normal )
;;     `(treemacs-tags-face :height 0.9 :weight light :slant normal )
;;     `(treemacs-term-node-face :height 0.9 :weight light :slant normal )
;;     )
;;   )
(use-package! treemacs
  :defer t
  :config
  ;; (setq treemacs-window-background-color
  ;;       (cons
  ;;         ;; background color
  ;;         (doom-darken (doom-color 'bg) 0.4)
  ;;         ;; highlight color
  ;;         (doom-lighten (doom-color 'bg) 0.1)))
  (setq treemacs-width 40)
  (setq treemacs-position 'left)
  (custom-set-faces!
    `(treemacs-root-face :weight semi-bold :slant normal :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-directory-collapsed-face :height 0.9 :weight normal :slant normal :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-directory-face :height 0.9 :weight normal :slant normal :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-file-face :height 0.9 :weight normal :slant normal :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-fringe-indicator-face :height 0.9 :weight normal :slant normal :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-git-added-face :height 0.9 :weight normal :slant normal :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-git-conflict-face :height 0.9 :weight normal :slant normal :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-git-ignored-face :height 0.9 :weight normal :slant normal :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-git-modified-face :height 0.9 :weight normal :slant normal :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-git-renamed-face :height 0.9 :weight normal :slant normal :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-git-unmodified-face :height 0.9 :weight normal :slant normal :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-git-untracked-face :weight normal :slant normal :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-help-column-face :height 0.9 :weight normal :slant normal :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-help-title-face :height 0.9 :weight normal :slant normal :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-on-failure-pulse-face :height 0.9 :weight normal :slant normal :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-on-success-pulse-face :height 0.9 :weight normal :slant normal :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-tags-face :height 0.9 :weight normal :slant normal :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-term-node-face :height 0.9 :weight normal :slant normal :family ,(face-attribute 'sawyer--variable-face :family))
    )
  )

;; (defface code-face
;;   `((t :inherit sawyer--mono-face
;;        :height 1.2
;;        :weight light
;;     ))
;;   "code-face")

;; (add-hook! (prog-mode
;;             text-mode
;;             conf-toml-mode
;;             conf-space-mode
;;             gitignore-mode
;;             haskell-cabal-mode
;;             )
;;   (face-remap-add-relative 'default 'code-face)
;;   (face-remap-add-relative 'solaire-default-face 'code-face)
;;   ;; (setq-local default-text-properties '(line-spacing 0.2 line-height 1.1))
;;   (hl-line-mode 0)
;;   )

;; (after! flycheck-posframe
;;   (custom-set-faces!
;;     `(flycheck-posframe-background-face :background ,(doom-lighten 'bg 0.2))
;;     `(flycheck-posframe-face :foreground ,(doom-color 'red))
;;     )
;;   )

(defface org-face
  `((t :inherit sawyer--variable-face
       :weight normal
       :height 1.3
       ))
  "org-face")
(defface org-code-face
  `((t :inherit sawyer--mono-face
       :height 0.9
       ))
  "org-code-face")
(after! org
  (custom-set-faces!
    `(org-default :family ,(face-attribute 'sawyer--variable-face :family) :foreground "#8FA1B3" :background ,(doom-color 'bg))
    `(org-table :family ,(face-attribute 'sawyer--mono-face :family))
    `(org-block :family ,(face-attribute 'sawyer--mono-face :family) :background ,(doom-color 'bg))
    `(org-formula :background ,(doom-color 'bg))
    `(org-quote :family ,(face-attribute 'sawyer--variable-face :family) :background ,(doom-lighten 'bg 0.1) :slant italic)
    `(org-tag :foreground ,(doom-blend (doom-color 'magenta) (doom-color 'grey) 0.4))
    `(org-superstar-header-bullet :foreground "#ECBE7B")
    `(org-level-8 :family ,(face-attribute 'sawyer--variable-face :family) :height 0.9)
    `(org-level-7 :family ,(face-attribute 'sawyer--variable-face :family) :height 0.9)
    `(org-level-6 :family ,(face-attribute 'sawyer--variable-face :family) :height 0.9)
    `(org-level-5 :family ,(face-attribute 'sawyer--variable-face :family) :height 0.9)
    `(org-level-4 :family ,(face-attribute 'sawyer--variable-face :family) :height 0.9 :weight semi-bold :foreground "#8FA1B3")
    `(org-level-3 :family ,(face-attribute 'sawyer--variable-face :family) :height 1.0 :weight normal :foreground "#8FA1B3")
    `(org-level-2 :family ,(face-attribute 'sawyer--variable-face :family) :height 1.1 :weight semi-bold :foreground "#8FA1B3")
    `(org-level-1 :family ,(face-attribute 'sawyer--variable-face :family) :height 1.2 :weight normal :foreground "#8FA1B3")
    `(org-document-title :family ,(face-attribute 'sawyer--variable-face :family) :height 1.1 :weight semi-bold)
    )
  )

(add-hook! org-mode
  (hl-line-mode t)
  (face-remap-add-relative 'solaire-default-face 'org-face)
  (face-remap-add-relative 'default 'org-face)
  (face-remap-add-relative 'org-code 'org-code-face)
  (setq-local default-text-properties '(line-spacing 0.6 line-height 1.1))
  (setq-local left-margin-width 5)
  (setq-local right-margin-width 5)
  (setq-local display-line-numbers-type nil)
  (display-line-numbers-mode -1)
  (setq-local header-line-format " ")
  (set-window-buffer nil (current-buffer))
  (auto-save-mode t)
  ;; (setq
  ;;  ;; Edit settings
  ;;  org-auto-align-tags nil
  ;;  org-tags-column 0
  ;;  org-catch-invisible-edits 'show-and-error
  ;;  org-special-ctrl-a/e t
  ;;  org-insert-heading-respect-content t

  ;;  ;; Org styling, hide markup etc.
  ;;  org-hide-emphasis-markers t
  ;;  org-pretty-entities t
  ;;  org-ellipsis "…"

  ;;  ;; Agenda styling
  ;;  org-agenda-block-separator ?─
  ;;  org-agenda-time-grid
  ;;  '((daily today require-timed)
  ;;    (800 1000 1200 1400 1600 1800 2000)
  ;;    " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
  ;;  org-agenda-current-time-string
  ;;  "⭠ now ─────────────────────────────────────────────────")
  )

(after! tree-sitter
  (custom-theme-set-faces! 'doom-tokyo-night
    ;; `(tree-sitter-hl-face:comment :inherit font-lock-comment-face)
    ;; `(tree-sitter-hl-face:keyword :inherit font-lock-keyword-face)
    `(tree-sitter-hl-face:property :inherit font-lock-variable-name-face)
    `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:operator :foreground ,(doom-darken (doom-color 'red) 0.2))
    ;; `(tree-sitter-hl-face:variable :foreground ,(doom-blend 'red 'white 0.6))
    `(tree-sitter-hl-face:function.method :weight bold)
    `(tree-sitter-hl-face:function.call :weight bold)
    `(tree-sitter-hl-face:function :weight bold)
    `(tree-sitter-hl-face:property :weight bold)
    `(tree-sitter-hl-face:doc :foreground ,(doom-color 'blue))
    )
;;   (custom-theme-set-faces! 'doom-spacegrey
;;     `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'red) 0.2) :weight semi-bold)
;;     `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'red) 0.2) :weight semi-bold)
;;     `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'red) 0.2) :weight semi-bold)
;;     `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'red) 0.2) :weight semi-bold)
;;     `(tree-sitter-hl-face:constant :foreground ,(doom-color 'blue))
;;     `(tree-sitter-hl-face:comment :inherit font-lock-comment-face)
;;     )
;;   (custom-theme-set-faces! 'doom-tomorrow-night
;;     `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'red) 0.2) :weight semi-bold)
;;     `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'red) 0.2) :weight semi-bold)
;;     `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'red) 0.2) :weight semi-bold)
;;     `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'red) 0.2) :weight semi-bold)
;;     `(tree-sitter-hl-face:constant :foreground ,(doom-color 'blue))
;;     )
;;   (custom-theme-set-faces! 'doom-ayu-mirage
;;     `(tree-sitter-hl-face:type :foreground ,(doom-color 'red) :weight semi-bold)
;;     `(tree-sitter-hl-face:constructor :foreground ,(doom-lighten 'red 0.3) :weight semi-bold)
;;     `(tree-sitter-hl-face:method.call :weight semi-bold)
;;     `(tree-sitter-hl-face:keyword :foreground ,(doom-darken (doom-color 'cyan) 0.1) :weight semi-bold)
;;     `(tree-sitter-hl-face:function :foreground ,(doom-lighten (doom-color 'cyan) 0.1) :weight semi-bold)
;;     `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'cyan) 0.2) :weight semi-bold)
;;     `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'cyan) 0.2) :weight semi-bold)
;;     `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'cyan) 0.2) :weight semi-bold)
;;     `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'cyan) 0.2) :weight semi-bold)
;;     `(tree-sitter-hl-face:operator :foreground ,(doom-darken (doom-color 'cyan) 0.2) :weight semi-bold)
;;     `(tree-sitter-hl-face:constant :foreground ,(doom-color 'blue) :weight semi-bold)
;;     `(tree-sitter-hl-face:comment :foreground ,(doom-blend (doom-color 'blue) "#888888" 0.4))
;;     `(tree-sitter-hl-face:variable :foreground ,(doom-blend (doom-color 'blue) "#aaaaaa" 0.2) :weight semi-bold)
;;     `(tree-sitter-hl-face:string :background ,(doom-lighten (doom-color 'bg) 0.1) :foreground ,(doom-blend (doom-color 'blue) "#888888" 0.5))
;;     )
;;   (custom-theme-set-faces! 'doom-snazzy
;;     `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'red) 0.2))
;;     `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'red) 0.2))
;;     `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'red) 0.2))
;;     `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'red) 0.2))
;;     `(tree-sitter-hl-face:operator :foreground ,(doom-darken (doom-color 'red) 0.2))
;;     `(tree-sitter-hl-face:variable :foreground ,(doom-blend 'cyan 'white 0.6))
;;     )
  (custom-theme-set-faces! 'doom-moonlight
    `(tree-sitter-hl-face:variable :foreground ,(doom-color 'default))
    `(tree-sitter-hl-face:keyword :foreground ,(doom-color 'red) :weight semi-bold)
    )
;;   (custom-theme-set-faces! 'doom-snazzy
;;     `(font-lock-string-face :background ,(doom-lighten (doom-color 'bg) 0.05))
;;     `(markdown-inline-code-face :background ,(doom-lighten (doom-color 'bg) 0.05))
;;     `(markdown-code-face :background ,(doom-lighten (doom-color 'bg) 0.15))
;;     )
  (custom-theme-set-faces! '(doom-monokai-octagon doom-monokai-spectrum)
    `(tree-sitter-hl-face:comment :inherit font-lock-comment-face)
    `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'cyan) 0.2))
    `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'cyan) 0.2))
    `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'cyan) 0.2))
    `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'cyan) 0.2))
    `(tree-sitter-hl-face:operator :foreground ,(doom-darken (doom-color 'cyan) 0.2))
    `(tree-sitter-hl-face:variable :foreground ,(doom-blend 'cyan 'white 0.6))
    )
  )

;; (after! ccls
;;   (custom-set-faces!
;;     `(ccls-skipped-range-face :inherit 'font-lock-comment-face)
;;     )
;;   )

(add-hook! elisp #'rainbow-mode 1)

(use-package! info-colors
  :commands (info-colors-fontify-node))
(add-hook 'Info-selection-hook 'info-colors-fontify-node)

;; (modify-all-frames-parameters
;;  '((right-divider-width . 16)
;;    (internal-border-width . 16)))
;; (dolist (face '(window-divider
;;                 window-divider-first-pixel
;;                 window-divider-last-pixel))
;;   (face-spec-reset-face face)
;;   (set-face-foreground face (face-attribute 'default :background)))
;; (set-face-background 'fringe (face-attribute 'default :background))
(setq
 ;; Edit settings
 org-auto-align-tags nil
 org-tags-column 0
 org-fold-catch-invisible-edits 'show-and-error
 org-special-ctrl-a/e t
 org-insert-heading-respect-content t

 ;; Org styling, hide markup etc.
 org-hide-emphasis-markers t
 org-pretty-entities t
 org-ellipsis "…"

 ;; Agenda styling
 org-agenda-block-separator ?─
 org-agenda-time-grid
 '((daily today require-timed)
   (800 1000 1200 1400 1600 1800 2000)
   " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
 org-agenda-current-time-string
 "⭠ now ─────────────────────────────────────────────────")
(add-hook 'org-mode-hook #'org-modern-mode)
;; (add-hook 'org-mode-hook #'+zen/toggle)
(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)

;; (after! rustic
;;   (custom-set-faces!
;;     `(lsp-rust-analyzer-inlay-face :inherit font-lock-comment-face
;;                                    :weight light
;;                                    :height 0.8)
;;     )
;;   )
