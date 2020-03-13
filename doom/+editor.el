;;;  -*- lexical-binding: t; -*-

(setq doom-modeline-icon t)
(setq doom-modeline-vcs-max-length 30)
(setq doom-modeline-persp-name t)
(setq confirm-kill-emacs nil)
(setq-default line-spacing 3)
(setq mac-command-modifier 'super)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(setq-default truncate-lines t)
(setq-default tab-width 2)

(when (and (display-graphic-p) IS-MAC)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  )
;; make kops edit automatically use yaml mode
(add-to-list 'auto-mode-alist '("\\kops-edit.+yaml$" . yaml-mode))
;; make helm templates automatically use mustache mode
(add-to-list 'auto-mode-alist '("\\k8s\/templates" . mustache-mode))
(add-to-list 'auto-mode-alist '("\\kubernetes\/templates" . mustache-mode))
;; make stack files use yaml mode
(add-to-list 'auto-mode-alist '("\\stack.yaml" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\package.yaml" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\\.aws/*" . conf-toml-mode))
(add-to-list 'auto-mode-alist '("\\\.saml2aws" . conf-toml-mode))
(add-to-list 'auto-mode-alist '("\\\.kube/config.*" . yaml-mode))
;; make SSH authorized keys files more readable
;; (add-to-list 'auto-mode-alist '("\\\.ssh\/authorized_keys" . prog-mode))

;; make underscore considered as a "word" character
(modify-syntax-entry ?_ "w")

;; ; workaround for https://github.com/emacs-evil/evil/issues/1168
;; (setq-default evil-respect-visual-line-mode nil)

(add-hook! prog-mode 'turn-on-visual-line-mode)
(add-hook! prog-mode 'display-line-numbers-mode)
;; do we need this for emacs-lisp, yaml, markdown, mustache, terraform, rust?

(add-hook! evil-insert-state-entry (lambda nil (flycheck-mode -1)))
(add-hook! evil-insert-state-exit (lambda nil (flycheck-mode 1)))

(after! default-text-scale
  (default-text-scale-mode 1)
  )

(after! undo-tree
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/.local/undo")))
  (global-undo-tree-mode)
  )

(after! evil-surround
  (global-evil-surround-mode 1)
  )

(after! projectile
  (setq projectile-project-search-path '("~/workspaces"
                                         "~/workspaces/f5aas"
                                         "~/workspaces/f5aas/orchestration"
                                         "~/workspaces/f5aas/infra"
                                         "~/haskell"
                                         "~/src/rust"))
  )

(after! persp-mode
  (setq uniquify-buffer-name-style 'forward)
  )

(after! treemacs
  (treemacs-follow-mode)
  )

(after! company
  (global-company-mode)
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)
  )

;; (after! lsp-ui
;;   :defer t
;;   :commands lsp-ui-mode
;;   )

(add-hook! lsp-ui
  (lsp-ui-sideline-enable nil)
  (lsp-ui-doc-enable t)
  )

(after! company-lsp
  (push 'company-lsp company-backends)
  )

;; optional - provides fancier overlays
;; (use-package lsp-ui
;;   :commands lsp-ui-mode)

(after! flycheck
  ;; make flycheck window auto-resize (with a max height of 15 lines)
  (defadvice flycheck-error-list-refresh (around shrink-error-list activate)
    ad-do-it
    (-when-let (window (flycheck-get-error-list-window t))
      (with-selected-window window
        (fit-window-to-buffer window 15))))
  )

(after! git-gutter
  (setq git-gutter:modified-sign "▕")
  (setq git-gutter:added-sign "▕")
  (setq git-gutter:deleted-sign "▕")
  )

(after! evil-terminal-cursor-changer
  (unless (display-graphic-p)
    (evil-terminal-cursor-changer-activate) ; or (etcc-on)
    )
)

(when (and (display-graphic-p) IS-MAC)
  (mac-auto-operator-composition-mode)
  )

(after! (haskell-mode lsp-haskell ormolu)
  (setq lsp-haskell-process-path-hie "hie-wrapper")
  (add-hook! haskell-mode #'lsp)
  (add-hook! haskell-mode 'highlight-indent-guides-mode)
  (setq ormolu-reformat-buffer-on-save t)
  (add-hook! haskell-mode 'ormolu-format-on-save-mode)
  )

(after! (rust-mode rustic-mode lsp)
  (setq rustic-lsp-server 'rust-analyzer)
  (add-hook! rust-mode #'lsp)
  )

(after! yaml-mode
  (add-hook! yaml-mode 'highlight-indent-guides-mode)
  )

(after! json-mode
  (add-hook! json-mode 'highlight-indent-guides-mode)
  )

(after! python-mode
  (add-hook! python-mode 'highlight-indent-guides-mode)
  )

(after! (go-mode lsp-mode)
  (add-hook! go-mode #'lsp)
  (add-hook! go-mode
    (lambda nil
      (add-hook before-save-hook 'gofmt-before-save)))
  )

(add-hook! js2-mode
  (prettier-js-mode)
  )
