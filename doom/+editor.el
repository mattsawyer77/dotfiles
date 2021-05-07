;;;  -*- lexical-binding: t; -*-

; workaround for https://github.com/emacs-evil/evil/issues/1168
(setq-default evil-respect-visual-line-mode nil)
(setq doom-modeline-vcs-max-length 30)
(setq doom-modeline-persp-name t)
(setq confirm-kill-emacs nil)
(setq mac-command-modifier 'super)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(setq-default truncate-lines t)
(setq-default tab-width 2)
(setq-default scroll-margin 100)
(setq-default maximum-scroll-margin 0.15)
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
(modify-syntax-entry ?_ "w")

;; use tree-sitter for syntax highlighting
(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package! rustic
  :defer
  :config
  (setq rustic-lsp-server 'rust-analyzer)
  (setq rustic-format-on-save t)
  (auto-save-mode -1)
  )

(after! (go-mode flycheck)
  ;; some of these are redundant, and errcheck is awesome but super slow --
  ;; so there is a keybinding to manually kick off errcheck in +keybindings.el
  (setq-default flycheck-disabled-checkers '(go-golint go-build go-errcheck))
  (require 'dap-go)
  )

(add-hook! go-mode #'+format-enable-on-save-h)
(add-hook! go-mode #'turn-on-visual-line-mode)
(add-hook! go-mode #'+word-wrap-mode)
(add-hook! go-mode #'lsp)
;; the following is super broken
;; see https://github.com/weijiangan/flycheck-golangci-lint/issues/8
;; (add-hook! go-mode #'flycheck-golangci-lint-setup)

; (use-package! hl-line+
;   :config
;   (hl-line-when-idle-interval 0.1)
;   (toggle-hl-line-when-idle t))

(after! display-line-numbers
  (add-hook! prog-mode
    (turn-on-visual-line-mode)
    (display-line-numbers-mode)
    )
  )

;; (after! rainbow-delimiters
;;   (add-hook! (prog-mode rustic-mode) #'rainbow-delimiters-mode-enable)
;;   )

(after! undo-tree
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/.local/undo")))
  (global-undo-tree-mode)
  )

(after! evil-surround
  (global-evil-surround-mode 1)
  )

(after! projectile
  (setq projectile-auto-discover 't)
  (setq projectile-project-search-path '("~/workspaces"
                                         "~/workspaces/f5cs-orchestration/management-plane"
                                         "~/workspaces/f5cs-orchestration"
                                         "~/workspaces/f5aas/infra"
                                         ))
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

(after! company-lsp
  (push 'company-lsp company-backends)
  )

(after! flycheck
  ;; make flycheck window auto-resize (with a max height of 15 lines)
  (defadvice flycheck-error-list-refresh (around shrink-error-list activate)
    ad-do-it
    (-when-let (window (flycheck-get-error-list-window t))
      (with-selected-window window
        (fit-window-to-buffer window 15))))
  ;; disable flycheck while in insert mode
  (add-hook! evil-insert-state-entry (lambda nil (flycheck-mode -1)))
  ;; re-enable flycheck when exiting insert mode
  (add-hook! evil-insert-state-exit (lambda nil (flycheck-mode 1)))
  )

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

; (when (and (display-graphic-p) IS-MAC)
;   (mac-auto-operator-composition-mode)
;   )

(after! (haskell lsp-haskell ormolu lsp-ui)
  (setq lsp-haskell-process-path-hie "hie-wrapper")
  (setq ormolu-reformat-buffer-on-save t)
  )
(add-hook! haskell-mode #'lsp)
(add-hook! haskell-mode 'ormolu-format-on-save-mode)


(add-hook! rustic-mode #'tree-sitter-mode)
(add-hook! rustic-mode #'lsp)
(add-hook! rustic-mode #'+word-wrap-mode)

(add-hook! (haskell-mode yaml-mode json-mode makefile-mode ponylang-mode) 'highlight-indent-guides-mode)

(after! (terraform-mode lsp-mode)
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("terraform-ls" "serve"))
                    :major-modes '(terraform-mode)
                    :server-id 'terraform-ls)))

;; (after! (terraform lsp)
;;   (add-to-list 'lsp-language-id-configuration '(terraform-mode . "terraform"))

;;   (lsp-register-client
;;   (make-lsp-client :new-connection (lsp-stdio-connection '("~/.local/bin/terraform-lsp" "-enable-log-file"))
;;                     :major-modes '(terraform-mode)
;;                     :server-id 'terraform-ls)))

(add-hook! terraform-mode #'lsp)

(add-hook! js2-mode
  (prettier-js-mode)
  )

(after! js2-mode
  (setq-default js2-basic-offset 2)
  )

(add-hook! terraform-mode
  (terraform-format-on-save-mode)
  )

(after! lsp-ui
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-peek-enable t)
 )

(use-package! zoom
  ;; :hook (doom-first-input . zoom-mode)
  :config (setq zoom-size '(0.7 . 0.7)
                zoom-ignored-major-modes '(treemacs-mode)))

(after! org
  (setq org-agenda-files '("/Users/sawyer/Library/Mobile Documents/com~apple~CloudDocs/notes")
        org-hide-emphasis-markers t
        org-hide-block-startup t
        org-hide-leading-stars t
        org-hide-macro-markers t
        )
  )

;; currently broken:
;; (when-let (dims (doom-store-get 'last-frame-size))
;;   (cl-destructuring-bind ((left . top) width height fullscreen) dims
;;     (setq initial-frame-alist
;;           (append initial-frame-alist
;;                   `((left . ,left)
;;                     (top . ,top)
;;                     (width . ,width)
;;                     (height . ,height)
;;                     (fullscreen . ,fullscreen))))))

(defun save-frame-dimensions ()
  (doom-store-put 'last-frame-size
                  (list (frame-position)
                        (frame-width)
                        (frame-height)
                        (frame-parameter nil 'fullscreen))))

(add-hook 'kill-emacs-hook #'save-frame-dimensions)

(add-hook! ponylang-mode
  (setq create-lockfiles nil)
  (require 'flycheck-pony)
  (require 'pony-snippets)
  (flycheck-select-checker 'pony)
  (whitespace-mode -1)
  )

(after! lsp-mode
  (setq lsp-file-watch-ignored-directories
        (cl-union lsp-file-watch-ignored-directories
                  '("[/\\\\]\\.terraform\\'"
                    "[/\\\\]target\\'"
                    "[/\\\\]\\vendor\\'"
                    )))
  (setq lsp-headerline-breadcrumb-enable 't)
  (setq lsp-headerline-breadcrumb-segments '(project path-up-to-project file symbols))
  )

(after! ccls
  (setq ccls-initialization-options '(:index (:comments 2) :completion (:detailedLabel t))))
(add-hook! ccls #'tree-sitter-mode)
