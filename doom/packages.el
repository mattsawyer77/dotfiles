;;;  -*- no-byte-compile: t; -*-

(package! yasnippet)
(package! doom-modeline)
(package! prettier-js)
(package! evil-nerd-commenter)
(package! transpose-frame)
(package! nginx-mode)
(package! company-nginx)
(package! mustache-mode)
(package! vmd-mode)
(package! evil-terminal-cursor-changer)
(package! highlight-indent-guides)
(package! ormolu :recipe (:host nil :repo "git@github.com:vyorkin/ormolu.el"))
(package! flycheck-posframe :recipe (:host nil :branch master :repo "git@github.com:alexmurray/flycheck-posframe"))
(package! toml-mode)
(package! lsp-haskell)
(package! treemacs-persp)
(package! flycheck-posframe)
(package! tree-sitter)
(package! tree-sitter-langs)
(package! zoom)
(package! hl-line+)
(package! eyebrowse)
(package! unison-mode)
(package! ponylang-mode)
(package! flycheck-pony)
(package! pony-snippets)
(package! dap-mode)
;; (package! selectrum)
;; (package! embark)
;; (package! marginalia)
;; (package! consult)
(package! ripgrep)
(package! magit-section)
;; (package! company-org-block)
;; (package! fzf)
;; (package! dhall-mode)
(disable-packages! hl-line flycheck-golangci-lint)

