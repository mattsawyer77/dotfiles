;;;  -*- no-byte-compile: t; -*-

;; (package! base16-theme)
(package! yasnippet)
;; (package! doom-modeline)
(package! prettier-js)
(package! evil-nerd-commenter)
;; (package! transpose-frame)
;; (package! nginx-mode)
;; (package! mustache-mode)
(package! vmd-mode)
(package! evil-terminal-cursor-changer)
(package! highlight-indent-guides)
;; (package! ormolu)
;; (package! flycheck-posframe :recipe (:host nil :branch master :repo "git@github.com:alexmurray/flycheck-posframe"))
(package! treemacs-persp)
;; (package! flycheck-posframe)
(package! tree-sitter)
(package! tree-sitter-langs)
;; (package! zoom)
;; (package! hl-line+)
;; (package! eyebrowse)
;; (package! unison-mode)
(package! dap-mode)
(package! protobuf-mode)
(package! org-pandoc-import
  :recipe (:host github
           :repo "tecosaur/org-pandoc-import"
           :files ("*.el" "filters" "preprocessors")))
; https://github.com/hlissner/doom-emacs/issues/5095
;; (package! magit-section)
;; (package! magit-delta)
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
;; packages from https://github.com/shaunsingh/nyoom.emacs/blob/main/config.org
;; (package! doct)
;; (package! slack)
(package! org-appear)
(package! org-roam-ui)
(package! org-preview-html)
;(package! org-num
;  :recipe (:host github
;           :repo "shaunsingh/nyoom.emacs"
;           :branch "main"
;           :files ("lisp/org-num/*.el")
;           ))
(package! org-ol-tree :recipe (:host github :repo "Townk/org-ol-tree"))
(package! org-bib-mode :recipe (:host github :repo "rougier/org-bib-mode"))
(package! notebook-mode :recipe (:host github :repo "rougier/notebook-mode"))
(package! org-pretty-table :recipe (:host github :repo "Fuco1/org-pretty-table"))
;; (package! focus)
;; (package! dimmer)
(package! info-colors)
;; (package! svg-tag-mode)
(package! org-modern)
(package! tabspaces)
(package! solaire-mode :disable t)
;; (package! carbon-themes
;;   :recipe (:host github
;;            :repo "shaunsingh/nyoom.emacs"
;;            :branch "main"
;;            :files ("lisp/carbon-themes/*.el")
;;            ))
;; (package! carbon-modeline
;;   :recipe (:host github
;;            :repo "shaunsingh/nyoom.emacs"
;;            :branch "main"
;;            :files ("lisp/carbon-modeline/carbon-modeline.el")
;;            ))
;; (package! corfu-terminal
;;   :recipe (:type git
;;            :repo "https://codeberg.org/akib/emacs-corfu-terminal.git"
;;            ))

;; (package! vertico-posframe)
;; (package! nano
  ;; :recipe (:type git :host github :repo "rougier/nano-emacs"))

;; (disable-packages! consult-flycheck)
