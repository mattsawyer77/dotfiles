;;;  -*- lexical-binding: t; -*-

;; (setq doom-theme 'doom-city-lights)
;; (setq doom-theme 'doom-tomorrow-day)
(setq doom-theme 'doom-tomorrow-night)
;; (setq doom-theme 'gruvbox)
;; (setq doom-theme 'darktooth)
;; (setq doom-theme 'base16-darktooth)
;; (setq doom-theme 'base16-grayscale-dark)
;; (setq doom-theme 'base16-grayscale-light)
;; (setq doom-theme 'base16-gruvbox-dark-hard)
;; (setq doom-theme 'base16-gruvbox-dark-pale)
;; (setq doom-theme 'base16-oceanicnext)
;; (setq doom-theme 'base16-ocean)
;; (setq doom-theme 'base16-tomorrow-night)
(setq doom-font (font-spec :family "PragmataPro Liga" :size 23))
;; (setq doom-font (font-spec :family "Monoid" :size 19))

(require 'doom-themes)
;; (load-theme 'doom-city-lights t)
(load-theme 'doom-tomorrow-night t)
(set-face-background 'font-lock-string-face (doom-lighten 'bg 0.05))
(set-face-foreground 'haskell-keyword-face "coral")
;; (set-face-foreground 'font-lock-variable-name-face (doom-color 'blue))
;; (set-face-foreground 'font-lock-type-face (doom-color 'orange))
;; (set-face-foreground 'font-lock-function-name-face (doom-color 'green))
;; (set-face-foreground 'font-lock-type-face (doom-color 'orange))

(setq confirm-kill-emacs nil)
(setq company-idle-delay 0.2
      company-minimum-prefix-length 2)

(add-hook 'prog-mode-hook 'turn-on-visual-line-mode)
(add-hook 'markdown-mode-hook 'turn-on-visual-line-mode)
(add-hook 'yaml-mode-hook 'turn-on-visual-line-mode)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

(global-company-mode)
(setq company-idle-delay 0.2)
(setq company-selection-wrap-around t)
(global-evil-surround-mode 1)
(set-default 'truncate-lines t)
(setq-default tab-width 2)

(setq doom-modeline-icon t)
(setq doom-modeline-major-mode-icon t)
;; (setq doom-modeline-persp-name t)

(require 'yasnippet)
;; optional - provides fancier overlays
(use-package lsp-ui
  :commands lsp-ui-mode)

(require 'company-lsp)
(push 'company-lsp company-backends)
;; if you use company-mode for completion (otherwise, complete-at-point works out of the box):
(use-package company-lsp
  :commands company-lsp)
;; TODO: the following feature, for some reason, creates a popup that
;; covers the entire window
;; (setq lsp-ui-doc-max-height 5)
;; (setq lsp-ui-doc-max-height 20)
(setq lsp-ui-doc-enable nil)

;; TODO: split this out into other files
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(add-hook 'js2-mode-hook 'display-line-numbers-mode)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'emacs-lisp-mode-hook 'display-line-numbers-mode)
(add-hook 'yaml-mode-hook 'display-line-numbers-mode)
(add-hook 'mustache-mode-hook 'display-line-numbers-mode)
(add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook #'lsp)
(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'evil-insert-state-entry-hook (lambda nil (flycheck-mode -1)))
(add-hook 'evil-insert-state-exit-hook (lambda nil (flycheck-mode 1)))

(setq projectile-project-search-path '("~/F5/workspaces/f5aas/"
                                       "~/F5/workspaces/f5aas/build"
                                       "~/F5/workspaces/f5aas/infra"
                                       "~/F5/workspaces/f5aas/frontend"
                                       "~/exercism/rust"
                                       "~/src/"))

(require 'treemacs)
(treemacs-follow-mode)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(treemacs-directory-face ((t (:height 0.8 :family "Fira Sans"))))
 '(treemacs-git-unmodified-face ((t (:height 0.8 :family "Fira Sans"))))
 '(treemacs-directory-collapsed-face ((t (:height 0.8 :family "Fira Sans"))))
 '(treemacs-file-face ((t (:height 0.8 :family "Fira Sans"))))
 '(treemacs-tags-face ((t (:height 0.8 :family "Fira Sans"))))
 '(treemacs-term-node-face ((t (:height 0.8 :family "Fira Sans"))))
 '(treemacs-fringe-indicator-face ((t (:family "Fira Sans" :height 0.8))))
 '(treemacs-git-added-face ((t (:family "Fira Sans" :height 0.8))))
 '(treemacs-git-conflict-face ((t (:family "Fira Sans" :height 0.8))))
 '(treemacs-git-ignored-face ((t (:inherit font-lock-comment-face :family "Fira Sans" :height 0.8))))
 '(treemacs-git-modified-face ((t (:family "Fira Sans" :height 0.8))))
 '(treemacs-git-unmodified-face ((t (:family "Fira Sans" :height 0.8))))
 '(treemacs-git-renamed-face ((t (:inherit font-lock-doc-face :family "Fira Sans" :height 0.8))))
 '(treemacs-git-untracked-face ((t (:inherit font-lock-doc-face :family "Fira Sans" :height 0.8 :color 'blue))))
;;(set-face-foreground 'treemacs-git-untracked-face (doom-color 'blue))
 '(treemacs-help-column-face ((t (:inherit font-lock-keyword-face :underline t :family "Fira Sans" :height 0.8))))
 '(treemacs-help-title-face ((t (:family "Fira Sans" :height 0.8))))
 '(treemacs-on-failure-pulse-face ((t (:family "Fira Sans" :height 0.8))))
 '(treemacs-on-success-pulse-face ((t (:family "Fira Sans" :height 0.8))))
 '(treemacs-root-face ((t (:inherit font-lock-string-face :weight semi-bold :height 1.0 :family "Fira Sans"))))
)

;; make flycheck window auto-resize (with a max height of 15 lines)
(defadvice flycheck-error-list-refresh (around shrink-error-list activate)
  ad-do-it
  (-when-let (window (flycheck-get-error-list-window t))
    (with-selected-window window
      (fit-window-to-buffer window 15))))

;; (require 'lsp)
;; (require 'lsp-haskell)
;; (setq lsp-haskell-process-path-hie "hie-wrapper")
;; (add-hook 'haskell-mode-hook #'lsp)
;; (setq haskell-mode-stylish-haskell-path "brittany")

(default-text-scale-mode 1)

;; persistent undo
(global-undo-tree-mode)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/.local/undo")))

;; exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(add-to-list 'company-lsp-filter-candidates '(gopls . nil))

;; evil-terminal-cursor-changer
(unless (display-graphic-p)
          (require 'evil-terminal-cursor-changer)
          (evil-terminal-cursor-changer-activate) ; or (etcc-on)
          )
;; enable ligatures on macOS GUI
(if (fboundp 'mac-auto-operator-composition-mode)
   (mac-auto-operator-composition-mode))
