;;;  -*- lexical-binding: t; -*-

(map! "<mouse-4>" 'up-slightly)
(map! "<mouse-5>" 'down-slightly)
(define-key evil-normal-state-map (kbd "SPC v l") 'visual-line-mode)

(use-package! display-line-numbers
  :defer
  :config
  (define-key evil-normal-state-map (kbd "SPC l n") 'display-line-numbers-mode)
  )

(use-package! transpose-frame
  :defer
  :config
  (map! "<f4>" 'transpose-frame)
  )

(use-package! counsel
  :defer
  :config
  (map! "C-s" 'swiper)
  (map! "C-<tab>" 'counsel-fzf)
  )

(use-package! ivy
  :defer
  :config
  (define-key evil-normal-state-map (kbd "SPC b i") 'ivy-switch-buffer)
  )

(use-package! iedit
  :defer
  :config
  (map! "C-;" 'iedit-mode)
  )

(use-package! default-text-scale
  :defer
  :config
  (map! "s--" 'default-text-scale-decrease)
  (map! "s-+" 'default-text-scale-increase)
  (map! "s-0" 'default-text-scale-reset)
  )

(use-package! treemacs
  :defer
  :config
  (define-key treemacs-mode-map (kbd "o p") (lambda () (interactive) (treemacs-visit-node-no-split t)))
  )

(use-package! flycheck
  :defer
  :config
  (define-key evil-normal-state-map (kbd "SPC e n") 'flycheck-next-error)
  (define-key evil-normal-state-map (kbd "SPC e n") 'flycheck-next-error)
  (define-key evil-normal-state-map (kbd "SPC e p") 'flycheck-previous-error)
  (define-key evil-normal-state-map (kbd "SPC e v") 'flycheck-verify-setup)
  )

(use-package! golden-ratio
  :defer
  :config
  (define-key evil-normal-state-map (kbd "SPC t g") 'golden-ratio-toggle-widescreen)
  )

(use-package! vmd
  :defer
  :config
  (evil-define-key evil-normal-state-map markdown-mode-map (kbd "SPC m b") 'vmd-mode)
  )
