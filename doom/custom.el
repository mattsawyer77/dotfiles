(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" default))
 '(safe-local-variable-values
   '((git-commit-major-mode . git-commit-elisp-text-mode)
     (js2-basic-offset . 2)
     (lsp--override-calculate-lisp-indent\? . t)
     (eval progn
           (let
               ((dirloc-lsp-defun-regexp
                 (concat
                  (concat "^\\s-*(" "lsp-defun" "\\s-+\\(")
                  (or
                   (bound-and-true-p lisp-mode-symbol-regexp)
                   "\\(?:\\sw\\|\\s_\\|\\\\.\\)+")
                  "\\)")))
             (add-to-list 'imenu-generic-expression
                          (list "Functions" dirloc-lsp-defun-regexp 1)))
           (defvar lsp--override-calculate-lisp-indent\? nil "Whether to override `lisp-indent-function' with
              the updated `calculate-lisp-indent' definition from
              Emacs 28.")
           (defun wrap-calculate-lisp-indent
               (func &optional parse-start)
             "Return appropriate indentation for current line as Lisp code.
In usual case returns an integer: the column to indent to.
If the value is nil, that means don't change the indentation
because the line starts inside a string.

PARSE-START may be a buffer position to start parsing from, or a
parse state as returned by calling `parse-partial-sexp' up to the
beginning of the current line.

The value can also be a list of the form (COLUMN CONTAINING-SEXP-START).
This means that following lines at the same level of indentation
should not necessarily be indented the same as this line.
Then COLUMN is the column to indent to, and CONTAINING-SEXP-START
is the buffer position of the start of the containing expression."
             (if
                 (not lsp--override-calculate-lisp-indent\?)
                 (funcall func parse-start)
               (save-excursion
                 (beginning-of-line)
                 (let
                     ((indent-point
                       (point))
                      state
                      (desired-indent nil)
                      (retry t)
                      whitespace-after-open-paren calculate-lisp-indent-last-sexp containing-sexp)
                   (cond
                    ((or
                      (markerp parse-start)
                      (integerp parse-start))
                     (goto-char parse-start))
                    ((null parse-start)
                     (beginning-of-defun))
                    (t
                     (setq state parse-start)))
                   (unless state
                     (while
                         (<
                          (point)
                          indent-point)
                       (setq state
                             (parse-partial-sexp
                              (point)
                              indent-point 0))))
                   (while
                       (and retry state
                            (>
                             (elt state 0)
                             0))
                     (setq retry nil)
                     (setq calculate-lisp-indent-last-sexp
                           (elt state 2))
                     (setq containing-sexp
                           (elt state 1))
                     (goto-char
                      (1+ containing-sexp))
                     (if
                         (and calculate-lisp-indent-last-sexp
                              (> calculate-lisp-indent-last-sexp
                                 (point)))
                         (let
                             ((peek
                               (parse-partial-sexp calculate-lisp-indent-last-sexp indent-point 0)))
                           (if
                               (setq retry
                                     (car
                                      (cdr peek)))
                               (setq state peek)))))
                   (if retry nil
                     (goto-char
                      (1+ containing-sexp))
                     (setq whitespace-after-open-paren
                           (looking-at
                            (rx whitespace)))
                     (if
                         (not calculate-lisp-indent-last-sexp)
                         (setq desired-indent
                               (current-column))
                       (parse-partial-sexp
                        (point)
                        calculate-lisp-indent-last-sexp 0 t)
                       (cond
                        ((looking-at "\\s("))
                        ((>
                          (save-excursion
                            (forward-line 1)
                            (point))
                          calculate-lisp-indent-last-sexp)
                         (if
                             (or
                              (=
                               (point)
                               calculate-lisp-indent-last-sexp)
                              whitespace-after-open-paren)
                             nil
                           (progn
                             (forward-sexp 1)
                             (parse-partial-sexp
                              (point)
                              calculate-lisp-indent-last-sexp 0 t)))
                         (backward-prefix-chars))
                        (t
                         (goto-char calculate-lisp-indent-last-sexp)
                         (beginning-of-line)
                         (parse-partial-sexp
                          (point)
                          calculate-lisp-indent-last-sexp 0 t)
                         (backward-prefix-chars)))))
                   (let
                       ((normal-indent
                         (current-column)))
                     (cond
                      ((elt state 3)
                       nil)
                      ((and
                        (integerp lisp-indent-offset)
                        containing-sexp)
                       (goto-char containing-sexp)
                       (+
                        (current-column)
                        lisp-indent-offset))
                      (calculate-lisp-indent-last-sexp
                       (or
                        (and lisp-indent-function
                             (not retry)
                             (funcall lisp-indent-function indent-point state))
                        (and
                         (save-excursion
                           (goto-char indent-point)
                           (skip-chars-forward " 	")
                           (looking-at ":"))
                         (save-excursion
                           (goto-char calculate-lisp-indent-last-sexp)
                           (backward-prefix-chars)
                           (while
                               (not
                                (or
                                 (looking-back "^[ 	]*\\|([ 	]+"
                                               (line-beginning-position))
                                 (and containing-sexp
                                      (>=
                                       (1+ containing-sexp)
                                       (point)))))
                             (forward-sexp -1)
                             (backward-prefix-chars))
                           (setq calculate-lisp-indent-last-sexp
                                 (point)))
                         (> calculate-lisp-indent-last-sexp
                            (save-excursion
                              (goto-char
                               (1+ containing-sexp))
                              (parse-partial-sexp
                               (point)
                               calculate-lisp-indent-last-sexp 0 t)
                              (point)))
                         (let
                             ((parse-sexp-ignore-comments t)
                              indent)
                           (goto-char calculate-lisp-indent-last-sexp)
                           (or
                            (and
                             (looking-at ":")
                             (setq indent
                                   (current-column)))
                            (and
                             (<
                              (line-beginning-position)
                              (prog2
                                  (backward-sexp)
                                  (point)))
                             (looking-at ":")
                             (setq indent
                                   (current-column))))
                           indent))
                        normal-indent))
                      (desired-indent)
                      (t normal-indent)))))))
           (when
               (< emacs-major-version 28)
             (advice-add #'calculate-lisp-indent :around #'wrap-calculate-lisp-indent))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(+workspace-tab-face ((t (:family "Avenir Next"))))
 '(+workspace-tab-selected-face ((t (:family "Avenir Next"))))
 '(doom-modeline-persp-name ((t (:slant normal))))
 '(doom-modeline-project-dir ((t (:weight bold :background nil))))
 '(flycheck-posframe-background-face ((t (:background "#40444e"))))
 '(font-lock-function-name-face ((t (:weight bold))))
 '(font-lock-string-face ((t (:background "#2b303b"))))
 '(font-lock-type-face ((t (:weight bold))))
 '(haskell-definition-face ((t (:foreground "#8FA1B3"))))
 '(haskell-keyword-face ((t (:foreground "coral"))))
 '(haskell-operator-face ((t (:foreground "#D08770"))))
 '(haskell-pragma-face ((t (:weight bold :foreground "#BF616A" :background "#15181d"))))
 '(haskell-quasi-quote-face ((t (:foreground "#c678dd"))))
 '(haskell-type-face ((t (:weight bold :foreground "#D08770"))))
 '(header-line ((t (:height 1.4 :background "#2b303b"))))
 '(mode-line ((t (:family "Avenir Next"))))
 '(mode-line-inactive ((t (:family "Avenir Next"))))
 '(org-block ((t (:family "PragmataPro Liga 1.1"))))
 '(org-code ((t (:family "PragmataPro Liga 1.1"))))
 '(org-default ((t (:inherit 'org-face :foreground "#8FA1B3" :background "#2b303b"))))
 '(org-document-title ((t (:inherit 'org-face :height 1.3 :weight normal))))
 '(org-level-1 ((t (:inherit 'org-face :height 1.2 :weight bold :foreground "#8FA1B3"))))
 '(org-level-2 ((t (:inherit 'org-face :height 1.0 :weight bold :foreground "#8FA1B3"))))
 '(org-level-3 ((t (:inherit 'org-face :height 0.9 :weight normal :foreground "#8FA1B3"))))
 '(org-level-4 ((t (:inherit 'org-face :height 0.8))))
 '(org-level-5 ((t (:inherit 'org-face :height 0.7))))
 '(org-level-6 ((t (:inherit 'org-face :height 0.6))))
 '(org-level-7 ((t (:inherit 'org-face :height 0.5))))
 '(org-level-8 ((t (:inherit 'org-face :height 0.4))))
 '(org-quote ((t (:inherit 'org-face :background "#40444e" :slant italic))))
 '(org-superstar-header-bullet ((t (:inherit 'org-face :foreground "#ECBE7B"))))
 '(org-table ((t (:family "PragmataPro Liga 1.1"))))
 '(org-tag ((t (:foreground "#7e6695"))))
 '(rustic-builtin-formatting-macro ((t (:foreground "tomato"))))
 '(rustic-string-interpolation ((t (:slant normal))))
 '(solaire-org-hide-face ((t (:foreground "#2b303b" :background "#2b303b"))))
 '(tree-sitter-hl-face:constant ((t (:foreground "#c678dd"))))
 '(tree-sitter-hl-face:property ((t (:inherit font-lock-constant-face :slant normal))))
 '(tree-sitter-hl-face:punctuation ((t (:foreground "#5f3035"))))
 '(tree-sitter-hl-face:punctuation\.bracket ((t (:foreground "#5f3035"))))
 '(tree-sitter-hl-face:punctuation\.delimiter ((t (:foreground "#984d54" :weight bold))))
 '(tree-sitter-hl-face:punctuation\.special ((t (:foreground "#5f3035"))))
 '(tree-sitter-hl-face:variable ((t (:foreground "#8FA1B3"))))
 '(treemacs-directory-collapsed-face ((t (:weight normal :slant normal :family "SF Pro Display"))))
 '(treemacs-directory-face ((t (:weight normal :slant normal :family "SF Pro Display"))))
 '(treemacs-file-face ((t (:weight normal :slant normal :family "SF Pro Display"))))
 '(treemacs-fringe-indicator-face ((t (:weight normal :slant normal :family "SF Pro Display"))))
 '(treemacs-git-added-face ((t (:weight normal :slant normal :family "SF Pro Display"))))
 '(treemacs-git-conflict-face ((t (:weight normal :slant normal :family "SF Pro Display"))))
 '(treemacs-git-ignored-face ((t (:weight normal :slant normal :family "SF Pro Display"))))
 '(treemacs-git-modified-face ((t (:weight normal :slant normal :family "SF Pro Display"))))
 '(treemacs-git-renamed-face ((t (:weight normal :slant normal :family "SF Pro Display"))))
 '(treemacs-git-unmodified-face ((t (:weight normal :slant normal :family "SF Pro Display"))))
 '(treemacs-git-untracked-face ((t (:weight normal :slant normal :family "SF Pro Display"))))
 '(treemacs-help-column-face ((t (:weight normal :slant normal :family "SF Pro Display"))))
 '(treemacs-help-title-face ((t (:weight normal :slant normal :family "SF Pro Display"))))
 '(treemacs-on-failure-pulse-face ((t (:weight normal :slant normal :family "SF Pro Display"))))
 '(treemacs-on-success-pulse-face ((t (:weight normal :slant normal :family "SF Pro Display"))))
 '(treemacs-root-face ((t (:height 1.2 :weight bold :slant normal :family "SF Pro Display" :background "#2b303b"))))
 '(treemacs-tags-face ((t (:weight normal :slant normal :family "SF Pro Display"))))
 '(treemacs-term-node-face ((t (:weight normal :slant normal :family "SF Pro Display"))))
 '(variable-pitch ((t (:family "Avenir Next")))))
