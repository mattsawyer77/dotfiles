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

(map! :after zoom
      :desc "toggle Zoom"
      :n "SPC t z" #'zoom-mode)

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

(map! :after org
      :map org-mode-map
      :nv "SPC m -" #'org-cycle-list-bullet
      :i "TAB" #'evil-org->
      :i "S-TAB" #'evil-org-<
      :i "RET" #'evil-org-return)

(map! :after evil-embrace
      :v "v" #'er/expand-region
      :v "V" #'er/contract-region)

(map! :after ponylang-mode
      :map ponylang-mode-map
      :nv "SPC m" #'ponylang-menu)
