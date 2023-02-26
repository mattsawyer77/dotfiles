;;;  -*- no-byte-compile: t; -*-

(unpin! lsp-mode)
(unpin! lsp-ui)
(unpin! rustic)
(unpin! consult-lsp)
;; (unpin! treemacs)
(unpin! better-jumper)
(package! adoc-mode)
(package! doom-modeline)
(package! prettier-js)
(package! evil-nerd-commenter)
(package! vmd-mode)
(package! highlight-indent-guides)
(package! treemacs-persp)
(package! flycheck-posframe)
;; (when EMACS29+
;; (package! evil-textobj-tree-sitter)
  ;; )
;; (unless EMACS29+
;; (unpin! tree-sitter)
;; (package! tree-sitter)
;;   (unpin! tree-sitter-langs)
;;   (package! tree-sitter-langs)
;;   )
;;(package! treesit-auto)
(package! uuidgen)
(package! dap-mode)
(package! protobuf-mode)
(package! org-pandoc-import
  :recipe (:host github
           :repo "tecosaur/org-pandoc-import"
           :files ("*.el" "filters" "preprocessors")))
(unpin! flycheck-golangci-lint)
(package! flycheck-golangci-lint
  :recipe (:host github
           :repo "mattsawyer77/flycheck-golangci-lint"
           :branch "main"
           ))
(unpin! makefile-executor)
(package! makefile-executor
  :recipe (:host github
           :repo "mattsawyer77/makefile-executor.el"
           :branch "main"
           ))
(package! rfc-mode)
(package! page-break-lines)
(package! info-colors)
(package! textsize)
(package! org-modern)
(package! centaur-tabs)
(package! ewal)
(package! git-auto-commit-mode)
;; (package! doom-nano-modeline
;;   :recipe (:host github
;;   :repo "ronisbr/doom-nano-modeline"))

(disable-packages! hl-line)
