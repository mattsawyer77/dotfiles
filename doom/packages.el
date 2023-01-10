;;;  -*- no-byte-compile: t; -*-

(unpin! lsp-mode)
(unpin! lsp-ui)
(unpin! rustic)
(unpin! consult-lsp)
;; (unpin! treemacs)
(unpin! better-jumper)
(package! doom-modeline)
(package! prettier-js)
(package! evil-nerd-commenter)
(package! vmd-mode)
(package! highlight-indent-guides)
(package! treemacs-persp)
(package! flycheck-posframe)
(unpin! tree-sitter)
(package! tree-sitter)
(unpin! tree-sitter-langs)
(package! tree-sitter-langs)
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

(disable-packages! hl-line)
