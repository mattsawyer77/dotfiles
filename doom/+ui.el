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
;; (setq doom-theme 'doom-vibrant)
(setq doom-font (font-spec :family "Input" :size 21))
;; (setq doom-font (font-spec :family "Fira Code" :size 22 :weight 'medium))
;; (setq doom-font (font-spec :family "PragmataPro Liga" :size 23))
;; (setq doom-font (font-spec :family "IBM Plex Mono" :size 21 :weight 'semi-bold))

(setq company-idle-delay 0.2
      company-minimum-prefix-length 2)

;; TODO: split this out into other files
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'js2-mode-hook 'display-line-numbers-mode)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'emacs-lisp-mode-hook 'display-line-numbers-mode)
(add-hook 'yaml-mode-hook 'display-line-numbers-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(treemacs-collapse-dirs 3)
 '(treemacs-directory-face ((t (:foreground "#c5c8c6" :height 0.8 :family "Fira Sans" :weight 'medium))))
 '(treemacs-directory-collapsed-face ((t (:foreground "#c5c8c6" :height 0.8 :family "Fira Sans" :weight 'medium))))
 '(treemacs-file-face ((t (:foreground "#c5c8c6" :height 0.8 :family "Fira Sans" :weight 'medium))))
 '(treemacs-tags-face ((t (:foreground "#c5c8c6" :height 0.8 :family "Fira Sans" :weight 'medium))))
 '(treemacs-term-node-face ((t (:foreground "#c5c8c6" :height 0.8 :family "Fira Sans" :weight 'medium))))
 '(treemacs-filewatch-mode t)
 '(treemacs-follow-after-init t)
 '(treemacs-follow-mode t)
 '(treemacs-fringe-indicator-face ((t (:foreground "DarkGoldenrod2" :family "Fira Sans" :height 0.8 :weight 'medium))))
 '(treemacs-fringe-indicator-mode t)
 '(treemacs-git-added-face ((t (:foreground "#b5bd68" :family "Fira Sans" :height 0.8 :weight 'medium))))
 '(treemacs-git-conflict-face ((t (:foreground "#cc6666" :family "Fira Sans" :height 0.8 :weight 'medium))))
 '(treemacs-git-ignored-face ((t (:inherit font-lock-comment-face :family "Fira Sans" :height 0.8 :weight 'medium))))
 '(treemacs-git-mode 'deferred)
 '(treemacs-git-modified-face ((t (:foreground "#b294bb" :family "Fira Sans" :height 0.8 :weight 'medium))))
 '(treemacs-git-unmodified-face ((t (:foreground "#b294bb" :family "Fira Sans" :height 0.8 :weight 'medium))))
 '(treemacs-git-renamed-face ((t (:inherit font-lock-doc-face :family "Fira Sans" :height 0.8 :weight 'medium))))
 '(treemacs-git-untracked-face ((t (:inherit font-lock-doc-face :family "Fira Sans" :height 0.8 :weight 'medium))))
 '(treemacs-help-column-face ((t (:inherit font-lock-keyword-face :underline t :family "Fira Sans" :height 0.8 :weight 'medium))))
 '(treemacs-help-title-face ((t (:inherit spacemacs-transient-state-title-face :family "Fira Sans" :height 0.8 :weight 'medium))))
 '(treemacs-on-failure-pulse-face ((t (:background "#ab3737" :foreground "#111111" :family "Fira Sans" :height 0.8 :weight 'medium))))
 '(treemacs-on-success-pulse-face ((t (:background "#669966" :foreground "#111111" :family "Fira Sans" :height 0.8 :weight 'medium))))
 '(treemacs-root-face ((t (:inherit font-lock-string-face :weight semi-bold :height 1.0 :family "Fira Sans" :weight 'medium))))
)

(global-company-mode)
(setq company-idle-delay 0.2)
(setq company-selection-wrap-around t)

;; (cycle-themes-mode)
;; (setq cycle-themes-theme-list '())

(global-evil-surround-mode 1)

(add-hook 'haskell-mode-hook #'hindent-mode)

(add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)

(set-default 'truncate-lines t)
