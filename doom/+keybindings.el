;;;  -*- lexical-binding: t; -*-

(map! "<f4>" 'transpose-frame)
(map! "<f9>" 'projectile-project-buffers-other-buffer)

(define-key evil-normal-state-map (kbd "SPC e n") 'flycheck-next-error)
(define-key evil-normal-state-map (kbd "SPC e n") 'flycheck-next-error)
(define-key evil-normal-state-map (kbd "SPC e p") 'flycheck-previous-error)
(define-key evil-normal-state-map (kbd "SPC e v") 'flycheck-verify-setup)
