;;; ayu-dark-theme.el --- inspired by Ayu Dark -*- lexical-binding: t; no-byte-compile: t; -*-

(require 'doom-themes)


;;
;;; Variables

(defgroup ayu-dark-theme nil
  "Options for the `ayu-dark' theme."
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

  ;; name        default   256       16
  (
   ;; common
   (common-accent   '("#e6b450" "orange"  "orange" ))
   (common-bg       '("#0d1017" "black"   "black"  ))
   (common-line     '("#131721" "grey"    "grey"  ))
   (common-fg       '("#bfbdb6" "grey"    "grey"   ))
   (common-ui       '("#565b66" "grey"    "grey"   ))
   (test            '("#73b8ff" "grey"    "grey"   ))
   ;; syntax
   (syntax-tag      '("#39bae6" "cyan"    "blue"   ))
   (syntax-func     '("#ffb454" "yellow"  "yellow" ))
   (syntax-entity   '("#59c2ff" "blue"    "blue"   ))
   (syntax-string   '("#7fd962" "green"   "green"  ))
   (syntax-regexp   '("#95e6cb" "teal"    "green"  ))
   (syntax-markup   '("#f07178" "red"     "red"    ))
   (syntax-keyword  '("#ff8f40" "orange"  "orange" ))
   (syntax-special  '("#e6b673" "yellow"  "yellow" ))
   (syntax-comment  '("#475266" "grey"    "grey"   ))
   (syntax-constant '("#d2a6ff" "magenta" "purple" ))
   (syntax-operator '("#f29668" "orange"  "orange" ))
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
   (red        syntax-markup)
   (orange     syntax-keyword)
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
   (type           syntax-special)
   (strings        syntax-string)
   (variables      common-fg)
   (numbers        syntax-func)
   (region         ui-selection-bg)
   (error          syntax-error)
   (warning        yellow)
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

  ;;;; Base theme face overrides
  ((hl-line :background common-line)
   ((nav-flash-face &override) :background common-ui)
   ((line-number &override)
    :foreground "#76777b"
    :height 0.8
    :slant 'normal)
   ((line-number-current-line &override)
    :foreground "#86878b"
    :height 0.8
    :slant 'normal)
   (header-line :background (doom-color bg))
   (diff-removed :foreground vcs-removed)
   (ediff-fine-diff-A :background (doom-blend red bg 0.3))
   (font-lock-comment-face :foreground (doom-blend (doom-color blue) "#888888" 0.4))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)
   (font-lock-keyword-face :foreground (doom-color cyan))
   (font-lock-builtin-face :foreground (doom-color blue))
   (font-lock-constant-face :foreground (doom-color magenta) :weight 'bold)
   (font-lock-string-face
    :background (doom-lighten (doom-color bg) 0.1)
    :foreground (doom-blend (doom-color blue) "#aaaaaa" 0.2))
   (font-lock-function-name-face :weight 'bold)
   (font-lock-type-face :foreground (doom-color red) :weight 'bold)
   (font-lock-variable-name-face :foreground (doom-blend (doom-color blue) "#aaaaaa" 0.2) :weight 'bold)
   (font-lock-doc-face :foreground (doom-color blue))
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

   ;; consult
   (consult-grep-context :inherit font-lock-doc-face)
   (consult-help :inherit font-lock-doc-face)

   ;; vertico
   (vertico-group-title :inherit font-lock-doc-face)

   ;; centaur-tabs
   (centaur-tabs-default
     :foreground common-fg
     :background common-bg
     :weight 'bold)
   (centaur-tabs-selected
     :foreground common-fg
     :background common-bg
     :weight 'bold)
   (centaur-tabs-unselected
     :foreground (doom-lighten (doom-color grey) 0.4)
     :background common-bg
     :weight 'bold)
   (centaur-tabs-unselected-modified
     :foreground (doom-blend (doom-color red) (doom-color grey) 0.5)
     :background common-bg
     :weight 'bold)
   (centaur-tabs-selected-modified
     :foreground (doom-color red)
     :background common-bg
     :weight 'bold)

   ;; company
   (company-tooltip :foreground common-fg :background common-bg)
   (company-tooltip-annotation :foreground common-fg)
   (company-tooltip-selection :background ui-line)
   (company-tooltip-search :foreground common-accent :weight 'bold)
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
   (tree-sitter-hl-face:type :foreground (doom-color red) :weight 'normal :slant 'normal)
   (tree-sitter-hl-face:constructor :foreground (doom-lighten red 0.3) :weight 'normal :slant 'normal)
   (tree-sitter-hl-face:method.call :foreground (doom-lighten (doom-color cyan) 0.1) :weight 'normal :slant 'normal)
   (tree-sitter-hl-face:function :foreground (doom-lighten (doom-color cyan) 0.1) :weight 'normal :slant 'normal)
   (tree-sitter-hl-face:function.call :foreground (doom-color yellow) :weight 'normal :slant 'normal)
   (tree-sitter-hl-face:function.method :foreground (doom-color cyan) :weight 'normal :slant 'normal)
   (tree-sitter-hl-face:function.method.call :foreground (doom-color yellow) :weight 'normal :slant 'normal)
   (tree-sitter-hl-face:punctuation :foreground (doom-darken (doom-color cyan) 0.2) :weight 'normal :slant 'normal)
   (tree-sitter-hl-face:punctuation.bracket :foreground (doom-darken (doom-color cyan) 0.2) :weight 'normal :slant 'normal)
   (tree-sitter-hl-face:punctuation.special :foreground (doom-darken (doom-color cyan) 0.2) :weight 'normal :slant 'normal)
   (tree-sitter-hl-face:punctuation.delimiter :foreground (doom-darken (doom-color cyan) 0.2) :weight 'normal :slant 'normal)
   (tree-sitter-hl-face:operator :foreground (doom-darken (doom-color cyan) 0.2) :weight 'normal :slant 'normal)
   (tree-sitter-hl-face:constant :foreground (doom-color magenta) :weight 'normal :slant 'normal)
   (tree-sitter-hl-face:constant.builtin :foreground (doom-color magenta) :weight 'normal :slant 'normal)
   (tree-sitter-hl-face:comment :foreground (doom-blend (doom-color blue) "#888888" 0.4))
   (tree-sitter-hl-face:variable :foreground (doom-blend (doom-color 'blue) "#aaaaaa" 0.2) :weight 'normal :slant 'normal)
   (tree-sitter-hl-face:property :foreground (doom-blend (doom-color 'blue) "#aaaaaa" 0.2) :weight 'normal :slant 'normal)
   (tree-sitter-hl-face:string :background (doom-lighten (doom-color 'bg) 0.1) :foreground (doom-blend (doom-color 'blue) "#888888" 0.5))
   ))
;;; ayu-dark-theme.el ends here
