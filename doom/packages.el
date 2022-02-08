;;;  -*- no-byte-compile: t; -*-

(package! base16-theme)
(package! yasnippet)
(package! doom-modeline)
(package! prettier-js)
(package! evil-nerd-commenter)
(package! transpose-frame)
(package! nginx-mode)
;; (package! company-nginx)
(package! mustache-mode)
(package! vmd-mode)
(package! evil-terminal-cursor-changer)
(package! highlight-indent-guides)
(package! ormolu :recipe (:host github :repo "vyorkin/ormolu.el"))
(package! toml-mode)
;; (package! lsp-haskell)
(package! treemacs-persp)
(package! flycheck-posframe)
(package! tree-sitter)
(package! tree-sitter-langs)
(package! zoom)
;; (package! elisp-benchmarks)
(package! hl-line+)
(package! eyebrowse)
(package! unison-mode)
(package! dap-mode)
(package! protobuf-mode)
(package! org-pandoc-import
  :recipe (:host github
           :repo "tecosaur/org-pandoc-import"
           :files ("*.el" "filters" "preprocessors")))
; https://github.com/hlissner/doom-emacs/issues/5095
(package! magit-section)
;; (package! hlint-refactor)
;; (package! dash)
;; (package! ht)
;; (package! fzf)
;; (package! dhall-mode)
(unpin! flycheck-golangci-lint)
(package! flycheck-golangci-lint
  :recipe (:host github
           :repo "mattsawyer77/flycheck-golangci-lint"
           :branch "main"
           ))
(disable-packages! hl-line consult-flycheck)

(package! ponylang-mode)
(package! flycheck-pony)
(package! pony-snippets)
