;;;  -*- lexical-binding: t; -*-

;; TODO: split this out into other files
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'js2-mode-hook 'display-line-numbers-mode)
(add-hook 'emacs-lisp-mode-hook 'display-line-numbers-mode)
(add-hook 'yaml-mode-hook 'display-line-numbers-mode)

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
 '(treemacs-fringe-indicator-face ((t (:foreground "DarkGoldenrod2" :family "Fira Sans"))))
 '(treemacs-fringe-indicator-mode t)
 '(treemacs-git-added-face ((t (:foreground "#b5bd68" :family "Fira Sans"))))
 '(treemacs-git-conflict-face ((t (:foreground "#cc6666" :family "Fira Sans"))))
 '(treemacs-git-ignored-face ((t (:inherit font-lock-comment-face :family "Fira Sans"))))
 '(treemacs-git-mode 'deferred)
 '(treemacs-git-modified-face ((t (:foreground "#b294bb" :family "Fira Sans"))))
 '(treemacs-git-unmodified-face ((t (:foreground "#b294bb" :family "Fira Sans"))))
 '(treemacs-git-renamed-face ((t (:inherit font-lock-doc-face :family "Fira Sans"))))
 '(treemacs-git-untracked-face ((t (:inherit font-lock-doc-face :family "Fira Sans"))))
 '(treemacs-help-column-face ((t (:inherit font-lock-keyword-face :underline t :family "Fira Sans"))))
 '(treemacs-help-title-face ((t (:inherit spacemacs-transient-state-title-face :family "Fira Sans"))))
 '(treemacs-on-failure-pulse-face ((t (:background "#ab3737" :foreground "#111111" :family "Fira Sans"))))
 '(treemacs-on-success-pulse-face ((t (:background "#669966" :foreground "#111111" :family "Fira Sans"))))
 '(treemacs-root-face ((t (:inherit font-lock-string-face :weight semi-bold :height 1.0 :family "Fira Sans"))))
)
