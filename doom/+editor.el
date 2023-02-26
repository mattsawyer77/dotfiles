;;;  -*- lexical-binding: t; -*-

(setq read-process-output-max (* 4 1024 1024)) ;; 4MB
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
(setq-default sh-basic-offset 2)

(when (and (display-graphic-p) IS-MAC)
  (setq doom-modeline-icon t)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  )

;; (after! doom-nano-modeline
;;   (doom-nano-modeline-mode 1)
;;   (global-hide-mode-line-mode 1))

;; make kops edit automatically use yaml mode
(add-to-list 'auto-mode-alist '("\\kops-edit.+yaml$" . yaml-ts-mode))
(add-to-list 'auto-mode-alist '("\\ya?ml\.tmpl$" . yaml-ts-mode))
;; make k8s templates automatically use go template mode
(add-to-list 'auto-mode-alist '("\\k8s\/templates" . go-template-mode))
(add-to-list 'auto-mode-alist '("\\kubernetes\/templates" . go-template-mode))
(add-to-list 'auto-mode-alist '("\\deploy\/k8s.+.tmpl" . go-template-mode))
;; make stack files use yaml mode
(add-to-list 'auto-mode-alist '("\\stack.yaml" . yaml-ts-mode))
(add-to-list 'auto-mode-alist '("\\package.yaml" . yaml-ts-mode))
(add-to-list 'auto-mode-alist '("\\\.aws/*" . toml-ts-mode))
(add-to-list 'auto-mode-alist '("\\\.saml2aws" . toml-ts-mode))
(add-to-list 'auto-mode-alist '("\\\.kube/config.*" . yaml-ts-mode))
(add-to-list 'auto-mode-alist '("\\\.hpp$" . c++-ts-mode))
(add-to-list 'auto-mode-alist '("\\\.h$" . c++-ts-mode))
;; make SSH authorized keys files more readable
(add-to-list 'auto-mode-alist '("\\SConscript". python-mode))
(add-to-list 'auto-mode-alist '("\\SConstruct". python-mode))
(add-to-list 'auto-mode-alist '("\\go\.mod". go-mode))
;; use GNU Makefile mode instead of BSD
(add-to-list 'auto-mode-alist '("\\Makefile" . makefile-gmake-mode))

;; disable format-on-save for yaml-mode
;; NOTE: +format-on-save-enabled-modes is a strange variable:
;; if the list starts with 'not, then it's an exclusion list;
;; if the list does not start with 'not, then it's an inclusion list
(if
    (eq (car +format-on-save-enabled-modes) 'not)
    (progn
      ;; list is exclusion -- add yaml-mode, et. al. to the list
      (setq +format-on-save-enabled-modes (add-to-list '+format-on-save-enabled-modes 'conf-toml-mode t))
      (setq +format-on-save-enabled-modes (add-to-list '+format-on-save-enabled-modes 'toml-ts-mode t))
      (setq +format-on-save-enabled-modes (add-to-list '+format-on-save-enabled-modes 'yaml-mode t))
      (setq +format-on-save-enabled-modes (add-to-list '+format-on-save-enabled-modes 'yaml-ts-mode t))
      (setq +format-on-save-enabled-modes (add-to-list '+format-on-save-enabled-modes 'cpp-mode t))
      (setq +format-on-save-enabled-modes (add-to-list '+format-on-save-enabled-modes 'c++-ts-mode t))
      (setq +format-on-save-enabled-modes (add-to-list '+format-on-save-enabled-modes 'c++-mode t))
      (setq +format-on-save-enabled-modes (add-to-list '+format-on-save-enabled-modes 'protobuf-mode t))
      (setq +format-on-save-enabled-modes (add-to-list '+format-on-save-enabled-modes 'shell-script-mode t))
      (setq +format-on-save-enabled-modes (add-to-list '+format-on-save-enabled-modes 'bash-ts-mode t))
      )
  (progn
    ;; list is inclusion -- remove yaml-mode, et. al. from the list
    (setq +format-on-save-enabled-modes (delete 'conf-toml-mode +format-on-save-enabled-modes))
    (setq +format-on-save-enabled-modes (delete 'toml-ts-mode +format-on-save-enabled-modes))
    (setq +format-on-save-enabled-modes (delete 'yaml-mode +format-on-save-enabled-modes))
    (setq +format-on-save-enabled-modes (delete 'yaml-ts-mode +format-on-save-enabled-modes))
    (setq +format-on-save-enabled-modes (delete 'cpp-mode +format-on-save-enabled-modes))
    (setq +format-on-save-enabled-modes (delete 'c++-ts-mode +format-on-save-enabled-modes))
    (setq +format-on-save-enabled-modes (delete 'c++-mode +format-on-save-enabled-modes))
    (setq +format-on-save-enabled-modes (delete 'protobuf-mode +format-on-save-enabled-modes))
    (setq +format-on-save-enabled-modes (delete 'shell-script-mode +format-on-save-enabled-modes))
    (setq +format-on-save-enabled-modes (delete 'bash-ts-mode +format-on-save-enabled-modes))
    )
  )

(after! ws-butler
  ;; prevent ws-butler mode for makefile-mode
  (setq ws-butler-global-exempt-modes (add-to-list 'ws-butler-global-exempt-modes 'makefile-mode t))
  (setq ws-butler-global-exempt-modes (add-to-list 'ws-butler-global-exempt-modes 'makefile-gmake-mode t))
  (setq ws-butler-global-exempt-modes (add-to-list 'ws-butler-global-exempt-modes 'makefile-bsdmake-mode t)))

;; use tree-sitter for syntax highlighting
;; (unless EMACS29+
(after! tree-sitter
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  ;; (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
  ;; (setq-default tree-sitter-hl-use-font-lock-keywords nil)
  (add-hook! go-mode
    (setq-local tree-sitter-hl-use-font-lock-keywords t)
    ;; (add-function :before-while (local 'tree-sitter-hl-face-mapping-function)
    ;;               (lambda (capture-name)
    ;;                 (string= capture-name "type"))
    )
  )
;;)

;; (when EMACS29+
;; (after! treesit-auto
;;  (global-treesit-auto-mode 1)
;; )
  ;; )

(after! rustic
  (setq rustic-lsp-server 'rust-analyzer
        rustic-format-on-save t
        lsp-rust-server 'rust-analyzer
        lsp-rust-analyzer-display-chaining-hints t
        lsp-rust-analyzer-display-parameter-hints t
        lsp-rust-analyzer-server-display-inlay-hints t
        ;; lsp-rust-analyzer-cargo-watch-command "clippy"
        )
  )

;; XXX: not working
;; (after! dap-mode
;;   (add-hook! 'dap-stopped-hook
;;             (lambda (arg) (call-interactively #'dap-hydra)))
;;   )

;; (after! (go-mode lsp-mode)
  ;; (require 'dap-go)
  ;; (dap-go-setup)
  ;; (setq flycheck-golangci-lint-fast t)
  ;; )

(add-hook! conf-toml-mode #'lsp)
(add-hook! toml-ts-mode #'lsp)

(add-hook! emacs-lisp-mode #'+word-wrap-mode)
(add-hook! emacs-lisp-mode #'rainbow-delimiters-mode-enable)
(add-hook! emacs-lisp-mode #'rainbow-mode)
(add-hook! emacs-lisp-mode #'flycheck-mode)

(add-hook! (go-mode go-ts-mode)
  (lsp)
  (+word-wrap-mode 1))
(add-hook! go-ts-mode
  (setq go-ts-mode-indent-offset 2))

;; override LSP's default diagnostic checker and use golangci-lint instead
;; (add-hook! lsp-diagnostics-mode
;;   (when (eq major-mode 'go-mode)
;;     ;; too slow, keep LSP as the default checker for now
;;     ;; (lsp-diagnostics-flycheck-disable)
;;     ;; (flycheck-golangci-lint-setup)
;;     (map! :mode go-mode
;;           :map general-override-mode-map
;;           :rnv "SPC c x" #'flycheck-list-errors
;;           )))

(after! display-line-numbers
  (add-hook! (prog-mode go-template-mode)
    (turn-on-visual-line-mode)
    (display-line-numbers-mode)
    )
  )

(when (fboundp 'pixel-scroll-precision-mode)
  (add-hook! (prog-mode go-template-mode)
    (pixel-scroll-precision-mode 1)
    ))

(after! undo-tree
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/.local/undo")))
  (global-undo-tree-mode 1))

(after! evil-surround
  (global-evil-surround-mode 1))

(after! projectile
  (setq projectile-project-search-path '("~/workspaces"
                                         "~/workspaces/volterra/ves.io")))

(after! persp
  (setq uniquify-buffer-name-style 'forward))

(after! treemacs
  (treemacs-follow-mode 1)
  (treemacs-project-follow-mode 1)
  (treemacs-git-mode 'deferred)
  (setq-default treemacs--width-is-locked nil)
  )

(after! company
  (global-company-mode)
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t))

(after! company-lsp
  (push 'company-lsp company-backends))

(after! flycheck
  (setq flycheck-indication-mode 'left-fringe)
  (setq-default flycheck-relevant-error-other-file-show nil)
  ;; make flycheck window auto-resize (with a max height of 15 lines)
  (defadvice flycheck-error-list-refresh (around shrink-error-list activate)
    ad-do-it
    (-when-let (window (flycheck-get-error-list-window t))
      (with-selected-window window
        (fit-window-to-buffer window 15))))
  ;; make flycheck columns wider than their absurd defaults
  (add-hook! flycheck-error-list-mode
    (setq-local tabulated-list-format
                '[("File" 30)
                  ("Line" 5 flycheck-error-list-entry-< :right-align t)
                  ("Col" 3 nil :right-align t)
                  ("Level" 8 flycheck-error-list-entry-level-<)
                  ("ID" 12 t)
                  (#("Message (Checker)" 0 7
                     (face flycheck-error-list-error-message)
                     9 16
                     (face flycheck-error-list-checker-name))
                   0 t)])))
;; (after! flycheck
;;   (add-hook! prog-mode (flycheck-mode 1)))

;; (after! (flycheck-posframe lsp-ui)
;;   (flycheck-posframe-configure-pretty-defaults)
;;   (add-hook! prog-mode
;;     (unless (-contains? local-minor-modes 'lsp-ui-mode)
;;         (flycheck-posframe-mode 1)
;;         )
;;     )
;;   (add-hook! evil-insert-state-entry
;;     (unless (-contains? local-minor-modes 'lsp-ui-mode)
;;       (flycheck-posframe-mode -1)))
;;   (add-hook! evil-insert-state-exit
;;     (unless (-contains? local-minor-modes 'lsp-ui-mode)
;;       (flycheck-posframe-mode 1))
;;     )
;;   )
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


(add-hook! rustic-mode #'tree-sitter-mode)
(add-hook! (rustic-mode rust-ts-mode)
           (lsp)
           ;; (lsp-toggle-signature-auto-activate)
           (+word-wrap-mode)
           (flycheck-posframe-mode -1)
           (flycheck-mode -1)
           (tree-sitter-hl-mode 1)
           )
(add-hook! lsp-ui-mode
  (when (or (eq major-mode 'rustic-mode) (eq major-mode 'rust-ts-mode))
    (lsp-rust-analyzer-inlay-hints-mode 1)))

(after! highlight-indent-guides
  (setq highlight-indent-guides-method 'fill)
  (setq highlight-indent-guides-auto-enabled nil)
  (add-hook!
    (emacs-lisp-mode
     haskell-mode
     json-mode
     json-ts-mode
     makefile-mode
     makefile-gmake-mode
     makefile-bsdmake-mode
     ponylang-mode
     conf-toml-mode
     toml-ts-mode
     yaml-mode yaml-ts-mode)
    #'highlight-indent-guides-mode)
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

;; (add-hook! terraform-mode
;;   (lsp)
;;   (terraform-format-on-save-mode)
;;   )

(add-hook! js2-mode
  (prettier-js-mode)
  )

(after! js2-mode
  (setq-default js2-basic-offset 2)
  )


(after! (lsp-mode lsp-ui)
  (setq lsp-response-timeout 30)
  (setq lsp-file-watch-ignored-directories
        ;; NOTE: [/\\\\]  is a custom token defined by lsp-mode to represent a path separator
        ;;   and [^/\\\\] is a custom token defined by lsp-mode to represent a non-path-separator
        ;;   and \\ is something I don't understand but it causes lsp to break if followed by an underscore
        (cl-union lsp-file-watch-ignored-directories
                  '("[/\\\\]\.cache[/\\\\]?"
                    "[/\\\\]extschema[/\\\\]?"
                    "[/\\\\]_extschema[/\\\\]?"
                    "[/\\\\]_protoschema[/\\\\]?"
                    "pbvesenv"
                    "pbts"
                    "pbswagger"
                    "pbsnippet"
                    "pbplantuml"
                    "pbgo"
                    "pbcpp"
                    "vendor"
                    "[/\\\\]target[/\\\\]?"
                    "\.vscode"
                    "\.direnv"
                    ))
        )
  (setq lsp-modeline-diagnostics-scope :file)
  (setq lsp-file-watch-threshold 8000)
  (setq lsp-headerline-breadcrumb-enable 't)
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project symbols))
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-ui-doc-enable 't)
  (setq lsp-ui-doc-position 'at-point)
  (setq lsp-ui-doc-border (doom-lighten 'bg 0.1))
  (add-to-list 'lsp-ui-doc-frame-parameters '(internal-border-width . 8))
  (setq lsp-ui-doc-show-with-cursor nil)
  (setq lsp-ui-doc-show-with-mouse t)
  (setq lsp-lens-enable t)
  ;; 'above-line causes C-e to snag
  ;; (setq lsp-lens-place-position 'end-of-line)
  (setq lsp-headerline-breadcrumb-enable t)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-ui-sideline-show-code-actions nil)
  (setq lsp-ui-sideline-show-diagnostics nil)
  (setq lsp-modeline-code-actions-enable t)
  ;; 9. Sideline diagnostics * disable whole sideline via
  (setq lsp-modeline-diagnostics-enable t)
  (setq lsp-signature-auto-activate t) ;; you could manually request them via `lsp-signature-activate`
  (setq lsp-signature-render-documentation t)
  (setq lsp-completion-show-detail t)
  (setq lsp-completion-show-kind t)
  ;; fix for https://github.com/emacs-lsp/lsp-mode/issues/2701
  (setq lsp-enable-links nil)
  ;; (setq lsp-diagnostics-provider :flymake)
  ;; (setq lsp-diagnostics-provider :flycheck)
  (setq lsp-rust-analyzer-server-display-inlay-hints t)
)

(after! org
  (cond ((equal (system-name) "SEA-ML-00059144")
         (setq org-agenda-files '("/Users/sawyer/Documents/OneDrive - F5 Networks/notes")))
        ((equal (system-name) "KD21QWDKW7")
         (setq org-agenda-files '("/Users/m.sawyer/Library/CloudStorage/OneDrive-F5,Inc/notes")))
        (t
         (setq org-agenda-files '("/Users/sawyer/Library/Mobile Documents/com~apple~CloudDocs/notes"))))
  (setq
        org-hide-emphasis-markers t
        org-hide-block-startup nil
        org-hide-leading-stars t
        org-hide-macro-markers t
        org-auto-align-tags nil
        org-tags-column 0
        org-catch-invisible-edits 'show-and-error
        org-special-ctrl-a/e t
        org-insert-heading-respect-content t

        ;; Org styling, hide markup etc.
        org-pretty-entities t
        org-ellipsis "…"

        ;; Agenda styling
        org-agenda-block-separator ?─
        org-agenda-time-grid
        '((daily today require-timed)
          (800 1000 1200 1400 1600 1800 2000)
          " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
        org-agenda-current-time-string
        "⭠ now ─────────────────────────────────────────────────")
  )

;; (when-let (dims (doom-store-get 'last-frame-size))
;;   (cl-destructuring-bind ((left . top) width height fullscreen) dims
;;     (setq initial-frame-alist
;;           (append initial-frame-alist
;;                   `((left . ,left)
;;                     (top . ,top)
;;                     (width . ,width)
;;                     (height . ,height)
;;                     (fullscreen . ,fullscreen))))))

;; (defun save-frame-dimensions ()
;;   (doom-store-put 'last-frame-size
;;                   (list (frame-position)
;;                         (frame-width)
;;                         (frame-height)
;;                         (frame-parameter nil 'fullscreen))))

;; (add-hook 'kill-emacs-hook #'save-frame-dimensions)

;; (add-hook! ponylang-mode
;;   (setq create-lockfiles nil)
;;   (require 'flycheck-pony)
;;   (require 'pony-snippets)
;;   (flycheck-select-checker 'pony)
;;   (whitespace-mode -1)
;;   )

(add-hook! makefile-mode #'+word-wrap-mode)

(after! (lsp-mode tramp ccls)
 (lsp-register-client
  (make-lsp-client
   ;; :new-connection (lsp-stdio-connection (lambda () (cons ccls-executable ccls-args)))
   :new-connection (lsp-tramp-connection (lambda () (cons ccls-executable ccls-args)))
   :remote? t
   :major-modes '(c++-ts-mode cpp-mode c-mode c++-mode cuda-mode objc-mode)
   :server-id 'ccls
   :multi-root nil
   :notification-handlers
   (lsp-ht ("$ccls/publishSkippedRanges" #'ccls--publish-skipped-ranges)
           ("$ccls/publishSemanticHighlight" #'ccls--publish-semantic-highlight))
   :initialization-options (lambda () ccls-initialization-options)
   :library-folders-fn ccls-library-folders-fn))
  (setq ccls-initialization-options '(:index (:comments 2) :completion (:detailedLabel t))))


(after! ccls
  (setq ccls-initialization-options '(:index (:comments 2) :completion (:detailedLabel t)))
  (set-lsp-priority! 'ccls 2)) ; optional as ccls is the default in Doom
(add-hook! ccls #'tree-sitter-mode)

(add-hook! protobuf-mode #'display-line-numbers-mode)
(add-hook! protobuf-mode #'flycheck-mode)
(put 'flycheck-protoc-import-path 'safe-local-variable #'listp)

;; (after! (yaml-mode lsp-mode)
;;     (setq lsp-yaml-format-enable nil)
;;     ;; (setq lsp-yaml-prose-wrap nil)
;;     ;; (setq lsp-yaml-print-width nil)
;;     ;; (setq lsp-yaml-bracket-spacing nil)
;;     ;; (setq lsp-yamlls-after-open-hook nil)
;;     (setq lsp-yaml-completion nil)
;;     (setq lsp-yaml-validate nil)
;;     ;; (setq lsp-yaml--schema-store-schemas-alist nil)
;;     ;; (setq lsp-yaml-single-quote nil)
;;     ;; (setq lsp-yaml-schema-store-enable nil)
;;     ;; (setq lsp-yaml-schemas nil)
;;     ;; (setq lsp-yaml-schema-store-local-db nil)
;;     (setq lsp-yaml--built-in-kubernetes-schema nil)
;;     ;; (setq lsp-yaml-server-command nil)
;;     ;; (setq lsp-yaml-schema-store-uri nil)
;;     ;; (setq lsp-yaml-hover nil)
;;     ;; (setq lsp-yaml-custom-tags nil)
;;     )
(add-hook! (yaml-mode yaml-ts-mode) (+lsp-optimization-mode -1))

(after! org-pandoc-import
  ;; automatically convert markdown to org (and back) on-the-fly
  (org-pandoc-import-transient-mode 1)
  )

(after! magit
  (setq auto-revert-check-vc-info t)
  (setq auto-revert-interval 30)
  (setq magit-refresh-status-buffer nil)
  (setq magit-diff-highlight-indentation nil)
  (setq magit-diff-highlight-trailing nil)
  (setq magit-diff-paint-whitespace nil)
  (setq magit-diff-highlight-hunk-body nil)
  (setq magit-diff-refine-hunk nil)
  (setq-default git-commit-summary-max-length 100)
  (setq git-commit-summary-max-length 100)
  ;; (remove-hook 'magit-status-sections-hook 'magit-insert-tags-header)
  ;; (remove-hook 'magit-status-sections-hook 'magit-insert-unpushed-to-pushremote)
  ;; (remove-hook 'magit-status-sections-hook 'magit-insert-unpulled-from-pushremote)
  ;; (remove-hook 'magit-status-sections-hook 'magit-insert-unpulled-from-upstream)
  ;; (remove-hook 'magit-status-sections-hook 'magit-insert-unpushed-to-upstream-or-recent)
  ;; (remove-hook 'magit-status-sections-hook 'magit-insert-status-headers)
  )
;; (add-hook! magit (lambda () (magit-delta-mode +1)))

;; (use-package! makefile-executor
;;   :defer
;;   :config
;;   ;; ".PHONY: emacs--makefile--list\n
;;   ;; emacs--makefile--list:
;;   ;; @$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ \"^[#.]\") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'\n"
;;   (setq-default makefile-executor-list-target-code)
;;   )

;; (use-package! vertico-posframe
;;   :config
;;   (setq vertico-posframe-min-height 20)
;;   (vertico-posframe-mode 1))

(after! nim-mode #'lsp)

(add-hook! rfc-mode-hook #'page-break-lines-mode)
(add-hook! rfc-mode-hook #'writeroom-mode)
;; (add-hook! magit-mode
;;   (magit-delta-mode 1)
;;   )

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

(set-popup-rule! "^\\*doom:vterm.*"
  :side 'right
  :slot 5
  :vslot 5
  :size 0.40
  :select t
  :quit t
  :autosave t)

;; necessary after https://github.com/Alexander-Miller/treemacs/pull/971
;; hopefully doom will fix this in the treemacs module
(set-popup-rule! "^ \\*Treemacs"
  :side 'left
  :window-width 40)

;; centaur tabs
(after! centaur-tabs
  (setq
   centaur-tabs--buffer-show-groups t
   ;; centaur-tabs-style "alternate"
   ;; centaur-tabs-style "bar"
   centaur-tabs-style "box"
   ;; centaur-tabs-style "chamfer"
   ;; centaur-tabs-style "rounded"
   ;; centaur-tabs-style "slant"
   ;; centaur-tabs-style "wave"
   ;; centaur-tabs-style "zigzag"
   centaur-tabs-height 32
   centaur-tabs-set-icons nil
   centaur-tabs-gray-out-icons 'buffer
   centaur-tabs-set-bar nil
   ;centaur-tabs-set-bar 'over
   )
  (centaur-tabs-group-by-projectile-project)
  (defun centaur-tabs-hide-tab (x)
    "Do not show buffer X in tabs."
    (let ((name (format "%s" x)))
      (or
       ;; Current window is not dedicated window.
       (window-dedicated-p (selected-window))

       ;; Buffer name not match below blacklist.
       (string-prefix-p " *" name)
       (string-prefix-p "*" name)

       ;; don't show in org-mode
       (string-suffix-p ".org" name)

       ;; Is not magit buffer.
       ;; (and (string-prefix-p "magit" name)
       ;;      (not (file-name-extension name)))
       )))
  )

(add-hook! after-init #'centaur-tabs-mode)

;; XXX: the following runs but something else re-enables ws-butler...
(add-hook! makefile-mode
  (message "in makefile-mode hook")
  (indent-tabs-mode 1)
  (ws-butler-mode -1)
  (message "ws-butler should be disabled...")
  (if (-contains? local-minor-modes 'ws-butler-mode)
      (message "dammit...ws-butler is still active")
    (message "hooray...ws-butler is dead")
    )
  )
;; (add-hook! makefile-bsdmake-mode
;;            (message "in makefile-bsdmake-mode hook")
;;            (indent-tabs-mode 1)
;;            (ws-butler-mode -1)
;;            )
;; (add-hook! makefile-gmake-mode
;;            (message "in makefile-gmake-mode hook")
;;            (indent-tabs-mode 1)
;;            (ws-butler-mode -1)
;;            )
