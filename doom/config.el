;;;  -*- lexical-binding: t; -*-

;; make kops edit automatically use yaml mode
(add-to-list 'auto-mode-alist '("\\kops-edit.+yaml$" . yaml-mode))

(load! "+ui")
(load! "+keybindings")
