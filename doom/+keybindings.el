;;;  -*- lexical-binding: t; -*-

(map! "<mouse-4>" 'up-slightly)
(map! "<mouse-5>" 'down-slightly)

(map! :map general-override-mode-map
      :after general-override-mode
      :g "C-s" #'basic-save-buffer
      :n "C-," (lambda ()
                 (interactive)
                     (dired-other-window "~/dotfiles/doom"))
      :nv "#" #'evilnc-comment-or-uncomment-lines
      :nv "SPC f c" #'ediff-buffers
      :nv "<f9>" #'sawyer--light-switch
      :nv "SPC \"" #'vertico-repeat-select
      ;; centaur tabs
      :niv "S-<left>" #'centaur-tabs-backward
      :niv "S-<right>" #'centaur-tabs-forward
      :niv "C-SPC" #'centaur-tabs-switch-group
      :localleader
      (:prefix ("d" . "debug")
       :desc "DAP Debug" "d" #'dap-debug
       :desc "DAP Hydra" "h" #'dap-hydra
       :desc "DAP Disconnect" "Q" #'dap-disconnect
       (:prefix ("b" . "breakpoint")
        :desc "DAP Breakpoint Add" "a" #'dap-breakpoint-add
        :desc "DAP Breakpoint Delete" "d" #'dap-breakpoint-delete
        :desc "DAP Breakpoint Delete All" "D" #'dap-breakpoint-delete
        )))

(map! :mode flycheck
      :mode flycheck-mode-map
      :localleader
      (:prefix ("e" . "errors")
       :desc "show buffer errors" "l" #'flycheck-list-errors
       :desc "go to next error" "n" #'flycheck-next-error
       :desc "go to previous error" "p" #'flycheck-previous-error
       ))

(map! :mode flymake
      :map flymake-mode-map
      :localleader
      (:prefix ("e" . "errors")
       :desc "show buffer errors" "l" #'flymake-show-buffer-diagnostics
       :desc "show project errors" "L" #'flymake-show-project-diagnostics
       :desc "go to next error" "n" #'flymake-goto-next-error
       :desc "go to previous error" "p" #'flymake-goto-prev-error
       ))

;; (map! :mode flymake
;;       :map flymake-mode-map
;;       :localleader
;;       (:prefix ("e" . "errors")
;;        :desc "show buffer errors" "l" #'flymake-show-buffer-diagnostics
;;        :desc "show project errors" "L" #'flymake-show-project-diagnostics
;;        :desc "go to next error" "n" #'flymake-goto-next-error
;;        :desc "go to previous error" "p" #'flymake-goto-prev-error
;;        ))
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

(map! :mode rfc-mode
      :map rfc-mode-map
      :g "C-f" #'rfc-mode-forward-page
      :g "C-b" #'rfc-mode-backward-page
      :g "<next>" #'rfc-mode-forward-page
      :g "<prior>" #'rfc-mode-backward-page
      )

