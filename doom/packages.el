;;;  -*- no-byte-compile: t; -*-

;; (package! base16-theme)
;(package! yasnippet)
(package! doom-modeline)
(package! prettier-js)
(package! evil-nerd-commenter)
;(package! transpose-frame)
;; (package! nginx-mode)
;; (package! company-nginx)
(package! mustache-mode)
(package! vmd-mode)
;; (package! evil-terminal-cursor-changer)
(package! highlight-indent-guides)
;; (package! ormolu :recipe (:host github :repo "vyorkin/ormolu.el"))
(package! toml-mode)
;; (package! lsp-haskell)
(package! treemacs-persp)
(package! flycheck-posframe)
(package! tree-sitter)
(package! tree-sitter-langs)
;; (package! zoom)
;; (package! elisp-benchmarks)
(package! hl-line+)
;; (package! eyebrowse)
;; (package! unison-mode)
(package! dap-mode)
(package! protobuf-mode)
(package! org-pandoc-import
  :recipe (:host github
           :repo "tecosaur/org-pandoc-import"
           :files ("*.el" "filters" "preprocessors")))
;; (package! vertico-posframe)
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
;; (unpin! flycheck)
;; (package! flycheck
;;   :recipe (:host github
;;            :repo "mattsawyer77/flycheck"
;;            :branch "main"
;;            ))

;; temporarily unpin lsp-ui mode to get fix for lsp-ui-sideline: https://github.com/emacs-lsp/lsp-ui/pull/719
(unpin! lsp-ui)

(disable-packages! hl-line consult-flycheck)

;; (package! ponylang-mode)
;; (package! flycheck-pony)
;; (package! pony-snippets)
(package! rfc-mode)
(package! page-break-lines)
;; (package! magit-delta)
;; (package! focus)
;; (package! dimmer)
(package! info-colors)
;; (package! svg-tag-mode)
;; (package! carbon-themes
;;   :recipe (:host github
;;            :repo "shaunsingh/nyoom.emacs"
;;            :branch "main"
;;            :files ("lisp/carbon-themes/*.el")))
;; (package! carbon-modeline
;;   :recipe (:host github
;;            :repo "shaunsingh/nyoom.emacs"
;;            :branch "main"
;;            :files ("lisp/carbon-modeline/*.el")))
(package! textsize)
(package! org-modern)
;; (package! flymake-collection)
;; (package! flymake-flycheck)
;; (package! flymake-golangci)
;; (package! flymake-go-staticcheck)
;; (package! flymake-diagnostic-at-point)
