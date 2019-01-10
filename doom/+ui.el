;;;  -*- lexical-binding: t; -*-

;; (setq doom-theme 'doom-city-lights)
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
(setq doom-theme 'doom-tomorrow-night)
;; (setq doom-theme 'gruvbox)
;; (setq doom-theme 'clues)
;; (setq doom-theme 'creamsody)
;; (setq doom-theme 'darktooth)
;; (setq doom-theme 'doom-vibrant)
(setq doom-font (font-spec :family "Input" :size 20 :weight 'regular))
;; (setq doom-font (font-spec :family "Fira Code" :size 22 :weight 'medium))
;; (setq doom-font (font-spec :family "PragmataPro Liga" :size 23))
;; (setq doom-font (font-spec :family "IBM Plex Mono" :size 21 :weight 'semi-bold))

(setq company-idle-delay 0.2
      company-minimum-prefix-length 2)

(global-visual-line-mode)
(global-company-mode)
(setq company-idle-delay 0.2)
(setq company-selection-wrap-around t)
(global-evil-surround-mode 1)
(set-default 'truncate-lines t)

;; TODO: split this out into other files
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'js2-mode-hook 'display-line-numbers-mode)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'emacs-lisp-mode-hook 'display-line-numbers-mode)
(add-hook 'yaml-mode-hook 'display-line-numbers-mode)
(add-hook 'mustache-mode-hook 'display-line-numbers-mode)
(add-hook 'haskell-mode-hook #'hindent-mode)
(add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)
(add-hook 'before-save-hook 'gofmt-before-save)

(setq projectile-project-search-path '("~/F5/workspaces/f5aas/"
                                       "~/F5/workspaces/f5aas/build"
                                       "~/F5/workspaces/f5aas/infra"
                                       "~/F5/workspaces/f5aas/frontend"
                                       "~/exercism/rust"
                                       "~/src/"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(treemacs-collapse-dirs 3)
 '(treemacs-directory-face ((t (:foreground "#c5c8c6" :height 0.8 :family "Fira Sans"))))
 '(treemacs-directory-collapsed-face ((t (:foreground "#c5c8c6" :height 0.8 :family "Fira Sans"))))
 '(treemacs-file-face ((t (:foreground "#c5c8c6" :height 0.8 :family "Fira Sans"))))
 '(treemacs-tags-face ((t (:foreground "#c5c8c6" :height 0.8 :family "Fira Sans"))))
 '(treemacs-term-node-face ((t (:foreground "#c5c8c6" :height 0.8 :family "Fira Sans"))))
 '(treemacs-filewatch-mode t)
 '(treemacs-follow-after-init t)
 '(treemacs-follow-mode t)
 '(treemacs-fringe-indicator-face ((t (:foreground "DarkGoldenrod2" :family "Fira Sans" :height 0.8))))
 '(treemacs-fringe-indicator-mode t)
 '(treemacs-git-added-face ((t (:foreground "#b5bd68" :family "Fira Sans" :height 0.8))))
 '(treemacs-git-conflict-face ((t (:foreground "#cc6666" :family "Fira Sans" :height 0.8))))
 '(treemacs-git-ignored-face ((t (:inherit font-lock-comment-face :family "Fira Sans" :height 0.8))))
 '(treemacs-git-mode 'deferred)
 '(treemacs-git-modified-face ((t (:foreground "#b294bb" :family "Fira Sans" :height 0.8))))
 '(treemacs-git-unmodified-face ((t (:foreground "#b294bb" :family "Fira Sans" :height 0.8))))
 '(treemacs-git-renamed-face ((t (:inherit font-lock-doc-face :family "Fira Sans" :height 0.8))))
 '(treemacs-git-untracked-face ((t (:inherit font-lock-doc-face :family "Fira Sans" :height 0.8))))
 '(treemacs-help-column-face ((t (:inherit font-lock-keyword-face :underline t :family "Fira Sans" :height 0.8))))
 '(treemacs-help-title-face ((t (:inherit spacemacs-transient-state-title-face :family "Fira Sans" :height 0.8))))
 '(treemacs-on-failure-pulse-face ((t (:background "#ab3737" :foreground "#111111" :family "Fira Sans" :height 0.8))))
 '(treemacs-on-success-pulse-face ((t (:background "#669966" :foreground "#111111" :family "Fira Sans" :height 0.8))))
 '(treemacs-root-face ((t (:inherit font-lock-string-face :weight semi-bold :height 1.0 :family "Fira Sans"))))
)

;; make flycheck window auto-resize (with a max height of 15 lines)
(defadvice flycheck-error-list-refresh (around shrink-error-list activate)
  ad-do-it
  (-when-let (window (flycheck-get-error-list-window t))
    (with-selected-window window
      (fit-window-to-buffer window 15))))
