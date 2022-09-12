;;;  -*- lexical-binding: t; -*-

(setq default-frame-alist
      (append (list
               '(inhibit-double-buffering . t)
               '(min-height . 1)
               '(height . 45)
               '(min-width . 1)
               '(width . 81)
               '(vertical-scroll-bars . nil)
               '(internal-border-width . 20)
               '(left-fringe . 0)
               '(right-fringe . 0)
               '(tool-bar-lines . 0)
               '(menu-bar-lines . 0)
               )))
(when (and IS-MAC (display-graphic-p))
  (menu-bar-mode))

(defface sawyer--mono-face
  `((t :inherit default-face
       :family "PragmataPro Liga"
       ))
  "font spec for all monospace text")

(defface sawyer--variable-face
  `((t :inherit default-face
       :family "IBM Plex Sans"
       :weight medium))
  "font spec for all variable-width text")

;; TODO can height be defined with a var?
(defface code-face
  `((t :inherit sawyer--mono-face
       :height 1.2
    ))
  "code-face")
;; TODO: figure out how to make the family dynamic
(defface org-face
  `((t :inherit sawyer--variable-face
       :height 1.1
       :weight normal
       ))
  "org-face")
(defface org-code-face
  `((t :inherit code-face
       :height 0.8
       :weight light
       ))
  "org-code-face")

(defcustom sawyer--baseline-font-size 18.0 "baseline font point size for doom-font and textsize")
(defcustom sawyer--dark-theme 'doom-tokyo-night "dark theme used for toggling")
(defcustom sawyer--light-theme 'doom-nord-light "light theme used for toggling")

(defun sawyer--light-switch ()
  "toggle between light and dark themes"
  (interactive)
  (if (eq doom-theme sawyer--light-theme)
      (load-theme sawyer--dark-theme 't)
      (load-theme sawyer--light-theme 't))
  )
(load-theme sawyer--dark-theme 't)
(setq doom-font
  (font-spec
   :family (face-attribute 'sawyer--mono-face :family)
   :size sawyer--baseline-font-size
   :weight 'light))
(setq doom-variable-pitch-font
  (font-spec
   :family (face-attribute 'sawyer--variable-face :family)
   :size 15
   :weight 'medium))

;; disable solaire mode on GUI
(after! solaire-mode
  (when (display-graphic-p)
    (solaire-global-mode -1)))
(custom-set-faces!
  `(font-lock-type-face :weight semi-bold)
  `(font-lock-function-name-face :weight semi-bold)
  `(font-lock-string-face :background ,(doom-lighten 'bg 0.05))
  `(mode-line :family ,(face-attribute 'sawyer--variable-face :family))
  `(mode-line-inactive :family ,(face-attribute 'sawyer--variable-face :family))
  `(variable-pitch :family ,(face-attribute 'sawyer--variable-face :family))
  `(+workspace-tab-face :family ,(face-attribute 'sawyer--variable-face :family))
  `(+workspace-tab-selected-face :family ,(face-attribute 'sawyer--variable-face :family))
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
  `(lsp-face-highlight-textual :foreground ,(doom-lighten 'fg 0.1) :background ,(doom-darken 'bg 0.5))
  `(ediff-fine-diff-A :background ,(doom-blend 'red 'bg 0.3) :semi-bold 'semi-bold)
  `(magit-blame-heading :background "#111111")
  `(internal-border :foreground "#000000")
  `(vertical-border :foreground "#000000")
  `(border :foreground "#000000")
  `(+org-todo-active :foreground "green")
  `(+org-todo-cancel :foreground "red")
  `(+org-todo-onhold :foreground "yellow")
  `(org-todo :foreground "cyan" :family ,(face-attribute 'sawyer--variable-face :family))
  `(org-done :foreground "gray" :family ,(face-attribute 'sawyer--variable-face :family))
  `(org-headline-done :foreground "#555555")
  `(line-number
    :foreground ,(doom-lighten (doom-color 'bg) 0.1)
    :height 1.0)
  `(line-number-current-line
    :foreground ,(doom-lighten (doom-color 'bg) 0.3)
    :height 1.0)
  )

(after! tree-sitter
  (custom-set-faces!
    '(tree-sitter-hl-face:property :slant normal)
    '(tree-sitter-hl-face:keyword :weight bold)
    '(tree-sitter-hl-face:comment :slant normal)
    )
  )

(custom-theme-set-faces! 'doom-spacegrey
  `(default :foreground "#b1bbcb" :background "#1c212c")
  `(header-line :background "#1c212c" :family ,(face-attribute 'sawyer--variable-face :family) :height 1.0 :weight semi-bold)
  `(line-number :foreground "#393e45"
                :background "#1c212c"
                :height 1.2)
  `(line-number-current-line :foreground ,(doom-lighten (doom-color 'bg) 0.4)
                             :height 1.2)
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
  `(font-lock-comment-face :foreground ,(doom-blend (doom-color 'cyan) "#555555" 0.2))
  `(lsp-headerline-breadcrumb-project-prefix-face :background "#1f242f")
  `(lsp-headerline-breadcrumb-path-face :background "#1f242f")
  `(lsp-headerline-breadcrumb-symbols-face :background "#1f242f")
  `(lsp-headerline-breadcrumb-path-hint-face :background "#1f242f")
  `(lsp-headerline-breadcrumb-path-info-face :background "#1f242f")
  `(lsp-headerline-breadcrumb-separator-face :background "#1f242f")
  `(lsp-headerline-breadcrumb-deprecated-face :background "#1f242f")
  `(lsp-headerline-breadcrumb-path-error-face :background "#1f242f")
  `(lsp-headerline-breadcrumb-symbols-hint-face :background "#1f242f")
  `(lsp-headerline-breadcrumb-symbols-info-face :background "#1f242f")
  `(lsp-headerline-breadcrumb-path-warning-face :background "#1f242f")
  `(lsp-headerline-breadcrumb-symbols-error-face :background "#1f242f")
  `(lsp-headerline-breadcrumb-symbols-warning-face :background "#1f242f")
  `(lsp-headerline-breadcrumb-unknown-project-prefix-face :background "#1f242f")
 )

(custom-theme-set-faces! 'doom-ayu-mirage
  `(line-number :inherit default
                :foreground ,(doom-lighten 'bg 0.2)
                :background ,(doom-darken 'bg 0.1)
                :height 1.0)
  `(solaire-header-line-face :height 1.1)
  `(font-lock-keyword-face :foreground ,(doom-color 'cyan) :weight semi-bold)
  `(font-lock-builtin-face :foreground ,(doom-color 'blue) :weight semi-bold)
  `(font-lock-constant-face :foreground ,(doom-color 'blue) :weight semi-bold)
  `(font-lock-string-face :background ,(doom-lighten (doom-color 'bg) 0.1) :foreground ,(doom-blend (doom-color 'red) "#aaaaaa" 0.2))
  `(font-lock-function-name-face :weight semi-bold)
  `(font-lock-type-face :foreground ,(doom-color 'red) :weight semi-bold)
  `(font-lock-variable-name-face :foreground ,(doom-blend (doom-color 'blue) "#aaaaaa" 0.2) :weight semi-bold)
  `(font-lock-doc-face :foreground ,(doom-color 'blue))
  `(font-lock-comment-face :foreground ,(doom-blend (doom-color 'blue) "#888888" 0.4))
  `(ediff-fine-diff-A :background ,(doom-blend 'red 'bg 0.3) :semi-bold 'semi-bold)
  )
  (setq
      evil-insert-state-cursor '(bar "green")
      evil-replace-state-cursor '(box "red")
      evil-visual-state-cursor '(hollow "yellow"))

(custom-theme-set-faces! 'doom-tomorrow-night
  `(font-lock-string-face :background ,(doom-lighten (doom-color 'bg) 0.05)
                          :foreground ,(doom-blend (doom-color 'blue) "#aaaaaa" 0.5))
  )

(custom-theme-set-faces! 'doom-horizon
  `(font-lock-string-face :background ,(doom-lighten (doom-color 'bg) 0.05)
                          :foreground ,(doom-color 'fg))
  `(font-lock-comment-face :slant normal
                           :foreground "#505872")
  `(doom-modeline-buffer-path :foreground ,(doom-color 'blue))
  `(doom-modeline-buffer-file :foreground ,(doom-color 'blue))
  `(doom-modeline-buffer-project-root :foreground ,(doom-color 'blue))
  `(doom-modeline-project-dir :foreground ,(doom-color 'blue))
  `(doom-modeline-buffer-modified :foreground ,(doom-color 'red))
  `(region :background ,(doom-blend (doom-color 'blue) "#111111" 0.2))
  `(evil-ex-lazy-highlight
    :background ,(doom-darken (doom-color 'yellow) 0.1)
    :foreground "black")
  `(evil-ex-search
    :background ,(doom-lighten (doom-color 'yellow) 0.2)
    :foreground "black")
  )
(custom-theme-set-faces! '(doom-monokai-octagon doom-monokai-spectrum)
  `(default :inherit default :background ,(doom-darken (doom-color 'bg) 0.2))
  `(vertical-border :inherit vertical-border :background ,(doom-darken (doom-color 'bg) 0.3))
  `(header-line
    :background ,(doom-darken (doom-color 'bg) 0.2)
    :family ,(face-attribute 'sawyer--variable-face :family)
    :height 1.0
    :weight semi-bold)
  `(region :background ,(doom-blend (doom-color 'blue) "#111111" 0.2))
  `(line-number
    :foreground ,(doom-lighten (doom-color 'bg) 0.1)
    :height 1.0)
  `(line-number-current-line
    :foreground ,(doom-darken (doom-color 'cyan) 0.3)
    :height 1.0)
  `(evil-ex-lazy-highlight
    :background ,(doom-darken (doom-color 'yellow) 0.1)
    :foreground "black")
  `(evil-ex-search
    :background ,(doom-lighten (doom-color 'yellow) 0.2)
    :foreground "black")
  `(font-lock-comment-face :foreground ,(doom-darken (doom-color 'cyan) 0.4))
  `(font-lock-variable-name-face :foreground ,(doom-blend (doom-color 'cyan) "#ffffff" 0.5))
  `(font-lock-keyword-face :weight bold)
  `(font-lock-builtin-face :weight bold)
  `(org-face
    :family ,(face-attribute 'sawyer--variable-face :family)
    :weight normal
    :foreground ,(doom-blend (doom-color 'fg) (doom-color 'cyan) 0.7))
  `(org-code-face
    :family ,(face-attribute 'sawyer--mono-face :family)
    :weight light
    :foreground ,(doom-color 'cyan))
  `(org-document-title :foreground ,(doom-color 'fg))
  `(org-modern-symbol :foreground ,(doom-color 'red))
  `(org-list-dt :foreground ,(doom-color 'red))
  `(lsp-face-highlight-textual :background ,(doom-lighten (doom-color 'bg) 0.2))
  )
(after! org
  (custom-theme-set-faces! '(doom-monokai-octagon doom-monokai-spectrum)
  `(org-face
    :family ,(face-attribute 'sawyer--variable-face :family)
    :weight normal
    :foreground ,(doom-blend (doom-color 'fg) (doom-color 'cyan) 0.7))
  `(org-code-face
    :family ,(face-attribute 'sawyer--mono-face :family)
    :weight light
    :foreground ,(doom-color 'cyan))
  `(org-document-title :foreground ,(doom-color 'fg))
  `(org-modern-symbol :foreground ,(doom-color 'red))
  `(org-list-dt :foreground ,(doom-color 'red))
  ))

(custom-theme-set-faces! 'doom-tokyo-night
  `(line-number
    :foreground ,(doom-lighten (doom-color 'bg) 0.2)
    :height 1.0)
  `(line-number-current-line
    :foreground ,(doom-lighten (doom-color 'bg) 0.4)
    :height 1.0)
  `(font-lock-keyword-face :weight bold)
  `(font-lock-builtin-face :weight bold)
  `(org-document-title :foreground ,(doom-color 'fg))
  `(org-superstar-header-bullet :foreground ,(doom-color 'red))
  `(org-modern-symbol :foreground ,(doom-color 'red))
  `(org-list-dt :foreground ,(doom-color 'red))
  `(treemacs-root-face :foreground ,(doom-color 'red))
  `(doom-themes-treemacs-root-face :foreground ,(doom-color 'red))
  `(treemacs-header-button-face :foreground ,(doom-color 'red))
  `(font-lock-keyword-face :weight bold :foreground ,(doom-color 'yellow))
  `(font-lock-type-face :weight bold :foreground ,(doom-color 'red))
  `(font-lock-comment-face :foreground "#446597")
  `(dockerfile-image-name :foreground ,(doom-color 'cyan))
  `(highlight-numbers-number :foreground ,(doom-color 'red))
  )

(custom-theme-set-faces! 'doom-nord-light
  `(line-number
    :foreground ,(doom-darken (doom-color 'bg) 0.1)
    :height 1.0)
  `(line-number-current-line
    :foreground ,(doom-darken (doom-color 'bg) 0.3)
    :height 1.0)
  `(font-lock-keyword-face :weight bold)
  `(font-lock-builtin-face :weight bold)
  `(org-modern-symbol :foreground ,(doom-color 'red))
  `(org-list-dt :foreground ,(doom-color 'red))
  `(treemacs-root-face :foreground ,(doom-color 'red))
  `(doom-themes-treemacs-root-face :foreground ,(doom-color 'red))
  `(treemacs-header-button-face :foreground ,(doom-color 'red))
  `(lsp-face-highlight-textual
    :foreground ,(doom-color 'fg)
    :background ,(doom-color 'bg))
  `(font-lock-keyword-face :weight bold :foreground)
  `(font-lock-type-face :weight bold :foreground)
  `(dockerfile-image-name :foreground ,(doom-color 'cyan))
  `(highlight-numbers-number :foreground ,(doom-color 'red))
  )
(after! treemacs
  (when (eq doom-theme 'doom-nord-light)
    (setq treemacs-window-background-color `("#d4d6e4" . "#e7ebf1"))))

(custom-theme-set-faces! 'doom-old-hope
  `(default :foreground "#87939c" :background "#0A0E14")
  `(line-number :foreground ,(doom-darken 'fg 0.8)
                :background ,(doom-darken 'bg 0.5)
                )
  `(font-lock-keyword-face :weight semi-bold
                           :foreground "#FF8F40"
                           )
  `(font-lock-builtin-face :weight semi-bold
                           :foreground "#F29668")
  `(font-lock-constant-face :weight semi-bold
                            :foreground "#FFEE99"
                            )
  `(font-lock-variable-name-face :foreground "#59C2FF")
  `(font-lock-preprocessor-face :foreground "tomato")
  `(font-lock-string-face :foreground "#b6ce89" :background "#1c2512")
  `(font-lock-type-face :weight semi-bold :foreground "#F07178")
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

(custom-theme-set-faces! 'doom-snazzy
  `(default :foreground "#ccddee")
  )

(after! doom-modeline
  (setq doom-modeline-major-mode-icon t)
  (custom-set-faces!
    `(doom-modeline-project-dir :weight semi-bold :background ,(doom-color 'default))
    `(doom-modeline-persp-name :slant normal)
    )
  )

(use-package! terraform-mode
  :defer
  :config
  (custom-set-faces!
    `(terraform--resource-name-face :weight semi-bold :foreground ,(doom-color 'green))
    `(terraform--resource-type-face :weight semi-bold :foreground ,(doom-color 'blue))
    )
  )

(after! haskell
  (custom-set-faces!
    `(haskell-keyword-face :foreground "coral")
    `(haskell-pragma-face :weight semi-bold
                          :foreground ,(doom-color 'red)
                          :background ,(doom-darken 'bg 0.5))
    `(haskell-operator-face :foreground ,(doom-color 'orange))
    `(haskell-definition-face :foreground ,(doom-color 'blue))
    `(haskell-quasi-quote-face :foreground ,(doom-color 'magenta))
    `(haskell-type-face :weight semi-bold :foreground ,(doom-color 'orange))
    `(haskell-definition-face :weight semi-bold)
    )
  )

(after! hl-todo
  (setq hl-todo-keyword-faces
        `(("TODO"  . ,(face-foreground 'warning))
          ("FIXME" . ,(face-foreground 'error))
          ("XXX" . ,(face-foreground 'error))
          ("NOTE"  . ,(face-foreground 'success))))
  )

(use-package! treemacs
  :defer t
  :config
  (setq treemacs-window-background-color
        (cons
          ;; background color
          (doom-darken (doom-color 'bg) 0.4)
          ;; highlight color
          (doom-lighten (doom-color 'bg) 0.1)))
  (setq treemacs-width 40)
  (custom-set-faces!
    `(treemacs-root-face
      :height 1.2
      :weight semi-bold
      :slant normal
      :family ,(face-attribute 'sawyer--variable-face :family)
      :background ,(doom-color 'bg)
      )
    `(treemacs-directory-collapsed-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-directory-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-file-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-fringe-indicator-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-git-added-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-git-conflict-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-git-ignored-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-git-modified-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-git-renamed-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-git-unmodified-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-git-untracked-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-help-column-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-help-title-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-on-failure-pulse-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-on-success-pulse-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-tags-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer--variable-face :family))
    `(treemacs-term-node-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer--variable-face :family))
    )
  )

(add-hook! (prog-mode
            text-mode
            conf-toml-mode
            conf-space-mode
            gitignore-mode
            go-template-mode
            )
  (face-remap-add-relative 'default 'code-face)
  (setq-default default-text-properties '(line-spacing 0.2 line-height 1.2))
  (setq-local default-text-properties '(line-spacing 0.2 line-height 1.2))
  )

(after! flycheck-posframe
  (custom-set-faces!
    `(flycheck-posframe-background-face :background ,(doom-lighten 'bg 0.1))
    )
  )

(after! flycheck
  (custom-set-faces!
    `(flycheck-error :background ,(doom-darken (doom-color 'red) 0.3) :foreground "white")
    `(flycheck-info :background ,(doom-darken (doom-color 'green) 0.3) :foreground "green")
    `(flycheck-warning :background ,(doom-darken (doom-color 'yellow) 0.3) :foreground "black")
    ))

(after! org
  (custom-set-faces!
    `(org-table :family ,(face-attribute 'sawyer--mono-face :family) :height 0.8)
    `(org-block :inherit 'org-code-face :background ,(doom-color 'bg))
    `(org-formula :inherit 'org-code-face :background ,(doom-color 'bg))
    `(org-quote :inherit 'org-face :background ,(doom-lighten 'bg 0.1) :slant italic)
    `(org-tag :foreground ,(doom-blend (doom-color 'magenta) (doom-color 'grey) 0.4))
    `(org-modern-symbol :foreground ,(doom-color 'red))
    `(org-level-8 :inherit 'org-face :height 0.9)
    `(org-level-7 :inherit 'org-face :height 0.9)
    `(org-level-6 :inherit 'org-face :height 0.9)
    `(org-level-5 :inherit 'org-face :height 0.9)
    `(org-level-4 :inherit 'org-face :height 0.9 :weight semi-bold)
    `(org-level-3 :inherit 'org-face :height 1.0 :weight normal)
    `(org-level-2 :inherit 'org-face :height 1.05 :weight semi-bold)
    `(org-level-1 :inherit 'org-face :height 1.2 :weight normal)
    `(org-document-title :inherit 'org-face :height 1.1 :weight semi-bold)
    )
  )

(add-hook! org-mode
  (face-remap-add-relative 'solaire-default-face 'org-face)
  (face-remap-add-relative 'default 'org-face)
  (face-remap-add-relative 'org-code 'org-code-face)
  (setq-local left-margin-width 5)
  (setq-local right-margin-width 5)
  (setq-local display-line-numbers-type nil)
  (display-line-numbers-mode -1)
  (setq-local header-line-format " ")
  (set-window-buffer nil (current-buffer))
  (auto-save-mode t)
  )

(after! tree-sitter
  (custom-theme-set-faces! 'doom-horizon
    `(tree-sitter-hl-face:property :foreground ,(doom-darken (doom-color 'fg) 0.1))
    `(tree-sitter-hl-face:keyword :foreground ,(doom-color 'orange))
    `(tree-sitter-hl-face:constant.builtin :weight bold)
    `(tree-sitter-hl-face:comment :slant normal
                                  :foreground "#505872")
    )
  (custom-theme-set-faces! 'doom-spacegrey
    `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'red) 0.2) :weight semi-bold)
    `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'red) 0.2) :weight semi-bold)
    `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'red) 0.2) :weight semi-bold)
    `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'red) 0.2) :weight semi-bold)
    `(tree-sitter-hl-face:constant :foreground ,(doom-color 'blue))
    `(tree-sitter-hl-face:comment :inherit font-lock-comment-face)
    )
  (custom-theme-set-faces! 'doom-tomorrow-night
    `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'red) 0.2) :weight semi-bold)
    `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'red) 0.2) :weight semi-bold)
    `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'red) 0.2) :weight semi-bold)
    `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'red) 0.2) :weight semi-bold)
    `(tree-sitter-hl-face:constant :foreground ,(doom-color 'blue))
    `(tree-sitter-hl-face:comment :inherit font-lock-comment-face)
    )
  (custom-theme-set-faces! 'doom-ayu-mirage
    `(tree-sitter-hl-face:type :foreground ,(doom-color 'red) :weight semi-bold)
    `(tree-sitter-hl-face:constructor :foreground ,(doom-lighten 'red 0.3) :weight semi-bold)
    `(tree-sitter-hl-face:method.call :weight semi-bold)
    `(tree-sitter-hl-face:keyword :foreground ,(doom-darken (doom-color 'cyan) 0.1) :weight semi-bold)
    `(tree-sitter-hl-face:function :foreground ,(doom-lighten (doom-color 'cyan) 0.1) :weight semi-bold)
    `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'cyan) 0.2) :weight semi-bold)
    `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'cyan) 0.2) :weight semi-bold)
    `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'cyan) 0.2) :weight semi-bold)
    `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'cyan) 0.2) :weight semi-bold)
    `(tree-sitter-hl-face:operator :foreground ,(doom-darken (doom-color 'cyan) 0.2) :weight semi-bold)
    `(tree-sitter-hl-face:constant :foreground ,(doom-color 'blue) :weight semi-bold)
    `(tree-sitter-hl-face:comment :foreground ,(doom-blend (doom-color 'blue) "#888888" 0.4))
    `(tree-sitter-hl-face:variable :foreground ,(doom-blend (doom-color 'blue) "#aaaaaa" 0.2) :weight semi-bold)
    `(tree-sitter-hl-face:string :background ,(doom-lighten (doom-color 'bg) 0.1) :foreground ,(doom-blend (doom-color 'blue) "#888888" 0.5))
    )
  (custom-theme-set-faces! 'doom-snazzy
    `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:operator :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:variable :foreground ,(doom-blend 'cyan 'white 0.6))
    )
  (custom-theme-set-faces! 'doom-moonlight
    `(tree-sitter-hl-face:variable :foreground ,(doom-color 'default))
    `(tree-sitter-hl-face:keyword :foreground ,(doom-color 'red) :weight semi-bold)
    )
  (custom-theme-set-faces! 'doom-snazzy
    `(font-lock-string-face :background ,(doom-lighten (doom-color 'bg) 0.05))
    `(markdown-inline-code-face :background ,(doom-lighten (doom-color 'bg) 0.05))
    `(markdown-code-face :background ,(doom-lighten (doom-color 'bg) 0.15))
    )
  (custom-theme-set-faces! '(doom-monokai-octagon doom-monokai-spectrum)
    `(tree-sitter-hl-face:comment :inherit font-lock-comment-face)
    `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:operator :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:variable :foreground ,(doom-blend 'cyan 'white 0.6))
    )
  (custom-theme-set-faces! 'doom-tokyo-night
    `(tree-sitter-hl-face:comment :inherit font-lock-comment-face)
    `(tree-sitter-hl-face:keyword :inherit font-lock-keyword-face :weight bold)
    `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:operator :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:function.method :foreground ,(doom-color 'orange) :weight bold)
    `(tree-sitter-hl-face:function.call :foreground ,(doom-color 'yellow) :weight bold)
    `(tree-sitter-hl-face:function :foreground ,(doom-color 'orange) :weight bold)
    `(tree-sitter-hl-face:variable :foreground ,(doom-blend 'red 'white 0.6))
    `(tree-sitter-hl-face:variable.parameter :foreground ,(doom-blend 'red 'white 0.6))
    `(tree-sitter-hl-face:property :foreground ,(doom-blend 'red 'white 0.6))
    `(tree-sitter-hl-face:property.definition :foreground ,(doom-blend 'red 'white 0.6) :weight bold)
    `(tree-sitter-hl-face:number :inherit highlight-numbers-number)
    `(tree-sitter-hl-face:type :inherit font-lock-type-face :weight bold)
    )
  (custom-theme-set-faces! 'doom-nord-light
    `(tree-sitter-hl-face:comment :inherit font-lock-comment-face)
    `(tree-sitter-hl-face:keyword :weight bold :foreground ,(doom-color 'orange))
    `(tree-sitter-hl-face:property :inherit font-lock-variable-name-face)
    `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:operator :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:number :inherit highlight-numbers-number)
    `(tree-sitter-hl-face:type :inherit font-lock-type-face)
    )
  )

(after! ccls
  (custom-set-faces!
    `(ccls-skipped-range-face :inherit 'font-lock-comment-face)
    )
  )

(add-hook! elisp #'rainbow-mode 1)

(after! vertico-posframe
  (setq vertico-posframe-border-width 10)
  (custom-set-faces!
    `(vertico-posframe-border :background ,(doom-lighten (doom-color 'bg) 0.05))
    )
  )

(after! writeroom-mode
  (setq-default +zen-text-scale 1)
  (setq-default writeroom-width 100))

(when (display-graphic-p)
  (use-package textsize
    :commands textsize-mode
    :init (textsize-mode)
    :config
    (setq textsize-default-points sawyer--baseline-font-size)
    (setq textsize-pixel-pitch-thresholds
          ;; 15" MBP:       0.171875
          ;; 24" 4K:        0.174
          ;; 34" superwide: 0.233
          '((0 . 4)
            (0.12 . 1.9)
            (0.17 . 2.5)
            (0.174 . 0.6)
            (0.18 . -3.5)))
        ; (setq textsize-monitor-size-thresholds
        ;       '((0 . -3)
        ;        (350 . 0)
        ;        (500 . 3)))
    ))
(after! org-modern
  ;; table styles are still kinda messed up: https://github.com/minad/org-modern/issues/5
  (setq org-modern-table nil)
  )
(add-hook! org-mode #'org-modern-mode)
(add-hook! org-agenda-finalize #'org-modern-agenda)
