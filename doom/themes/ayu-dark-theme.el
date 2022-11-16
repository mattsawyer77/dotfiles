;;; ayu-dark-theme.el --- inspired by Ayu Dark -*- lexical-binding: t; no-byte-compile: t; -*-

(require 'doom-themes)


;;
;;; Variables

(defgroup ayu-dark-theme nil
  "Options for the ayu-dark theme."
  :group 'doom-themes)

(defcustom ayu-dark-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'ayu-dark-theme
  :type 'boolean)

(defcustom ayu-dark-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'ayu-dark-theme
  :type 'boolean)

(defcustom ayu-dark-comment-bg ayu-dark-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'ayu-dark-theme
  :type 'boolean)

(defcustom ayu-dark-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'ayu-dark-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme ayu-dark
  "A dark theme inspired by Ayu dark"

  ;;  name        default   256       16
  (
   ;; common
   (common-accent   '("#e6b450" "orange"  "orange" ))
   (common-bg       '("#191f27" "black"   "black"  ))
   (common-line     '("#202731" "grey"    "grey"   ))
   (common-fg       '("#e6e1cf" "grey"    "grey"   ))
   (common-ui       '("#565b66" "grey"    "grey"   ))
   (test            '("#73b8ff" "grey"    "grey"   ))
   ;; syntax
   (syntax-tag      '("#39bae6" "cyan"    "blue"   ))
   (syntax-func     '("#e6e1cf" "white"   "white"  ))
   (syntax-entity   '("#59c2ff" "blue"    "blue"   ))
   (syntax-string   '("#b8cc52" "green"   "green"  ))
   (syntax-regexp   '("#95e6cb" "teal"    "green"  ))
   (syntax-markup   '("#ffb454" "red"     "red"    ))
   ;; (syntax-keyword  '("#ff7733" "red"     "red"    ))
   (syntax-keyword  '("#59c2ff" "blue"    "blue"   ))
   (syntax-special  '("#ffb454" "orange"  "orange" ))
   (syntax-comment  '("#788697" "grey"    "grey"   ))
   (syntax-constant '("#a37acc" "magenta" "purple" ))
   (syntax-operator '("#ff7733" "orange"  "orange" ))
   (syntax-error    '("#d95757" "red"     "red"    ))
   ;; editor
   (editor-selection-active '("#1B3A5B" "grey" "grey"))
   ;; ui
   (alt-accent            (doom-lighten common-accent 0.4))
   (ui-line               (doom-darken common-bg 0.25))
   (ui-panel-shadow       (doom-darken common-bg 0.35))
   (ui-panel-border       (doom-darken common-bg 0.45))
   (ui-gutter-normal      (doom-darken common-ui 0.45))
   (ui-gutter-active      common-ui)
   (ui-selection-bg       (doom-blend common-bg test 0.8))
   (ui-selection-inactive (doom-lighten test 0.93))
   (ui-selection-border   (doom-lighten test 0.93))
   (ui-guide-normal       (doom-darken common-ui 0.35))
   (ui-guide-active       (doom-darken common-ui 0.75))
   (ui-org-block          (doom-darken common-bg 0.10))
   (elscreen-bg           (doom-darken common-ui 0.55))
   (elscreen-fg           ui-line)
   ;; vcs
   (vcs-added    '("#aad94c" "green" "green" ))
   (vcs-modified '("#39bae6" "blue"  "blue"  ))
   (vcs-removed  '("#f26d78" "red"   "red"   ))
   

   (bg         common-bg)
   (bg-alt     ui-line)
   (base0      ui-gutter-normal)
   (base1      ui-gutter-active)
   (base2      ui-selection-bg)
   (base3      ui-org-block)
   (base4      ui-selection-border)
   (base5      ui-guide-normal)
   (base6      ui-guide-normal)
   (base7      ui-panel-shadow)
   (base8      ui-panel-border)
   (fg         common-fg)
   (fg-alt     common-ui)

   (grey       ui-line)
   (red        syntax-error)
   (orange     syntax-special)
   (green      syntax-string)
   (teal       syntax-regexp)
   (yellow     syntax-func)
   (blue       syntax-entity)
   (dark-blue  (doom-darken syntax-entity 0.2))
   (magenta    syntax-constant)
   (violet     (doom-lighten syntax-constant 0.2))
   (cyan       syntax-tag)
   (dark-cyan  test)

   ;; face categories -- required for all themes
   (highlight      common-accent)
   (lazy-highlight common-accent)
   (vertical-bar   ui-panel-border)
   (selection      nil)
   (builtin        nil)
   (comments       (if ayu-dark-brighter-comments dark-cyan base5))
   (doc-comments   (doom-lighten (if ayu-dark-brighter-comments dark-cyan base5) 0.25))
   (constants      syntax-constant)
   (functions      syntax-func)
   (keywords       syntax-keyword)
   (methods        syntax-func)
   (operators      syntax-operator)
   (type           syntax-markup)
   (strings        syntax-string)
   (variables      (doom-lighten common-fg 0.2))
   (numbers        common-accent)
   (region         ui-selection-bg)
   (error          syntax-error)
   (warning        common-accent)
   (success        green)
   (vc-modified    vcs-modified)
   (vc-added       vcs-added)
   (vc-deleted     vcs-removed)

   ;; custom categories
   (hidden     (car bg))
   (-modeline-bright ayu-dark-brighter-modeline)
   (-modeline-pad
    (when ayu-dark-padded-modeline
      (if (integerp ayu-dark-padded-modeline) ayu-dark-padded-modeline 4)))

   (modeline-fg     common-fg)
   (modeline-fg-alt common-accent)

   (modeline-bg
    (if -modeline-bright
        (doom-darken blue 0.45)
      `(,(doom-darken (car bg-alt) 0.1) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken blue 0.475)
      `(,(doom-darken (car bg-alt) 0.15) ,@(cdr base0))))
   (modeline-bg-inactive   `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-l `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg-alt))))

  ;; Base theme face overrides
  ((hl-line :background common-line)
   ((line-number &override)
    :foreground "#46474b"
    :slant 'normal)
   ((line-number-current-line &override)
    :foreground "#b6b7bb"
    :slant 'normal)
   (header-line :background (doom-color bg))
   (diff-removed :foreground vcs-removed)
   (ediff-fine-diff-A :background (doom-blend red bg 0.3))
   (font-lock-comment-face :foreground syntax-comment)
   (font-lock-comment-delimiter-face (doom-darken syntax-comment 0.2))
   (font-lock-doc-face :foreground (doom-lighten doc-comments 0.2))
   (font-lock-builtin-face :foreground syntax-constant)
   (font-lock-string-face
    :background (doom-lighten (doom-color bg) 0.15)
    :foreground syntax-string)
   (font-lock-function-name-face :foreground syntax-func :weight 'normal)
   (font-lock-type-face :foreground type :weight 'normal)
   (font-lock-keyword-face :foreground syntax-keyword :weight 'normal)
   ;; (font-lock-variable-name-face
   ;;  :foreground (doom-blend (doom-color blue) (doom-color fg) 0.2))
   ;; (font-lock-doc-face :foreground (doom-color blue))
   (mode-line
    :inherit '(variable-pitch)
    :weight 'bold
    :background modeline-bg
    :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :inherit '(variable-pitch)
    :weight 'bold
    :background modeline-bg-inactive
    :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if -modeline-bright base8 highlight))

   ; LSP
   (lsp-face-highlight-textual :background alt-accent :foreground common-ui)
   (lsp-flycheck-warning-unnecessary-category :inherit 'default :background common-bg :foreground warning)
   (lsp-headerline-breadcrumb-deprecated-face :inherit '(variable-pitch) :background (doom-color bg) :height 1.0 :weight 'bold)
   (lsp-headerline-breadcrumb-path-error-face :inherit '(variable-pitch) :background (doom-color bg) :height 1.0 :weight 'bold)
   (lsp-headerline-breadcrumb-path-face :inherit '(variable-pitch) :background (doom-color bg) :height 1.0 :weight 'bold)
   (lsp-headerline-breadcrumb-path-hint-face :inherit '(variable-pitch) :background (doom-color bg) :height 1.0 :weight 'bold)
   (lsp-headerline-breadcrumb-path-info-face :inherit '(variable-pitch) :background (doom-color bg) :height 1.0 :weight 'bold)
   (lsp-headerline-breadcrumb-path-warning-face :inherit '(variable-pitch) :background (doom-color bg) :height 1.0 :weight 'bold)
   (lsp-headerline-breadcrumb-project-prefix-face :inherit '(variable-pitch) :background (doom-color bg) :height 1.0 :weight 'bold)
   (lsp-headerline-breadcrumb-separator-face :inherit '(variable-pitch) :background (doom-color bg) :height 1.0 :weight 'bold)
   (lsp-headerline-breadcrumb-symbols-error-face :inherit '(variable-pitch) :background (doom-color bg) :height 1.0 :weight 'bold)
   (lsp-headerline-breadcrumb-symbols-face :inherit '(variable-pitch) :background (doom-color bg) :height 1.0 :weight 'bold)
   (lsp-headerline-breadcrumb-symbols-hint-face :inherit '(variable-pitch) :background (doom-color bg) :height 1.0 :weight 'bold)
   (lsp-headerline-breadcrumb-symbols-info-face :inherit '(variable-pitch) :background (doom-color bg) :height 1.0 :weight 'bold)
   (lsp-headerline-breadcrumb-symbols-warning-face :inherit '(variable-pitch) :background (doom-color bg) :height 1.0 :weight 'bold)
   (lsp-headerline-breadcrumb-unknown-project-prefix-face :inherit '(variable-pitch) :background (doom-color bg) :height 1.0 :weight 'bold)
   (lsp-lens-face :foreground (doom-darken fg 0.1) :height 0.8)
   (lsp-details :inherit font-lock-doc-face)

   ;; consult
   (consult-grep-context :inherit font-lock-doc-face)
   (consult-help :inherit font-lock-doc-face)

   ;; vertico
   (vertico-group-title :inherit font-lock-doc-face)

   ;; centaur-tabs
   (centaur-tabs-default
     :inherit '(variable-pitch)
     :foreground common-fg
     :background common-bg
     :weight 'bold)
   (centaur-tabs-selected
     :inherit '(variable-pitch)
     :foreground common-fg
     :background common-bg
     :weight 'bold)
   (centaur-tabs-unselected
     :inherit '(variable-pitch)
     :foreground (doom-lighten (doom-color grey) 0.4)
     :background common-bg
     :weight 'bold)
   (centaur-tabs-unselected-modified
     :inherit '(variable-pitch)
     :foreground (doom-blend (doom-color red) (doom-color grey) 0.5)
     :background common-bg
     :weight 'bold)
   (centaur-tabs-selected-modified
     :inherit '(variable-pitch)
     :foreground (doom-color red)
     :background common-bg
     :weight 'bold)

   ;; company
   (company-tooltip :foreground common-fg :background common-bg)
   (company-tooltip-annotation :foreground common-fg)
   (company-tooltip-selection :background common-ui :foreground common-fg)
   (company-tooltip-search :foreground common-accent)
   (company-scrollbar-bg :background common-bg)
   (company-scrollbar-fg :background syntax-comment)
   ;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;; doom-modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg modeline-bg) :weight 'bold)
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground green :weight 'bold)
   ;; elscreen
   (elscreen-tab-other-screen-face :background elscreen-bg :foreground elscreen-fg)
   ;; ivy
   (ivy-current-match :background common-ui)
   (ivy-minibuffer-match-face-1 :foreground common-accent :weight 'bold)
   (ivy-minibuffer-match-face-2 :foreground common-accent :weight 'bold)
   (ivy-minibuffer-match-face-3 :foreground common-accent :weight 'bold)
   (ivy-minibuffer-match-face-4 :foreground common-accent :weight 'bold)
   ;; LaTeX-mode
   (font-latex-math-face :foreground green)
   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten common-bg 0.05))
   ;; org-mode
   (org-hide :foreground hidden)
   (org-headline-done :foreground syntax-comment)
   (org-document-info-keyword :foreground comments)
   ;; mic-paren
   ((paren-face-match &override) :foreground fg :background ui-selection-bg :weight 'bold)
   ;; rjsx-mode
   (rjsx-tag :foreground cyan)
   (rjsx-tag-bracket-face :foreground (doom-darken cyan 0.5))
   (rjsx-attr :foreground syntax-func)
   ;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))
   ;; web-mode
   (web-mode-html-tag-face :foreground cyan)
   (web-mode-html-tag-bracket-face :foreground (doom-darken cyan 0.5))
   (web-mode-html-attr-name-face :foreground syntax-func)

   ;; tree-sitter
   (tree-sitter-hl-face:attribute :inherit font-lock-function-name-face) ;; Face for attributes markup languages.
   (tree-sitter-hl-face:comment :inherit font-lock-comment-face)
   (tree-sitter-hl-face:constant :inherit font-lock-constant-face)
   (tree-sitter-hl-face:constant.builtin :inherit font-lock-keyword-face)
   (tree-sitter-hl-face:constructor :inherit font-lock-function-name-face)
   (tree-sitter-hl-face:doc :inherit font-lock-doc-face) ;; Face for docstrings.
   (tree-sitter-hl-face:embedded :inherit font-lock-doc-markup-face) ;; Face for embedded expressions and code fragments.
   ;; (tree-sitter-hl-face:escape :inherit default) ;; Face for escape characters in strings.
   (tree-sitter-hl-face:function :inherit font-lock-function-name-face)
   (tree-sitter-hl-face:function.builtin :inherit font-lock-function-name-face) ;; Face for builtin functions.
   (tree-sitter-hl-face:function.call :inherit font-lock-function-name-face)
   (tree-sitter-hl-face:function.macro :foreground magenta) ;; Face for macro calls.
   (tree-sitter-hl-face:function.method :inherit font-lock-function-name-face)
   (tree-sitter-hl-face:function.method.call :inherit font-lock-function-name-face)
   (tree-sitter-hl-face:function.special :foreground syntax-special) ;; Face for functions that alter things at compile/load time.
   (tree-sitter-hl-face:keyword :inherit font-lock-keyword-face)
   (tree-sitter-hl-face:label :inherit font-lock-constant-face) ;; Face for labels.
   (tree-sitter-hl-face:method :inherit font-lock-function-name-face) ;; Face for method declarations and definitions.
   (tree-sitter-hl-face:method.call :inherit font-lock-function-name-face)
   ;; (tree-sitter-hl-face:noise :inherit default) ;; Face for things that are syntatic noises.
   (tree-sitter-hl-face:number :foreground syntax-operator) ;; Face for numbers.
   (tree-sitter-hl-face:operator :foreground syntax-operator)
   (tree-sitter-hl-face:property :inherit font-lock-function-name-face)
   (tree-sitter-hl-face:property.definition :inherit font-lock-function-name-face) ;; Face for property declarations and definitions.
   (tree-sitter-hl-face:punctuation :foreground syntax-operator)
   (tree-sitter-hl-face:punctuation.bracket :foreground syntax-operator)
   (tree-sitter-hl-face:punctuation.delimiter :foreground syntax-operator)
   (tree-sitter-hl-face:punctuation.special :foreground syntax-special)
   (tree-sitter-hl-face:string :inherit font-lock-string-face)
   (tree-sitter-hl-face:string.special :inherit font-lock-doc-markup-face) ;; Face for special strings, e.g. regular expressions.
   (tree-sitter-hl-face:tag :foreground syntax-tag) ;; Face for tags in markup languages.
   (tree-sitter-hl-face:type :inherit font-lock-type-face)
   (tree-sitter-hl-face:type.argument :inherit font-lock-variable-name-face) ;; Face for type arguments.
   (tree-sitter-hl-face:type.builtin :inherit font-lock-builtin-face) ;; Face for builtin types.
   (tree-sitter-hl-face:type.parameter :inherit font-lock-variable-name-face) ;; Face for type parameters.
   (tree-sitter-hl-face:type.super :foreground syntax-special) ;; Face for super types in definitions and type constraints.
   (tree-sitter-hl-face:variable :inherit font-lock-variable-name-face)
   (tree-sitter-hl-face:variable.builtin :inherit font-lock-builtin-face) ;; Face for builtin variables.
   (tree-sitter-hl-face:variable.parameter :inherit font-lock-variable-name-face) ;; Face for function parameters.
   (tree-sitter-hl-face:variable.special :foreground syntax-special) ;; Face for "dangerous" variables, e.g. mutable or dynamically-bound.
   ))
;;; ayu-dark-theme.el ends here
