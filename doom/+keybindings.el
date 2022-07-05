;;;  -*- lexical-binding: t; -*-

(map! "<mouse-4>" 'up-slightly)
(map! "<mouse-5>" 'down-slightly)

;; (select-window
;;    (car (seq-filter
;;      (lambda (window)
;;        (equal name (buffer-name (window-buffer window))))
;;      (window-list-1 nil 0 t)))))

;; (unbind-key "S-," global-map)

(map! :map general-override-mode-map
      :n "C-," (lambda ()
                 (interactive)
                     (dired-other-window "~/dotfiles/doom"))
      )

(map! :after lsp-ui
      :mode lsp-ui-mode
      :nv "<f1>" #'lsp-ui-doc-glance)

(map! :after transpose-frame
      :nv "<f4>" #'transpose-frame)

;; (map! :after counsel
;;       :nv "C-s" #'swiper
;;       :n "C-<tab>" #'counsel-fzf)

;; (map! :after iedit
;;       :nv "C-;" #'iedit-mode)

(map! :after treemacs
      :map treemacs-mode-map
      :mode treemacs-mode
      :n "o p" (lambda ()
                 (interactive)
                 (treemacs-visit-node-no-split t)))

(map! :mode flycheck
      :mode flycheck-mode-map
      :localleader
      (:prefix ("e" . "errors")
       :desc "show buffer errors" "l" #'flycheck-list-errors
       :desc "go to next error" "n" #'flycheck-next-error
       :desc "go to previous error" "p" #'flycheck-previous-error
       )
      )

(map! :mode flymake
      :map flymake-mode-map
      :localleader
      (:prefix ("e" . "errors")
       :desc "show buffer errors" "l" #'flymake-show-buffer-diagnostics
       :desc "show project errors" "L" #'flymake-show-project-diagnostics
       :desc "go to next error" "n" #'flymake-goto-next-error
       :desc "go to previous error" "p" #'flymake-goto-prev-error
       )
      )

(map! :after zoom
      :desc "toggle Zoom"
      :n "SPC t z" #'zoom-mode)

(map! :after vmd
      :mode markdown-mode
      :n "SPC m p" #'vmd-mode)

(map! :after dap-mode
      :map general-override-mode-map
      :localleader
      (:prefix ("d" . "debug")
       :desc "DAP Debug" "d" #'dap-debug
       :desc "DAP Hydra" "h" #'dap-hydra
       :desc "DAP Disconnect" "Q" #'dap-disconnect
       (:prefix ("b" . "breakpoint")
        :desc "DAP Breakpoint Add" "a" #'dap-breakpoint-add
        :desc "DAP Breakpoint Delete" "d" #'dap-breakpoint-delete
        :desc "DAP Breakpoint Delete All" "D" #'dap-breakpoint-delete
        )
       )
      )
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

(map! :map general-override-mode-map
      :nv "SPC f c" #'ediff-buffers
      )

(map! :mode rfc-mode
      :map rfc-mode-map
      :g "C-f" #'rfc-mode-forward-page
      :g "C-b" #'rfc-mode-backward-page
      :g "<next>" #'rfc-mode-forward-page
      :g "<prior>" #'rfc-mode-backward-page
      )

(map! :map general-override-mode-map
      :nv "<f9>" #'sawyer--light-switch
      :nv "SPC \"" #'vertico-repeat-select
      :g "C-s" #'basic-save-buffer
      )
