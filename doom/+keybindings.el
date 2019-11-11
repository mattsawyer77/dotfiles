;;;  -*- lexical-binding: t; -*-

(map! "<f4>" 'transpose-frame)
(map! "<f9>" 'projectile-project-buffers-other-buffer)
(map! "C-s" 'swiper)
(map! "C-;" 'iedit-mode)
(map! "s--" 'default-text-scale-decrease)
(map! "s-+" 'default-text-scale-increase)
(map! "s-0" 'default-text-scale-reset)
(map! "<mouse-4>" 'up-slightly)
(map! "<mouse-5>" 'down-slightly)
(map! "C-<tab>" 'counsel-fzf)

(define-key evil-normal-state-map (kbd "SPC e n") 'flycheck-next-error)
(define-key evil-normal-state-map (kbd "SPC e n") 'flycheck-next-error)
(define-key evil-normal-state-map (kbd "SPC e p") 'flycheck-previous-error)
(define-key evil-normal-state-map (kbd "SPC e v") 'flycheck-verify-setup)
(define-key evil-normal-state-map (kbd "SPC t g") 'golden-ratio-toggle-widescreen)
(define-key evil-normal-state-map (kbd "SPC v l") 'visual-line-mode)
(define-key evil-normal-state-map (kbd "SPC l n") 'display-line-numbers-mode)
(define-key evil-normal-state-map (kbd "SPC m t") 'lsp-describe-thing-at-point)
(define-key treemacs-mode-map (kbd "o p") (lambda () (interactive) (treemacs-visit-node-no-split t)))
(define-key evil-normal-state-map (kbd "<f9>") 'projectile-project-buffers-other-buffer)
;; (require 'vmd)
;; (evil-define-key evil-normal-state-map markdown-mode-map (kbd "SPC m b") 'vmd-mode)
