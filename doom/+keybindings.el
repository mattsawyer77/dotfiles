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

(define-key evil-normal-state-map (kbd "SPC e n") 'flycheck-next-error)
(define-key evil-normal-state-map (kbd "SPC e n") 'flycheck-next-error)
(define-key evil-normal-state-map (kbd "SPC e p") 'flycheck-previous-error)
(define-key evil-normal-state-map (kbd "SPC e v") 'flycheck-verify-setup)
(define-key evil-normal-state-map (kbd "SPC t g") 'golden-ratio-toggle-widescreen)
;; (require 'vmd)
;; (evil-define-key evil-normal-state-map markdown-mode-map (kbd "SPC m b") 'vmd-mode)
