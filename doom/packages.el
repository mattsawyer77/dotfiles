;;;  -*- no-byte-compile: t; -*-

(package! yasnippet)
(package! doom-modeline)
(package! prettier-js)
(package! evil-nerd-commenter)
(package! transpose-frame)
(package! nginx-mode)
(package! company-nginx)
(package! mustache-mode)
;; (package! lsp-mode)
;; (package! lsp-ui)
;; (package! company-lsp)
;; (package! company-go)
(package! vmd-mode)
(package! evil-terminal-cursor-changer)
(package! highlight-indent-guides)
(package! ormolu :recipe (:host github :repo "vyorkin/ormolu.el"))
(package! toml-mode)
(package! lsp-haskell)
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
;; (package! hlint-refactor)
;; (package! dash)
;; (package! ht)
;; (package! fzf)
;; (package! dhall-mode)
(disable-packages! hl-line flycheck-golangci-lint)

(package! ponylang-mode)
(package! flycheck-pony)
(package! pony-snippets)
