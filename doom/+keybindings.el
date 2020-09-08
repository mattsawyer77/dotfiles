;;;  -*- lexical-binding: t; -*-

(map! "<mouse-4>" 'up-slightly)
(map! "<mouse-5>" 'down-slightly)

(map! :after lsp-ui
      :mode lsp-ui-mode
      :nv "SPC m d" #'lsp-ui-doc-glance)

(map! :after transpose-frame
      :nv "<f4>" #'transpose-frame)

(map! :after counsel
      :nv "C-s" #'swiper
      :n "C-<tab>" #'counsel-fzf)

(map! :after ivy
      :nv "SPC b i" #'ivy-switch-buffer)

(map! :after iedit
      :nv "C-;" #'iedit-mode)

(map! :after treemacs
      :map treemacs-mode-map
      :mode treemacs-mode
      :n "o p" (lambda ()
                 (interactive)
                 (treemacs-visit-node-no-split t)))

(map! :after flycheck
      :n "SPC e n" #'flycheck-next-error
      :n "SPC e n" #'flycheck-next-error
      :n "SPC e p" #'flycheck-previous-error
      :n "SPC e v" #'flycheck-verify-setup)

(map! :after golden-ratio
      :map general-override-mode-map
      :n "SPC w g" #'golden-ratio-toggle-widescreen)

(map! :after vmd
      :mode markdown-mode
      :n "SPC m p" #'vmd-mode)

(map! :after go-mode
      :map go-mode-map
      :localleader
      (:prefix ("b" . "build")
        :desc "errcheck" "e" (cmd! (compile "errcheck -verbose"))
        :desc "lint" "l" (cmd! (compile "make lint"))
        ))

(map! :after rustic
      :map rustic-mode-map
      :localleader
      (:prefix ("c" . "check")
        :desc "cargo check" "c" (cmd! (compile "cargo check"))
        ))
