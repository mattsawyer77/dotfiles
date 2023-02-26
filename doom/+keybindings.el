;;;  -*- lexical-binding: t; -*-

(map! "<mouse-4>" 'up-slightly)
(map! "<mouse-5>" 'down-slightly)

;; (map!
;;  :after tab-bar
;;  :nv "g t" nil
;;  )

;; (map!
;;  :after evil-goggles
;;   :nv "g r" nil
;;   :nv "g r" nil
;;   :nv "g i" nil
;;   :nv "g i" nil
;;  )

(map!
 :map general-override-mode-map
 :g "C-s" #'basic-save-buffer
 :n "C-," (lambda ()
            (interactive)
            (dired-other-window "~/.config/doom"))
 (:after evil-nerd-commenter
  :nv "#" #'evilnc-comment-or-uncomment-lines)
 (:after centaur-tabs
  :nv "S-<left>" #'centaur-tabs-backward
  :nv "S-<right>" #'centaur-tabs-forward
  :nv "C-SPC" #'centaur-tabs-switch-group
  :nv "C-t" #'centaur-tabs--create-new-tab
  :nv "s-{" #'centaur-tabs-backward
  :nv "s-}" #'centaur-tabs-forward
  (:leader
   (:prefix ("TAB" . "Tab")
    :desc "Switch Tab" "TAB" #'centaur-tabs-switch-group
    :desc "Close Tab" "x" #'centaur-tabs-kill-all-buffers-in-current-group
    :desc "New Tab" "n" #'centaur-tabs--create-new-tab
    )))
 (:after dap-mode
  :leader
  (:prefix ("d" . "debug")
   :desc "DAP Debug" "d" #'dap-debug
   :desc "DAP Hydra" "h" #'dap-hydra
   :desc "DAP Disconnect" "Q" #'dap-disconnect
   (:prefix ("b" . "breakpoint")
    :desc "DAP Breakpoint Add" "a" #'dap-breakpoint-add
    :desc "DAP Breakpoint Delete" "d" #'dap-breakpoint-delete
    :desc "DAP Breakpoint Delete All" "D" #'dap-breakpoint-delete
    )))
 (:after flycheck
  :leader
  (:prefix ("e" . "errors")
   :desc "go to next error" "n" #'flycheck-next-error
   :desc "go to previous error" "p" #'flycheck-previous-error
   :desc "verify Flycheck setup" "v" #'flycheck-verify-setup
   :desc "list errors" "l" #'flycheck-list-errors))
 (:leader
  (:after projectile
   :desc "Switch to last project buffer" "`" #'projectile-project-buffers-other-buffer)
  (:prefix ("f" . "file")
   :desc "Ediff buffers" "c" #'ediff-buffers)
  (:after vertico
   :leader
   :desc "Repeat last Vertico search" "\"" #'vertico-repeat-select))
)

(map! :after (evil projectile consult)
      :nv "g d" #'+lookup/definition
      :nv "g t" #'+lookup/type-definition
      :nv "g r" #'+lookup/references
      :nv "g I" #'+lookup/implementations
      :nv "g a" #'projectile-project-buffers-other-buffer
      :nv "g b" #'consult-buffer
      )

(map! :after flycheck
      (:leader
      (:prefix ("e" . "errors")
       :desc "go to next error" "n" #'flycheck-next-error
       :desc "go to previous error" "p" #'flycheck-previous-error
       :desc "verify Flycheck setup" "v" #'flycheck-verify-setup
       :desc "list errors" "l" #'flycheck-list-errors)))

(map! :after vmd
      :mode markdown-mode
      (:localleader
       :desc "VMD mode" "p" #'vmd-mode))

(map! :after rustic
      :map rustic-mode-map
      (:localleader
       (:prefix ("c" . "check")
        :desc "cargo check" "c" (cmd! (compile "cargo check"))
        )))

(map! :after org
      :map org-mode-map
      :i "TAB" #'evil-org->
      :i "S-TAB" #'evil-org-<
      :nv "C-j" #'org-move-subtree-down
      :nv "C-k" #'org-move-subtree-up
      :i "RET" #'evil-org-return
      (:localleader
       :nv "-" #'org-cycle-list-bullet))

(map! :after evil-embrace
      :v "v" #'er/expand-region
      :v "V" #'er/contract-region)

(map! :after smerge-mode
      :map smerge-mode-map
      (:leader
       (:prefix ("g" . "smerge")
        :desc "next hunk" "n" #'smerge-next
        :desc "prev hunk" "p" #'smerge-prev
        :desc "keep my version" "M" #'smerge-keep-mine
        :desc "keep my version" "m" #'smerge-keep-mine
        :desc "keep their version" "T" #'smerge-keep-lower
        )))

(map! :mode rfc-mode
      :map rfc-mode-map
      :g "C-f" #'rfc-mode-forward-page
      :g "C-b" #'rfc-mode-backward-page
      :g "<next>" #'rfc-mode-forward-page
      :g "<prior>" #'rfc-mode-backward-page
      )

