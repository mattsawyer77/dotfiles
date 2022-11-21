;;;  -*- lexical-binding: t; -*-

(setq default-frame-alist
      (append (list
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
;; (when (and IS-MAC (display-graphic-p))
;;   (menu-bar-mode))

(defface sawyer/mono-face
  `((t :inherit default
     :family "Input"
     :weight normal
     ;; :family "PragmataPro Liga" :weight normal
     ;; :family "JetBrains Mono" :weight thin
     ;; :family "Iosevka Extended" :weight extra-light
     ))
  "font spec for all monospace text")

(defface sawyer/variable-face
  `((t :inherit default
       :family "IBM Plex Sans"
       :weight bold
       ))
  "font spec for all variable-width text")

;; TODO can height be defined with a var?
(defface code-face
  `((t :inherit sawyer/mono-face
       :height 1.2
       :weight normal
    ))
  "code-face")
;; TODO: figure out how to make the family dynamic
(defface org-face
  `((t :inherit sawyer/variable-face
       :height 1.1
       :weight normal
       ))
  "org-face")
(defface org-code-face
  `((t :inherit code-face
       :height 0.8
       :weight normal
       ))
  "org-code-face")

(defcustom sawyer/baseline-font-size 18.0 "baseline font point size for doom-font and textsize" :type 'number)
(defcustom sawyer/dark-theme 'doom-tokyo-night "dark theme used for toggling" :type 'string)
(defcustom sawyer/light-theme 'doom-nord-light "light theme used for toggling" :type 'string)

(setq doom-tokyo-night-brighter-comments t)

(defun sawyer/light-switch ()
  "toggle between light and dark themes"
  (interactive)
  (if (eq doom-theme sawyer/light-theme)
      (load-theme sawyer/dark-theme 't)
      (load-theme sawyer/light-theme 't))
  )
(load-theme sawyer/dark-theme 't)
(setq doom-font
  (font-spec
   :family (face-attribute 'sawyer/mono-face :family)
   :size sawyer/baseline-font-size
   :weight 'normal
   ))
(setq doom-variable-pitch-font
  (font-spec
   :family (face-attribute 'sawyer/variable-face :family)
   :size 15
   :weight 'medium
   ))

;; disable solaire mode on GUI
(after! solaire-mode
  (when (display-graphic-p)
    (solaire-global-mode -1)))

(after! doom-themes
  (setq doom-themes-enable-italic nil)
  )

(after! tree-sitter
  (custom-set-faces!
    `(tree-sitter-hl-face:property :slant normal :inherit font-lock-constant-face)
    )
  )

(after! doom-themes
  (custom-set-faces!
    `(doom-dashboard-banner :inherit font-lock-builtin-face :height 1.0)
    `(doom-dashboard-menu-title :inherit font-lock-keyword-face :height 1.0)
    `(doom-dashboard-menu-desc :inherit font-lock-builtin-face :height 1.0)
    `(doom-dashboard-loaded :inherit font-lock-docface :height 1.0)
    `(tooltip :background ,(doom-lighten 'bg 0.1) :family ,(face-attribute 'sawyer/variable-face :family) :weight bold)
    `(font-lock-type-face :weight bold)
    `(font-lock-function-name-face :weight bold)
    `(font-lock-string-face :background ,(doom-lighten 'bg 0.05))
    `(line-number :slant normal)
    `(line-number-current-line :slant normal)
    `(mode-line :family ,(face-attribute 'sawyer/variable-face :family) :weight bold)
    `(mode-line-inactive :family ,(face-attribute 'sawyer/variable-face :family) :weight normal)
    `(doom-modeline-bar :family ,(face-attribute 'sawyer/variable-face :family) :background ,(doom-lighten 'bg 0.1) :weight bold)
    `(doom-modeline-buffer-file :family ,(face-attribute 'sawyer/variable-face :family) :weight bold)
    `(doom-modeline-buffer-path :family ,(face-attribute 'sawyer/variable-face :family) :weight bold)
    `(doom-modeline-buffer-project-root :family ,(face-attribute 'sawyer/variable-face :family) :weight bold)
    `(font-lock-type-face :weight bold)
    `(font-lock-function-name-face :weight bold)
    `(font-lock-string-face :background ,(doom-lighten 'bg 0.05))
    `(line-number :slant normal)
    `(line-number-current-line :slant normal)
    ;; `(nav-flash-face :foreground ,(doom-color 'fg) :background ,(doom-color 'bg) :box (:line-width 1 :color "#444444"))
    )
  )
(after! lsp-ui
  (custom-set-faces!
    `(lsp-flycheck-warning-unnecessary-category :inherit default :background ,(doom-color 'bg) :foreground warning)
    `(lsp-headerline-breadcrumb-deprecated-face :family ,(face-attribute 'sawyer/variable-face :family) :height 1.0 :weight bold)
    `(lsp-headerline-breadcrumb-path-error-face :family ,(face-attribute 'sawyer/variable-face :family) :height 1.0 :weight bold)
    `(lsp-headerline-breadcrumb-path-face :family ,(face-attribute 'sawyer/variable-face :family) :height 1.0 :weight bold)
    `(lsp-headerline-breadcrumb-path-hint-face :family ,(face-attribute 'sawyer/variable-face :family) :height 1.0 :weight bold)
    `(lsp-headerline-breadcrumb-path-info-face :family ,(face-attribute 'sawyer/variable-face :family) :height 1.0 :weight bold)
    `(lsp-headerline-breadcrumb-path-warning-face :family ,(face-attribute 'sawyer/variable-face :family) :height 1.0 :weight bold)
    `(lsp-headerline-breadcrumb-project-prefix-face :family ,(face-attribute 'sawyer/variable-face :family) :height 1.0 :weight bold)
    `(lsp-headerline-breadcrumb-separator-face :family ,(face-attribute 'sawyer/variable-face :family) :height 1.0 :weight bold)
    `(lsp-headerline-breadcrumb-symbols-error-face :family ,(face-attribute 'sawyer/variable-face :family) :height 1.0 :weight bold)
    `(lsp-headerline-breadcrumb-symbols-face :family ,(face-attribute 'sawyer/variable-face :family) :height 1.0 :weight bold)
    `(lsp-headerline-breadcrumb-symbols-hint-face :family ,(face-attribute 'sawyer/variable-face :family) :height 1.0 :weight bold)
    `(lsp-headerline-breadcrumb-symbols-info-face :family ,(face-attribute 'sawyer/variable-face :family) :height 1.0 :weight bold)
    `(lsp-headerline-breadcrumb-symbols-warning-face :family ,(face-attribute 'sawyer/variable-face :family) :height 1.0 :weight bold)
    `(lsp-headerline-breadcrumb-unknown-project-prefix-face :family ,(face-attribute 'sawyer/variable-face :family) :height 1.0 :weight bold)
    `(lsp-lens-face :foreground ,(doom-darken 'fg 0.1) :height 0.8)
    ))

;; (after! tree-sitter
  ;; (custom-set-faces!
  ;;   `(tree-sitter-hl-face:property :slant normal)
  ;;   `(tree-sitter-hl-face:keyword :weight bold)
  ;;   `(tree-sitter-hl-face:comment :inherit font-lock-comment-face :slant normal)
  ;;   `(tree-sitter-hl-face:attribute :inherit font-lock-function-name-face) ;; Face for attributes markup languages.
  ;;   `(tree-sitter-hl-face:comment :inherit font-lock-comment-face)
  ;;   `(tree-sitter-hl-face:constant :inherit font-lock-constant-face)
  ;;   `(tree-sitter-hl-face:constant.builtin :inherit font-lock-keyword-face)
  ;;   `(tree-sitter-hl-face:constructor :inherit font-lock-function-name-face)
  ;;   `(tree-sitter-hl-face:doc :inherit font-lock-doc-face) ;; Face for docstrings.
  ;;   `(tree-sitter-hl-face:embedded :inherit font-lock-doc-markup-face) ;; Face for embedded expressions and code fragments.
  ;;   `(tree-sitter-hl-face:function :inherit font-lock-function-name-face)
  ;;   `(tree-sitter-hl-face:function.builtin :inherit font-lock-function-name-face) ;; Face for builtin functions.
  ;;   `(tree-sitter-hl-face:function.call :inherit font-lock-function-name-face)
  ;;   `(tree-sitter-hl-face:function.macro :inherit font-lock-function-name-face) ;; Face for macro calls.
  ;;   `(tree-sitter-hl-face:function.method :inherit font-lock-function-name-face)
  ;;   `(tree-sitter-hl-face:function.method.call :inherit font-lock-function-name-face)
  ;;   `(tree-sitter-hl-face:keyword :inherit font-lock-keyword-face)
  ;;   `(tree-sitter-hl-face:label :inherit font-lock-constant-face) ;; Face for labels.
  ;;   `(tree-sitter-hl-face:method :inherit font-lock-function-name-face) ;; Face for method declarations and definitions.
  ;;   `(tree-sitter-hl-face:method.call :inherit font-lock-function-name-face)
  ;;   `(tree-sitter-hl-face:number :inherit highlight-numbers-number) ;; Face for numbers.
  ;;   `(tree-sitter-hl-face:operator :inherit highlight-quoted-quote)
  ;;   `(tree-sitter-hl-face:property :inherit font-lock-function-name-face)
  ;;   `(tree-sitter-hl-face:property.definition :inherit font-lock-function-name-face) ;; Face for property declarations and definitions.
  ;;   `(tree-sitter-hl-face:punctuation :inherit highlight-quoted-quote)
  ;;   `(tree-sitter-hl-face:punctuation.bracket :inherit highlight-quoted-quote)
  ;;   `(tree-sitter-hl-face:punctuation.delimiter :inherit highlight-quoted-quote)
  ;;   `(tree-sitter-hl-face:punctuation.special :inherit highlight-quoted-quote)
  ;;   `(tree-sitter-hl-face:string :inherit font-lock-string-face)
  ;;   `(tree-sitter-hl-face:string.special :inherit font-lock-doc-markup-face) ;; Face for special strings, e.g. regular expressions.
  ;;   `(tree-sitter-hl-face:tag :inherit font-lock-keyword-face) ;; Face for tags in markup languages.
  ;;   `(tree-sitter-hl-face:type :inherit font-lock-type-face)
  ;;   `(tree-sitter-hl-face:type.argument :inherit font-lock-variable-name-face) ;; Face for type arguments.
  ;;   `(tree-sitter-hl-face:type.builtin :inherit font-lock-builtin-face) ;; Face for builtin types.
  ;;   `(tree-sitter-hl-face:type.parameter :inherit font-lock-variable-name-face) ;; Face for type parameters.
  ;;   `(tree-sitter-hl-face:type.super :inherit font-lock-type-face) ;; Face for super types in definitions and type constraints.
  ;;   `(tree-sitter-hl-face:variable :inherit font-lock-variable-name-face)
  ;;   `(tree-sitter-hl-face:variable.builtin :inherit font-lock-builtin-face) ;; Face for builtin variables.
  ;;   `(tree-sitter-hl-face:variable.parameter :inherit font-lock-variable-name-face) ;; Face for function parameters.
  ;;   `(tree-sitter-hl-face:variable.special :inherit font-lock-doc-markup-face) ;; Face for "dangerous" variables, e.g. mutable or dynamically-bound.
  ;;   )
  ;; )

(custom-theme-set-faces! 'doom-spacegrey
  `(default :foreground "#b1bbcb" :background "#1c212c")
  `(header-line :background "#1c212c" :family ,(face-attribute 'sawyer/variable-face :family) :height 1.0 :weight bold)
  `(line-number :foreground "#393e45"
                :background "#1c212c"
                :height 1.2)
  `(line-number-current-line :foreground ,(doom-lighten (doom-color 'bg) 0.4)
                             :height 1.2)
  `(font-lock-keyword-face :weight bold
                           :foreground ,(doom-blend (doom-color 'magenta) (doom-color 'grey) 0.4))
  `(font-lock-constant-face :weight bold
                            :foreground ,(doom-lighten (doom-color 'blue) 0.3))
  `(font-lock-builtin-face :weight bold)
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
                :background ,(doom-darken 'bg 0.1))
  `(font-lock-keyword-face :foreground ,(doom-color 'cyan) :weight bold)
  `(font-lock-builtin-face :foreground ,(doom-color 'blue) :weight bold)
  `(font-lock-constant-face :foreground ,(doom-color 'blue) :weight bold)
  `(font-lock-string-face :background ,(doom-lighten (doom-color 'bg) 0.1) :foreground ,(doom-blend (doom-color 'red) "#aaaaaa" 0.2))
  `(font-lock-function-name-face :weight bold)
  `(font-lock-type-face :foreground ,(doom-color 'red) :weight bold)
  `(font-lock-variable-name-face :foreground ,(doom-blend (doom-color 'blue) "#aaaaaa" 0.2) :weight bold)
  `(font-lock-doc-face :foreground ,(doom-color 'blue))
  `(font-lock-comment-face :foreground ,(doom-blend (doom-color 'blue) "#888888" 0.4))
  `(ediff-fine-diff-A :background ,(doom-blend 'red 'bg 0.3) :weight bold)
  )
  (setq
      evil-insert-state-cursor '(bar "green")
      evil-replace-state-cursor '(box "red")
      evil-visual-state-cursor '(hollow "yellow"))

(custom-theme-set-faces! '(doom-monokai-octagon doom-monokai-spectrum)
  `(default :background ,(doom-darken (doom-color 'bg) 0.2))
  `(vertical-border :foreground ,(doom-darken (doom-color 'bg) 0.3))
  `(window-divider :foreground ,(doom-darken (doom-color 'bg) 0.3))
  `(header-line
    :background ,(doom-darken (doom-color 'bg) 0.2)
    :family ,(face-attribute 'sawyer/variable-face :family)
    :height 1.0
    :weight bold)
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
    :family ,(face-attribute 'sawyer/variable-face :family)
    :weight normal
    :foreground ,(doom-blend (doom-color 'fg) (doom-color 'cyan) 0.7))
  `(org-code-face
    :family ,(face-attribute 'sawyer/mono-face :family)
    :weight normal
    :foreground ,(doom-color 'cyan))
  `(org-document-title :foreground ,(doom-color 'fg))
  `(org-modern-symbol :foreground ,(doom-color 'red))
  `(org-list-dt :foreground ,(doom-color 'red))
  `(lsp-face-highlight-textual :background ,(doom-lighten (doom-color 'bg) 0.2))
  )
(after! org
  (custom-theme-set-faces! '(doom-monokai-octagon doom-monokai-spectrum)
    `(org-face
      :family ,(face-attribute 'sawyer/variable-face :family)
      :weight normal
      :foreground ,(doom-blend (doom-color 'fg) (doom-color 'cyan) 0.7))
    `(org-code-face
      :family ,(face-attribute 'sawyer/mono-face :family)
      :weight normal
      :foreground ,(doom-color 'cyan))
    `(org-document-title :foreground ,(doom-color 'fg))
    `(org-modern-symbol :foreground ,(doom-color 'red))
    `(org-list-dt :foreground ,(doom-color 'red))
    ))

(custom-theme-set-faces! 'doom-tokyo-night
  `(line-number
    :foreground ,(doom-lighten (doom-color 'bg) 0.2))
  `(line-number-current-line
    :foreground ,(doom-lighten (doom-color 'bg) 0.4))
  `(treemacs-root-face :foreground ,(doom-color 'red) :background ,(doom-darken (doom-color 'bg) 0.4))
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

(custom-theme-set-faces! 'doom-moonlight
  `(font-lock-comment-face :foreground ,(doom-color 'magenta))
  )
(after! consult
  (custom-theme-set-faces! 'doom-moonlight
    `(consult-grep-context :inherit font-lock-comment-face)
    `(consult-help :inherit font-lock-doc-face)
    )
  )
(after! vertico
  (custom-theme-set-faces! 'doom-moonlight
    `(vertico-group-title :inherit font-lock-doc-markup-face)
    )
  )

(after! doom-modeline
  (setq doom-modeline-buffer-file-name-style 'relative-to-project)
  (setq doom-modeline-major-mode-icon t)
  (custom-set-faces!
    `(doom-modeline-project-dir :weight bold :background ,(doom-color 'default))
    `(doom-modeline-persp-name :slant normal)
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
  ;; (setq doom-themes-treemacs-enable-variable-pitch t)
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
      :weight bold
      :slant normal
      :family ,(face-attribute 'sawyer/variable-face :family)
      :background ,(doom-color 'bg)
      )
    ;; TODO: something is broken with treemacs-git-modified-face
    `(lsp-treemacs-file-error :family ,(face-attribute 'sawyer/variable-face :family))
    `(lsp-treemacs-file-hint :family ,(face-attribute 'sawyer/variable-face :family))
    `(lsp-treemacs-file-info :family ,(face-attribute 'sawyer/variable-face :family))
    `(lsp-treemacs-file-warn :family ,(face-attribute 'sawyer/variable-face :family))
    `(lsp-treemacs-project-root-error :family ,(face-attribute 'sawyer/variable-face :family))
    `(lsp-treemacs-project-root-info :family ,(face-attribute 'sawyer/variable-face :family))
    `(lsp-treemacs-project-root-warn :family ,(face-attribute 'sawyer/variable-face :family))
    `(treemacs-directory-collapsed-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer/variable-face :family))
    `(treemacs-directory-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer/variable-face :family))
    `(treemacs-file-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer/variable-face :family))
    `(treemacs-fringe-indicator-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer/variable-face :family))
    `(treemacs-git-added-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer/variable-face :family))
    `(treemacs-git-commit-diff-face :family ,(face-attribute 'sawyer/variable-face :family))
    `(treemacs-git-conflict-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer/variable-face :family))
    `(treemacs-git-ignored-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer/variable-face :family))
    `(treemacs-git-modified-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer/variable-face :family))
    `(treemacs-git-renamed-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer/variable-face :family))
    `(treemacs-git-unmodified-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer/variable-face :family))
    `(treemacs-git-untracked-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer/variable-face :family))
    `(treemacs-header-button-face :family ,(face-attribute 'sawyer/variable-face :family))
    `(treemacs-help-column-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer/variable-face :family))
    `(treemacs-help-title-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer/variable-face :family))
    `(treemacs-marked-file-face :family ,(face-attribute 'sawyer/variable-face :family))
    `(treemacs-on-failure-pulse-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer/variable-face :family))
    `(treemacs-on-success-pulse-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer/variable-face :family))
    `(treemacs-peek-mode-indicator-face :family ,(face-attribute 'sawyer/variable-face :family))
    `(treemacs-tags-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer/variable-face :family))
    `(treemacs-term-node-face :weight medium :slant normal :height 1.0 :family ,(face-attribute 'sawyer/variable-face :family))
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
  ;; (setq-default default-text-properties '(line-spacing 0.2 line-height 1.3))
  ;; (setq-local default-text-properties '(line-spacing 0.2 line-height 1.3))
  )

(add-hook! treemacs-mode
  (set-face-attribute 'button nil :family '(face-attribute 'sawyer/variable-face :family)))

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

(after! flycheck
  (custom-set-faces!
    `(flycheck-error :background ,(doom-darken (doom-color 'red) 0.3) :foreground "white")
    `(flycheck-info :background ,(doom-darken (doom-color 'green) 0.3) :foreground "green")
    `(flycheck-warning :background ,(doom-darken (doom-color 'yellow) 0.5) :foreground "white")
    ))

(after! org
  (custom-set-faces!
    `(org-table :family ,(face-attribute 'sawyer/mono-face :family) :height 1.0)
    `(org-block :inherit 'org-code-face :background ,(doom-color 'bg))
    `(org-formula :inherit 'org-code-face :background ,(doom-color 'bg))
    `(org-quote :inherit 'org-face :background ,(doom-lighten 'bg 0.1) :slant italic)
    `(org-tag :foreground ,(doom-blend (doom-color 'magenta) (doom-color 'grey) 0.4))
    `(org-modern-symbol :foreground ,(doom-color 'red))
    `(org-level-8 :inherit 'org-face :height 0.9)
    `(org-level-7 :inherit 'org-face :height 0.9)
    `(org-level-6 :inherit 'org-face :height 0.9)
    `(org-level-5 :inherit 'org-face :height 0.9)
    `(org-level-4 :inherit 'org-face :height 0.9 :weight bold)
    `(org-level-3 :inherit 'org-face :height 1.0 :weight normal)
    `(org-level-2 :inherit 'org-face :height 1.05 :weight bold)
    `(org-level-1 :inherit 'org-face :height 1.2 :weight normal)
    `(org-document-title :inherit 'org-face :height 1.1 :weight bold)
    ;; make leading hidden indentation consistent
    `(org-hide :family ,(face-attribute 'sawyer/mono-face :family))
    `(org-checkbox :family "Fira Code" :height 1.2 :weight normal)
    )
  )

(add-hook! org-mode
  (message "in org-mode hook")
  (face-remap-add-relative 'solaire-default-face 'org-face)
  (face-remap-add-relative 'default 'org-face)
  (face-remap-add-relative 'org-code 'org-code-face)
  (setq-local left-margin-width 5)
  (setq-local right-margin-width 5)
  (setq-local display-line-numbers-type nil)
  (display-line-numbers-mode -1)
  (setq-local header-line-format " ")
  (setq-local internal-border-width 32)
  (set-window-buffer nil (current-buffer))
  (auto-save-mode t)
  (when (fboundp '+zen/toggle)
    (+zen/toggle 1))
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
  (custom-theme-set-faces! 'doom-horizon
    `(tree-sitter-hl-face:property :foreground ,(doom-darken (doom-color 'fg) 0.1))
    `(tree-sitter-hl-face:keyword :foreground ,(doom-color 'orange))
    `(tree-sitter-hl-face:constant.builtin :weight bold)
    `(tree-sitter-hl-face:comment :slant normal
                                  :foreground "#505872")
    )
  (custom-theme-set-faces! 'doom-spacegrey
    `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
    `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
    `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
    `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
    `(tree-sitter-hl-face:constant :foreground ,(doom-color 'blue))
    ;; `(tree-sitter-hl-face:comment :inherit font-lock-comment-face)
    )
  (custom-theme-set-faces! 'doom-tomorrow-night
    `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
    `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
    `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
    `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
    `(tree-sitter-hl-face:constant :foreground ,(doom-color 'blue))
    ;; `(tree-sitter-hl-face:comment :inherit font-lock-comment-face)
    )
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
  (custom-theme-set-faces! 'doom-snazzy
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
;;     `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
;;     `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
;;     `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
;;     `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
;;     `(tree-sitter-hl-face:constant :foreground ,(doom-color 'blue))
;;     `(tree-sitter-hl-face:comment :inherit font-lock-comment-face)
;;     )
;;   (custom-theme-set-faces! 'doom-tomorrow-night
;;     `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
;;     `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
;;     `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
;;     `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'red) 0.2) :weight bold)
;;     `(tree-sitter-hl-face:constant :foreground ,(doom-color 'blue))
;;     )
;;   (custom-theme-set-faces! 'doom-ayu-mirage
;;     `(tree-sitter-hl-face:type :foreground ,(doom-color 'red) :weight bold)
;;     `(tree-sitter-hl-face:constructor :foreground ,(doom-lighten 'red 0.3) :weight bold)
;;     `(tree-sitter-hl-face:method.call :weight bold)
;;     `(tree-sitter-hl-face:keyword :foreground ,(doom-darken (doom-color 'cyan) 0.1) :weight bold)
;;     `(tree-sitter-hl-face:function :foreground ,(doom-lighten (doom-color 'cyan) 0.1) :weight bold)
;;     `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'cyan) 0.2) :weight bold)
;;     `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'cyan) 0.2) :weight bold)
;;     `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'cyan) 0.2) :weight bold)
;;     `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'cyan) 0.2) :weight bold)
;;     `(tree-sitter-hl-face:operator :foreground ,(doom-darken (doom-color 'cyan) 0.2) :weight bold)
;;     `(tree-sitter-hl-face:constant :foreground ,(doom-color 'blue) :weight bold)
;;     `(tree-sitter-hl-face:comment :foreground ,(doom-blend (doom-color 'blue) "#888888" 0.4))
;;     `(tree-sitter-hl-face:variable :foreground ,(doom-blend (doom-color 'blue) "#aaaaaa" 0.2) :weight bold)
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
  ;; (custom-theme-set-faces! 'doom-moonlight
  ;;   `(tree-sitter-hl-face:variable :foreground ,(doom-color 'default))
  ;;   `(tree-sitter-hl-face:keyword :foreground ,(doom-color 'red) :weight bold)
  ;;   )
;;   (custom-theme-set-faces! 'doom-snazzy
;;     `(font-lock-string-face :background ,(doom-lighten (doom-color 'bg) 0.05))
;;     `(markdown-inline-code-face :background ,(doom-lighten (doom-color 'bg) 0.05))
;;     `(markdown-code-face :background ,(doom-lighten (doom-color 'bg) 0.15))
;;     )
  (custom-theme-set-faces! '(doom-monokai-octagon doom-monokai-spectrum)
    ;; `(tree-sitter-hl-face:comment :inherit font-lock-comment-face)
    `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:operator :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:variable :foreground ,(doom-blend 'cyan 'white 0.6))

    )
  ;; (custom-theme-set-faces! 'doom-tokyo-night
    ;; `(tree-sitter-hl-face:comment :inherit font-lock-comment-face)
    ;; `(tree-sitter-hl-face:doc :inherit font-lock-comment-face :foreground ,(doom-blend (doom-color 'blue) "#888888" 0.8))
    ;; `(tree-sitter-hl-face:keyword :inherit font-lock-keyword-face :weight bold)
    ;; `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'red) 0.2))
    ;; `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'red) 0.2))
    ;; `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'red) 0.2))
    ;; `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'red) 0.2))
    ;; `(tree-sitter-hl-face:operator :foreground ,(doom-darken (doom-color 'red) 0.2))
    ;; `(tree-sitter-hl-face:function.method :inherit font-lock-function-name-face :weight bold)
    ;; `(tree-sitter-hl-face:function.call :inherit font-lock-function-name-face :weight bold)
    ;; `(tree-sitter-hl-face:function :inherit font-lock-function-name-face :weight bold)
    ;; ;; `(tree-sitter-hl-face:variable :foreground ,(doom-blend 'red 'white 0.6))
    ;; ;; `(tree-sitter-hl-face:variable.parameter :foreground ,(doom-blend 'red 'white 0.6))
    ;; ;; `(tree-sitter-hl-face:property :foreground ,(doom-blend 'red 'white 0.6))
    ;; `(tree-sitter-hl-face:property.definition :weight bold)
    ;; `(tree-sitter-hl-face:number :inherit highlight-numbers-number)
    ;; `(tree-sitter-hl-face:type :inherit font-lock-type-face :weight bold)
    ;; )
  (custom-theme-set-faces! 'doom-nord-light
    ;; `(tree-sitter-hl-face:comment :inherit font-lock-comment-face)
    `(tree-sitter-hl-face:keyword :weight bold :foreground ,(doom-color 'orange))
    ;; `(tree-sitter-hl-face:property :inherit font-lock-variable-name-face)
    `(tree-sitter-hl-face:punctuation :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:punctuation.bracket :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:punctuation.special :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:punctuation.delimiter :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:operator :foreground ,(doom-darken (doom-color 'red) 0.2))
    `(tree-sitter-hl-face:number :inherit highlight-numbers-number)
    ;; `(tree-sitter-hl-face:type :inherit font-lock-type-face)
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
(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)

;; (after! rustic
;;   (custom-set-faces!
;;     `(lsp-rust-analyzer-inlay-face :inherit font-lock-comment-face
;;                                    :weight light
;;                                    :height 0.8)
;;     )
;;   )

(add-hook! highlight-indent-guides-mode
  (custom-set-faces!
    `(highlight-indent-guides-odd-face :inherit default
                                       :background ,(doom-lighten 'bg 0.1))
    `(highlight-indent-guides-even-face :inherit default
                                        :background ,(doom-lighten 'bg 0.15))
    )
  )

(add-hook! elisp #'rainbow-mode 1)

(after! vertico-posframe
  (setq vertico-posframe-border-width 10)
  (custom-set-faces!
    `(vertico-posframe-border :background ,(doom-color 'bg))
    )
  )

(add-hook! writeroom-mode
  (setq-default +zen-text-scale 1)
  (setq-default writeroom-width 100))

(when (display-graphic-p)
  (after! textsize
    (setq textsize-default-points sawyer/baseline-font-size)
    (setq textsize-pixel-pitch-thresholds
          ;; 15" MBP:             0.171875
          ;; 24" 4K (full res):   0.174
          ;; 24" 4K (downscaled): 0.207
          ;; 34" superwide:       0.233
          ;; 16" MBP:             0.199
          '((0 . 4)
            (0.12 . 1.9)
            (0.17 . 2.5)
            (0.174 . 0.6)
            (0.18 . -3.5)
            (0.199 . -1)
            (0.207 . -4)
            ))
    )
  (add-hook! after-init #'textsize-mode)
  )
(after! org-modern
  ;; table styles are still kinda messed up: https://github.com/minad/org-modern/issues/5
  (setq org-modern-table nil)
  (setq org-modern-todo-faces
        '(
          ("TODO" :background (doom-color 'blue) :foreground "black")
          ("STRT" :background (doom-color 'green) :foreground "black")
          ("WAIT" :background (doom-color 'yellow) :foreground "black")
          ("HOLD" :background (doom-color 'yellow) :foreground "black")
          ("IDEA" :background (doom-color 'cyan) :foreground (doom-color 'blue))
          ("DONE" :background (doom-color 'grey) :foreground "white")
          ("YES" :background (doom-color 'green) :foreground "black")
          ("NO" :background (doom-color 'red) :foreground "white")
          ("KILL" :background (doom-color 'grey) :foreground "black")
          ))
  )
(add-hook! org-mode #'org-modern-mode)
(add-hook! org-agenda-finalize #'org-modern-agenda)

(after! centaur-tabs
  (custom-set-faces!
   `(centaur-tabs-default
     :family ,(face-attribute 'sawyer/variable-face :family)
     :weight bold)
   `(centaur-tabs-selected
     :family ,(face-attribute 'sawyer/variable-face :family)
     :foreground ,(doom-color 'fg)
     :weight bold)
   `(centaur-tabs-unselected
     :family ,(face-attribute 'sawyer/variable-face :family)
     :foreground ,(face-attribute font-lock-comment-face :foreground)
     :weight bold)
   `(centaur-tabs-unselected-modified
     :family ,(face-attribute 'sawyer/variable-face :family)
     :foreground ,(doom-blend (doom-color 'red) (doom-color 'grey) 0.5)
     :weight bold)
   `(centaur-tabs-selected-modified
     :family ,(face-attribute 'sawyer/variable-face :family)
     :foreground ,(doom-color 'red)
     :weight bold))
  (centaur-tabs-change-fonts (face-attribute 'sawyer/variable-face :family) 1.0)
  (centaur-tabs-headline-match)
  )

;; (after! dap-mode
;;   (custom-theme-set-faces!
;;     `(dap-ui-pending-breakpoint-face :background ,(doom-color 'yellow) :foreground ,(doom-color 'bg)))
;;   )
