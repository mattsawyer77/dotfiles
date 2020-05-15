;;;  -*- lexical-binding: t; -*-

(setq doom-modeline-vcs-max-length 30)
(setq doom-modeline-persp-name t)
(setq confirm-kill-emacs nil)
(setq-default line-spacing 3)
(setq mac-command-modifier 'super)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(setq-default truncate-lines t)
(setq-default tab-width 2)
(when (and (display-graphic-p) IS-MAC)
  (setq doom-modeline-icon t)
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
;; (modify-syntax-entry ?_ "w")

(after! display-line-numbers
  (add-hook! prog-mode
    (turn-on-visual-line-mode)
    (display-line-numbers-mode)
    )
  )

(after! golden-ratio
  (golden-ratio-mode)
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

(after! persp
  (setq uniquify-buffer-name-style 'forward)
  )

(after! treemacs
  (treemacs-follow-mode)
  (setq-default treemacs--width-is-locked nil)
  )

(after! company
  (global-company-mode)
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)
  )

;; (add-hook! lsp-ui-mode
;;   (lsp-ui-sideline-enable nil)
;;   (lsp-ui-doc-enable t)
;;   )

(after! company-lsp
  (push 'company-lsp company-backends)
  )

(after! flycheck
  (defadvice flycheck-error-list-refresh (around shrink-error-list activate)
    ad-do-it
    (-when-let (window (flycheck-get-error-list-window t))
      (with-selected-window window
        (fit-window-to-buffer window 15))))
  )
;; disable flycheck while in insert mode
(add-hook! evil-insert-state-entry (lambda nil (flycheck-mode -1)))
;; re-enable flycheck when exiting insert mode
(add-hook! evil-insert-state-exit (lambda nil (flycheck-mode 1)))
;; make flycheck window auto-resize (with a max height of 15 lines)

(unless (display-graphic-p)
  (after! git-gutter
    (setq git-gutter:modified-sign "▕")
    (setq git-gutter:added-sign "▕")
    (setq git-gutter:deleted-sign "▕")
    )
)

(unless (display-graphic-p)
  (require 'evil-terminal-cursor-changer)
  (after! evil-terminal-cursor-changer
    (evil-terminal-cursor-changer-activate) ; or (etcc-on)
    )
)

;; (when (and (display-graphic-p) IS-MAC)
;;   (mac-auto-operator-composition-mode)
;;   )

(after! (haskell lsp-haskell ormolu lsp-ui)
  (setq lsp-haskell-process-path-hie "hie-wrapper")
  (setq ormolu-reformat-buffer-on-save t)
  )
(add-hook! haskell-mode #'lsp)
(add-hook! haskell-mode 'highlight-indent-guides-mode)
(add-hook! haskell-mode 'ormolu-format-on-save-mode)

(after! (rustic lsp lsp-ui)
  (setq rustic-lsp-server 'rust-analyzer)
  (setq rustic-format-on-save t)
  )
(add-hook! rust-mode #'lsp)

(add-hook! yaml-mode 'highlight-indent-guides-mode)

(add-hook! json-mode 'highlight-indent-guides-mode)

(add-hook! python-mode 'highlight-indent-guides-mode)

(add-hook! go-mode #'lsp)
(add-hook! go-mode
  (lambda nil
    (add-hook before-save-hook 'gofmt-before-save)))

;; terraform-lsp doesn't work right now, try again later
(after! (terraform lsp)
  (add-to-list 'lsp-language-id-configuration '(terraform-mode . "terraform"))

  (lsp-register-client
  (make-lsp-client :new-connection (lsp-stdio-connection '("terraform-lsp" "-enable-log-file"))
                    :major-modes '(terraform-mode)
                    :server-id 'terraform-ls))

  )
(add-hook! terraform-mode #'lsp)

(add-hook! js2-mode
  (prettier-js-mode)
  )

(add-hook! terraform-mode
  (terraform-format-on-save-mode)
  )
