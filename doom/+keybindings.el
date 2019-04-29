;;;  -*- lexical-binding: t; -*-

(map! "<f4>" 'transpose-frame)
(map! "<f9>" 'projectile-project-buffers-other-buffer)
(map! "C-s" 'swiper)
(map! "C-;" 'iedit-mode)
(map! "s--" 'default-text-scale-decrease)
(map! "s-+" 'default-text-scale-increase)
(map! "s-0" 'default-text-scale-reset)

(define-key evil-normal-state-map (kbd "SPC e n") 'flycheck-next-error)
(define-key evil-normal-state-map (kbd "SPC e n") 'flycheck-next-error)
(define-key evil-normal-state-map (kbd "SPC e p") 'flycheck-previous-error)
(define-key evil-normal-state-map (kbd "SPC e v") 'flycheck-verify-setup)
(define-key evil-normal-state-map (kbd "SPC t g") 'golden-ratio-toggle-widescreen)

;; (define-key counsel-imenu-map (kbd "C-s-n") 'ivy-next-line-and-call)
;; (define-key counsel-imenu-map (kbd "C-s-p") 'ivy-previous-line-and-call)
