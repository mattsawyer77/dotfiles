;;;  -*- no-byte-compile: t; -*-

(package! doom-modeline)
(package! prettier-js)
(package! evil-nerd-commenter)
(package! vmd-mode)
(package! highlight-indent-guides)
(package! treemacs-persp)
(package! flycheck-posframe)
(package! tree-sitter)
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
(package! rfc-mode)
(package! page-break-lines)
(package! info-colors)
(package! textsize)
(package! org-modern)

(disable-packages! hl-line)
