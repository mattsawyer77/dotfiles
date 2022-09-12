;;;  -*- lexical-binding: t; -*-

(map! "<mouse-4>" 'up-slightly)
(map! "<mouse-5>" 'down-slightly)

(map! :map general-override-mode-map
      :n "C-," (lambda ()
                 (interactive)
                     (dired-other-window "~/dotfiles/doom"))
      :niv "C-s" #'save-buffer
      :n "#" #'evilnc-comment-or-uncomment-lines
      ;; tabspaces
      :n "S-<left>" #'tab-bar-switch-to-prev-tab
      :n "S-<right>" #'tab-bar-switch-to-next-tab
      :n "SPC <tab> x" #'tabspaces-kill-buffers-close-workspace
      :n "SPC <tab> <tab>" #'tabspaces-open-or-create-project-and-workspace
      )

(map! :after lsp-ui
      :mode lsp-ui-mode
      :nv "<f1>" #'lsp-ui-doc-glance)

(map! :after transpose-frame
      :nv "<f4>" #'transpose-frame)

(map! :after treemacs
      :map treemacs-mode-map
      :mode treemacs-mode
      :n "o p" (lambda ()
                 (interactive)
                 (treemacs-visit-node-no-split t)))

(map! :after flycheck
      :n "SPC e n" #'flycheck-next-error
      :n "SPC e p" #'flycheck-previous-error
      :n "SPC e v" #'flycheck-verify-setup
      :n "SPC e l" #'flycheck-list-errors)

(map! :after vmd
      :mode markdown-mode
      :n "SPC m p" #'vmd-mode)

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
      :nv "C-j" #'org-move-subtree-down
      :nv "C-k" #'org-move-subtree-up
      :i "RET" #'evil-org-return)

(map! :after evil-embrace
      :v "v" #'er/expand-region
      :v "V" #'er/contract-region)

(map! :after ponylang-mode
      :map ponylang-mode-map
      :nv "SPC m" #'ponylang-menu)

(map! :after smerge-mode
      :map smerge-mode-map
      :nv "SPC g n" #'smerge-next
      :nv "SPC g p" #'smerge-prev
      :nv "SPC g M" #'smerge-keep-mine
      :nv "SPC g m" #'smerge-keep-mine
      :nv "SPC g T" #'smerge-keep-lower
      )
