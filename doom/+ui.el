;;;  -*- lexical-binding: t; -*-
;;;
;; (setq doom-theme 'doom-one) ;; doom-themes' flagship theme, inspired by Atom's One Dark themes
;;(setq doom-theme 'doom-one-light) ;; light version of doom-one (thanks to ztlevi)
;; (setq doom-theme 'doom-vibrant) ;; a slightly more vibrant version of doom-one
(setq doom-theme 'doom-city-lights) ;; based on Atom's City lights (thanks to fuxialexander)
;; (setq doom-theme 'doom-challenger-deep) ;; based on Vim's Challenger deep theme (thanks to fuxialexander)
;; (setq doom-theme 'doom-dracula) ;; an implementation of Dracula theme (thanks to fuxialexander)
;; (setq doom-theme 'doom-gruvbox) ;; adapted from Mohretz's Gruvbox (thanks to JongW)
;;;;(setq doom-theme 'doom-Iosvkem) ;; adapted from Iosvkem (thanks to neutaaaaan)
;;(setq doom-theme 'doom-molokai) ;; based on Textmate's monokai
;;(setq doom-theme 'doom-moonlight ported from VS Code's Moonlight Theme (thanks to Brettm12345)
;;(setq doom-theme 'doom-nord) ;; dark variant of Nord (thanks to fuxialexander)
;;(setq doom-theme 'doom-nord-light) ;; light variant of Nord (thanks to fuxialexander)
;;(setq doom-theme 'doom-nova) ;; adapted from Nova (thanks to bigardone)
;;(setq doom-theme 'doom-opera) ;; a dark theme created by (thanks to jwintz)
;;(setq doom-theme 'doom-opera-light) ;; a light theme created by (thanks to jwintz)
;; (setq doom-theme 'doom-outrun-electric) ;; a neon colored theme inspired in VS Code's Outrun Electric (thanks to ema2159)
;; (setq doom-theme 'doom-palenight) ;; adapted from Material Themes (thanks to Brettm12345)
;; (setq doom-theme 'doom-peacock) ;; based on Peacock from daylerees' themes (thanks to teesloane)
;; (setq doom-theme 'doom-solarized-dark) ;; dark variant of Solarized (thanks to ema2159)
;;(setq doom-theme 'doom-solarized-light) ;; light variant of Solarized (thanks to fuxialexander)
;;(setq doom-theme 'doom-sourcerer) ;; based on Sourcerer (thanks to defphil)
;;(setq doom-theme 'doom-spacegrey) ;; I'm sure you've heard of it (thanks to teesloane)
;; (setq doom-theme 'doom-tomorrow-day) ;; Tomorrow's light variant (thanks to emacswatcher)
;;(setq doom-theme 'doom-tomorrow-night) ;; one of the dark variants of Tomorrow (thanks to emacswatcher)
;; (setq doom-theme 'doom-wilmersdorf) ;; port of Ian Pan's Wilmersdorf (thanks to ema2159)

(setq doom-font (font-spec :family "PragmataPro Liga" :size 23))
;; (setq doom-font (font-spec :family "Monoid" :size 19))

(require 'doom-themes)

(load-theme 'doom-city-lights t)
(set-face-foreground 'font-lock-variable-name-face (doom-blend 'blue 'fg 0.5))
(set-face-background 'font-lock-string-face (doom-lighten 'bg 0.05))
(set-face-foreground 'font-lock-string-face (doom-blend 'yellow 'fg 0.1))
(set-face-foreground 'default (doom-blend 'blue 'fg 0.1))
(require 'hl-line)
(set-face-background 'hl-line (doom-lighten 'bg 0.2))

;; (load-theme 'doom-tomorrow-night t)

;; (load-theme 'doom-challenger-deep)
;; (set-face-foreground 'font-lock-variable-name-face (doom-darken 'fg 0.1))
;; (set-face-foreground 'font-lock-function-name-face (doom-darken 'fg 0.1))
;; (set-face-background 'font-lock-string-face (doom-lighten 'bg 0.05))

(require 'haskell-mode)
(set-face-foreground 'haskell-keyword-face "coral")
(set-face-foreground 'haskell-pragma-face (doom-color 'red))
(set-face-background 'haskell-pragma-face (doom-darken 'bg 0.5))
(set-face-foreground 'haskell-operator-face (doom-color 'orange))
(set-face-foreground 'haskell-definition-face (doom-color 'blue))
(set-face-bold 'haskell-type-face t)
(set-face-bold 'haskell-definition-face t)

(setq confirm-kill-emacs nil)
(setq company-idle-delay 0.2
      company-minimum-prefix-length 2)
(setq-default line-spacing 5)
(setq-default mac-command-modifier 'super)

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
(setq doom-modeline-vcs-max-length 30)
(setq doom-modeline-persp-name t)

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
(setq lsp-ui-doc-enable t)

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

;(setq projectile-project-search-path '("~/F5/workspaces/f5aas/"
;                                       "~/F5/workspaces/f5aas/build"
;                                       "~/F5/workspaces/f5aas/infra"
;                                       "~/F5/workspaces/f5aas/frontend"
;                                       "~/exercism/rust"
;                                       "~/src/"))

(require 'treemacs)
(treemacs-follow-mode)
;; (treemacs-resize-icons 18)
;; (setq-default 'treemacs--icon-size 18)
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
 '(treemacs-git-modified-face ((t (:family "Fira Sans" :height 0.8 :color 'orange))))
 '(treemacs-git-unmodified-face ((t (:family "Fira Sans" :height 0.8))))
 '(treemacs-git-renamed-face ((t (:inherit font-lock-doc-face :family "Fira Sans" :height 0.8))))
 '(treemacs-git-untracked-face ((t (:inherit font-lock-doc-face :family "Fira Sans" :height 0.8 :color 'blue))))
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
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-mode-hook 'lsp-ui-mode)
(add-hook 'haskell-mode-hook 'lsp-ui-doc-mode)
;; HIE
(setq lsp-haskell-process-path-hie "hie-wrapper")

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
;; and disable "smooth" scrolling
(if (fboundp 'mac-auto-operator-composition-mode)
   (mac-auto-operator-composition-mode)
   (mac-mouse-wheel-mode 0))

(require 'haskell-mode)
(require 'ormolu)
(add-hook 'haskell-mode-hook 'ormolu-mode)
(setq ormolu-reformat-buffer-on-save t)

(require 'highlight-indent-guides)
(add-hook 'haskell-mode-hook 'highlight-indent-guides-mode)
(add-hook 'yaml-mode-hook 'highlight-indent-guides-mode)
(add-hook 'json-mode-hook 'highlight-indent-guides-mode)
(add-hook 'python-mode-hook 'highlight-indent-guides-mode)
