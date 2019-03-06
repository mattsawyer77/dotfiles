;;;  -*- lexical-binding: t; -*-

(setq doom-theme 'doom-city-lights)
;; (setq doom-theme 'doom-nord)
;; (setq doom-theme 'doom-nova)
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-opera-light)
;; (setq doom-theme 'doom-opera)
;; (setq doom-theme 'doom-peacock)
;; (setq doom-theme 'doom-solarized-light)
;; (setq doom-theme 'doom-sourcerer)
;; (setq doom-theme 'doom-spacegrey)
;; (setq doom-theme 'doom-tomorrow-day)
;; (setq doom-theme 'doom-tomorrow-night)
;; (setq doom-theme 'gruvbox)
;; (setq doom-theme 'clues)
;; (setq doom-theme 'creamsody)
;; (setq doom-theme 'darktooth)
;; (setq doom-theme 'doom-vibrant)
;; (setq doom-font (font-spec :family "Input" :size 20 :weight 'regular))
;; (setq doom-font (font-spec :family "Fira Code" :size 22 :weight 'medium))
(setq doom-font (font-spec :family "PragmataPro Liga" :size 23))
;; (setq doom-font (font-spec :family "IBM Plex Mono" :size 21 :weight 'semi-bold))

(require 'doom-themes)
(load-theme 'doom-city-lights t)
(set-face-background 'font-lock-string-face (doom-lighten 'bg 0.05))
(set-face-foreground 'font-lock-variable-name-face (doom-color 'blue))
(set-face-foreground 'font-lock-type-face (doom-color 'orange))
(set-face-foreground 'font-lock-function-name-face (doom-color 'green))
(set-face-foreground 'font-lock-type-face (doom-color 'orange))

(setq company-idle-delay 0.2
      company-minimum-prefix-length 2)

(global-visual-line-mode)
(global-company-mode)
(setq company-idle-delay 0.2)
(setq company-selection-wrap-around t)
(global-evil-surround-mode 1)
(set-default 'truncate-lines t)

(setq doom-modeline-icon t)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-persp-name t)

;; TODO: split this out into other files
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'js2-mode-hook 'display-line-numbers-mode)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'emacs-lisp-mode-hook 'display-line-numbers-mode)
(add-hook 'yaml-mode-hook 'display-line-numbers-mode)
(add-hook 'mustache-mode-hook 'display-line-numbers-mode)
(add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
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
 '(treemacs-git-untracked-face ((t (:inherit font-lock-doc-face :family "Fira Sans" :height 0.8))))
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

(require 'lsp)
(require 'lsp-haskell)
(setq lsp-haskell-process-path-hie "hie-wrapper")
(add-hook 'haskell-mode-hook #'lsp)
