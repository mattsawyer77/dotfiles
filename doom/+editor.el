;;;  -*- lexical-binding: t; -*-

(setq native-comp-async-report-warnings-errors nil)
(setq doom-modeline-vcs-max-length 30)
(setq doom-modeline-persp-name t)
(setq confirm-kill-emacs nil)
(setq mac-command-modifier 'super)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(setq-default truncate-lines t)
(setq-default tab-width 2)
(setq-default scroll-margin 3)
(setq-default maximum-scroll-margin 0.15)
(when (and (display-graphic-p) IS-MAC)
  (setq doom-modeline-icon t)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  )
;; make kops edit automatically use yaml mode
(add-to-list 'auto-mode-alist '("\\kops-edit.+yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\ya?ml\.tmpl$" . yaml-mode))
;; make helm templates automatically use mustache mode
(add-to-list 'auto-mode-alist '("\\k8s\/templates" . mustache-mode))
(add-to-list 'auto-mode-alist '("\\kubernetes\/templates" . mustache-mode))
;; make stack files use yaml mode
(add-to-list 'auto-mode-alist '("\\stack.yaml" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\package.yaml" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\\.aws/*" . conf-toml-mode))
(add-to-list 'auto-mode-alist '("\\\.saml2aws" . conf-toml-mode))
(add-to-list 'auto-mode-alist '("\\\.kube/config.*" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\\.hpp$" . cpp-mode))
(add-to-list 'auto-mode-alist '("\\\.h$" . cpp-mode))
;; make SSH authorized keys files more readable
(add-to-list 'auto-mode-alist '("\\SConscript". python-mode))
(add-to-list 'auto-mode-alist '("\\SConstruct". python-mode))
(add-to-list 'auto-mode-alist '("\\go\.mod". go-mode))

;; use tree-sitter for syntax highlighting
(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package! rustic
  :defer
  :config
  (setq rustic-lsp-server 'rust-analyzer
        rustic-format-on-save t
        lsp-rust-server 'rust-analyzer
        lsp-rust-analyzer-display-chaining-hints t
        lsp-rust-analyzer-display-parameter-hints t
        lsp-rust-analyzer-server-display-inlay-hints t
        lsp-rust-analyzer-cargo-watch-command "clippy")
  (auto-save-mode -1)
  )

;; XXX: not working
;; (after! dap-mode
;;   (add-hook! 'dap-stopped-hook
;;             (lambda (arg) (call-interactively #'dap-hydra)))
;;   )

(after! (dap-mode go-mode flycheck)
  (require 'dap-go)
  (dap-go-setup)
  ;; (setq flycheck-golangci-lint-fast t)
  )

(add-hook! emacs-lisp-mode #'+word-wrap-mode)
(add-hook! emacs-lisp-mode #'rainbow-delimiters-mode-enable)

(add-hook! go-mode #'+format-enable-on-save-maybe-h)
(add-hook! go-mode #'turn-on-visual-line-mode)
(add-hook! go-mode #'+word-wrap-mode)
(add-hook! go-mode #'rainbow-delimiters-mode-enable)
(after! (go-mode dap-mode lsp-lens)
  (add-hook! go-mode
    (setq dap-print-io t)
    (dap-ui-mode t)
    (lsp-diagnostics-flycheck-enable t)
    )
)
(defvar-local flycheck-local-checkers nil)
(defun +flycheck-checker-get(fn checker property)
  (or (alist-get property (alist-get checker flycheck-local-checkers))
      (funcall fn checker property)))

(advice-add 'flycheck-checker-get :around '+flycheck-checker-get)

;; (add-hook 'go-mode-hook
;;           (lambda()
;;             (flycheck-golangci-lint-setup)
;;             (setq flycheck-local-checkers '((lsp . ((next-checkers . (golangci-lint))))))))

;; (use-package! hl-line+
;;   :config
;;   (hl-line-when-idle-interval 0.1)
;;   (toggle-hl-line-when-idle t))

(after! display-line-numbers
  (add-hook! (prog-mode haskell-cabal-mode)
    (turn-on-visual-line-mode)
    (display-line-numbers-mode)
    )
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
                                         "~/workspaces/volterra/ves.io"
                                         "~/haskell"
                                         "~/rust"
                                         "~/racket"))
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
  (setq flycheck-relevant-error-other-file-show nil)
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
  (require 'evil-terminal-cursor-changer)
  (after! evil-terminal-cursor-changer
    (evil-terminal-cursor-changer-activate) ; or (etcc-on)
    )
  )

(after! (haskell lsp-haskell ormolu lsp-ui)
  (setq lsp-haskell-process-path-hie "hie-wrapper")
  (setq ormolu-reformat-buffer-on-save t)
  )
(add-hook! haskell-mode #'lsp)
(add-hook! haskell-mode
           (ormolu-format-on-save-mode)
           (flycheck-posframe-mode -1)
           )


;; (add-hook! rustic-mode #'tree-sitter-mode)
(add-hook! rustic-mode
           (lsp)
           (+word-wrap-mode)
           (flycheck-posframe-mode -1)
           )
(add-hook! rustic-mode #'+word-wrap-mode)
;; (after! (lsp-mode lsp-ui rustic-mode)
;;   (setq lsp-lens-enable nil)
;;   )

(use-package! highlight-indent-guides
  :defer
  :hook ((haskell-mode
          yaml-mode
          json-mode
          makefile-mode
          makefile-bsdmake-mode)
         . highlight-indent-guides-mode)
  :init
  (setq highlight-indent-guides-method 'fill
        highlight-indent-guides-suppress-auto-error nil)
  )

(after! js-mode
  (setq-default js-indent-level 2)
  )

;; (after! (terraform-mode lsp-mode)
;;   (lsp-register-client
;;    (make-lsp-client :new-connection (lsp-stdio-connection '("terraform-ls" "serve"))
;;                     :major-modes '(terraform-mode)
;;                     :server-id 'terraform-ls)))

;; (after! (terraform lsp)
;;   (add-to-list 'lsp-language-id-configuration '(terraform-mode . "terraform"))
;;   (lsp-register-client
;;   (make-lsp-client :new-connection (lsp-stdio-connection '("~/.local/bin/terraform-lsp" "-enable-log-file"))
;;                     :major-modes '(terraform-mode)
;;                     :server-id 'terraform-ls)))

(add-hook! terraform-mode
  (lsp)
  (terraform-format-on-save-mode)
  )

(add-hook! js2-mode
  (prettier-js-mode)
  )

(after! js2-mode
  (setq-default js2-basic-offset 2)
  )


(after! (lsp-mode lsp-ui)
  (setq lsp-file-watch-ignored-directories
        (cl-union lsp-file-watch-ignored-directories
                  '("[/\\\\]\\.terraform\\'"
                    "[/\\\\]target\\'"
                    "[/\\\\]\\vendor\\'"
                    "[/\\\\]\\pbgo\\'"
                    "[/\\\\]\\pbswagger\\'"
                    "[/\\\\]\\extschema\\'"
                    "[/\\\\]\\.cache\\'"
                    )))
  (setq lsp-file-watch-threshold 8000)
  ;; 1. Symbol highlighting
  (setq lsp-enable-symbol-highlighting t)

  ;; 2. lsp-ui-doc - on hover dialogs. * disable via
  (setq lsp-ui-doc-enable 't)
  (setq lsp-ui-doc-position 'at-point)

  ;; * disable cursor hover (keep mouse hover)
  (setq lsp-ui-doc-show-with-cursor nil)

  ;; * disable mouse hover (keep cursor hover)
  (setq lsp-ui-doc-show-with-mouse t)

  ;; 3. Lenses
  (setq lsp-lens-enable 't)
  ;; 'above-line causes C-e to snag
  (setq lsp-lens-place-position 'end-of-line)

  ;; 4. Headerline
  (setq lsp-headerline-breadcrumb-enable t)
  ;; (setq lsp-headerline-breadcrumb-segments '(project path-up-to-project file symbols))

  ;; 5. Sideline code actions * disable whole sideline via
  (setq lsp-ui-sideline-enable nil)

  ;; * hide code actions
  (setq lsp-ui-sideline-show-code-actions nil)

  ;; * hide only hover symbols
  (setq lsp-ui-sideline-show-hover nil)

  ;; 7. Modeline code actions
  (setq lsp-modeline-code-actions-enable t)

  ;; Turn Off 2 8. Flycheck (or flymake if no flycheck is present)
  ;; (setq lsp-diagnostics-provider :none)

  ;; 9. Sideline diagnostics * disable whole sideline via
  (setq lsp-ui-sideline-enable nil)

  ;; * hide only errors
  (setq lsp-ui-sideline-show-diagnostics nil)

  ;; 10. Eldoc
  ;; (setq lsp-eldoc-enable-hover nil)

  ;; 11. Modeline diagnostics statistics
  (setq lsp-modeline-diagnostics-enable t)

  ;; Turn Off 3 12. Signature help
  (setq lsp-signature-auto-activate t) ;; you could manually request them via `lsp-signature-activate`

  ;; 13. Signature help documentation (keep the signatures)
  (setq lsp-signature-render-documentation t)

  ;; Turn Off 4 14. Completion (company-mode)
  ;; (setq lsp-completion-provider :none)

  ;; 15. Completion item detail
  (setq lsp-completion-show-detail t)

  ;; 16. Completion item kind
  (setq lsp-completion-show-kind t)

  (setq lsp-enable-links nil)

  (setq lsp-enable-symbol-highlighting nil)
)

;(use-package! zoom
;  ;; :hook (doom-first-input . zoom-mode)
;  :config (setq zoom-size '(0.7 . 0.7)
;                zoom-ignored-major-modes '(treemacs-mode)))

(after! org
  (setq org-agenda-files '("/Users/sawyer/Library/Mobile Documents/com~apple~CloudDocs/notes")
        org-hide-emphasis-markers t
        org-hide-block-startup nil
        org-hide-leading-stars t
        org-hide-macro-markers t
        org-pretty-entities t
        org-directory "/Users/sawyer/Library/Mobile Documents/com~apple~CloudDocs/notes"
        )
  )

(use-package! org-pandoc-import
  :after org)

(when-let (dims (doom-store-get 'last-frame-size))
  (cl-destructuring-bind ((left . top) width height fullscreen) dims
    (setq initial-frame-alist
          (append initial-frame-alist
                  `((left . ,left)
                    (top . ,top)
                    (width . ,width)
                    (height . ,height)
                    (fullscreen . ,fullscreen))))))

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

(add-hook! makefile-mode #'+word-wrap-mode)

(after! (lsp-mode docker-tramp ccls)
 (lsp-register-client
  (make-lsp-client
   ;; :new-connection (lsp-stdio-connection (lambda () (cons ccls-executable ccls-args)))
   :new-connection (lsp-tramp-connection (lambda () (cons ccls-executable ccls-args)))
   :remote? t
   :major-modes '(cpp-mode c-mode c++-mode cuda-mode objc-mode)
   :server-id 'ccls
   :multi-root nil
   :notification-handlers
   (lsp-ht ("$ccls/publishSkippedRanges" #'ccls--publish-skipped-ranges)
           ("$ccls/publishSemanticHighlight" #'ccls--publish-semantic-highlight))
   :initialization-options (lambda () ccls-initialization-options)
   :library-folders-fn ccls-library-folders-fn))
  (setq ccls-initialization-options '(:index (:comments 2) :completion (:detailedLabel t))))

;; (add-hook! ccls #'tree-sitter-mode)

(add-hook! protobuf-mode #'display-line-numbers--turn-on)
(put 'flycheck-protoc-import-path 'safe-local-variable #'listp)

(after! (yaml-mode lsp-mode)
    (setq lsp-yaml-format-enable nil)
    ;; (setq lsp-yaml-prose-wrap nil)
    ;; (setq lsp-yaml-print-width nil)
    ;; (setq lsp-yaml-bracket-spacing nil)
    ;; (setq lsp-yamlls-after-open-hook nil)
    (setq lsp-yaml-completion nil)
    (setq lsp-yaml-validate nil)
    ;; (setq lsp-yaml--schema-store-schemas-alist nil)
    ;; (setq lsp-yaml-single-quote nil)
    ;; (setq lsp-yaml-schema-store-enable nil)
    ;; (setq lsp-yaml-schemas nil)
    ;; (setq lsp-yaml-schema-store-local-db nil)
    (setq lsp-yaml--built-in-kubernetes-schema nil)
    ;; (setq lsp-yaml-server-command nil)
    ;; (setq lsp-yaml-schema-store-uri nil)
    ;; (setq lsp-yaml-hover nil)
    ;; (setq lsp-yaml-custom-tags nil)
    )
(add-hook! yaml-mode-hook +format-with-lsp nil)

(after! org-pandoc-import
  ;; automatically convert markdown to org (and back) on-the-fly
  (org-pandoc-import-transient-mode 1)
  )

(after! magit
  (setq auto-revert-interval 30)
  (setq auto-revert-check-vc-info t))
(add-hook! magit (lambda () (magit-delta-mode +1)))
;; (use-package! makefile-executor
;;   :defer
;;   :config
;;   ;; ".PHONY: emacs--makefile--list\n
;;   ;; emacs--makefile--list:
;;   ;; @$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ \"^[#.]\") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'\n"
;;   (setq-default makefile-executor-list-target-code)
;;   )

(add-hook! nim-mode #'+word-wrap-mode)

(add-hook! (prog-mode text-mode org-mode haskell-cabal-mode)
  (pixel-scroll-precision-mode 1))

(add-hook! org #'org-pretty-table-mode)
(add-hook! org #'org-ol-tree)
(add-hook! org #'org)

(after! vterm
  (setq vterm-always-compile-module t)
  (setq vterm-kill-buffer-on-exit t)
  )

(add-hook! ocaml-mode #'lsp)

(use-package! orderless
  :config
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(add-hook! conf-toml-mode #'lsp)

;; Configure directory extension.
;; (use-package! vertico-buffer
;;   :after vertico
;;   :ensure nil
;;   ;; ;; More convenient directory navigation commands
;;   ;; :bind (:map vertico-map
;;   ;;        ("RET" . vertico-directory-enter)
;;   ;;        ("DEL" . vertico-directory-delete-char)
;;   ;;        ("M-DEL" . vertico-directory-delete-word))
;;   ;; ;; Tidy shadowed file names
;;   ;; :hook (rfn-eshadow-update-overlay . vertico-directory-tidy)
;;   :config
;;   (setq vertico-buffer-display-action
;;         '(display-buffer-in-side-window
;;           (window-height . 12)
;;           (side . top)))
;;   (defun my-vertico-buffer-setup ()
;;     (dolist (win (get-buffer-window-list))
;;       (set-window-parameter win 'my-mini-window (window-minibuffer-p win)))
;;     (face-remap-add-relative 'default '(:filtered (:window my-mini-window nil) (:background "gray98")))
;;     (face-remap-add-relative 'fringe '(:filtered (:window my-mini-window nil) (:background "gray90")))
;;     (face-remap-add-relative 'mode-line-active :height 1.0 :box nil :background "white" :overline "gray90")
;;     (face-remap-add-relative 'mode-line-inactive :height 1.0 :box nil :background "white" :overline "gray90")
;;     (face-remap-add-relative 'header-line :height 1 :box nil :background "white" :underline "gray90")
;;     (setq-local
;;      left-fringe-width 1
;;      right-fringe-width 1
;;      left-margin-width 1
;;      right-margin-width 1
;;      fringes-outside-margins t
;;      mode-line-format ""
;;      header-line-format "")
;;     (dolist (win (get-buffer-window-list))
;;       (set-window-buffer win (current-buffer))))
;;   (advice-add #'vertico-buffer--setup :after #'my-vertico-buffer-setup)
;;   )

;; centaur tabs
(use-package! centaur-tabs
  :defer
  :config
  (centaur-tabs-mode t)
  (setq
   centaur-tabs--buffer-show-groups t
   centaur-tabs-style "alternate"
   ;; centaur-tabs-style "bar"
   ;; centaur-tabs-style "box"
   ;; centaur-tabs-style "chamfer"
   ;; centaur-tabs-style "rounded"
   ;; centaur-tabs-style "slant"
   ;; centaur-tabs-style "wave"
   ;; centaur-tabs-style "zigzag"
   centaur-tabs-height 32
   centaur-tabs-set-icons t
   centaur-tabs-gray-out-icons 'buffer
   centaur-tabs-set-bar 'over
   )
  (centaur-tabs-headline-match)
  (centaur-tabs-group-by-projectile-project)
  ;; :bind
  ;; ("C-<prior>" . centaur-tabs-backward)
  ;; ("C-<next>" . centaur-tabs-forward)
  )
