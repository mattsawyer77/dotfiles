;;;  -*- no-byte-compile: t; -*-

(package! yasnippet)
(package! doom-modeline)
(package! prettier-js)
(package! evil-nerd-commenter)
(package! transpose-frame)
(package! nginx-mode)
(package! mustache-mode)
(package! golden-ratio)
(package! lsp-mode)
(package! lsp-ui)
(package! company-lsp)
(package! company-go)
(package! vmd-mode)
(when (not (display-graphic-p))
  (package! evil-terminal-cursor-changer)
  )
(package! highlight-indent-guides)
(package! ormolu :recipe (:host github :repo "vyorkin/ormolu.el"))
;; (package! fzf)
;; (package! dhall-mode)
(package! toml-mode)
(package! company-nginx)
(package! lsp-haskell)
;; (package! hlint-refactor)
;; (package! treemacs-persp)
;; (package! dash)
;; (package! ht)
