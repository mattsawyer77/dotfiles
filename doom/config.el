;;;  -*- lexical-binding: t; -*-

;; make kops edit automatically use yaml mode
(add-to-list 'auto-mode-alist '("\\kops-edit.+yaml$" . yaml-mode))
;; make helm templates automatically use mustache mode
(add-to-list 'auto-mode-alist '("\\k8s\/templates" . mustache-mode))
(add-to-list 'auto-mode-alist '("\\kubernetes\/templates" . mustache-mode))
;; make stack files use yaml mode
(add-to-list 'auto-mode-alist '("\\stack.yaml" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\package.yaml" . yaml-mode))
;; make SSH authorized keys files more readable
;; (add-to-list 'auto-mode-alist '("\\\.ssh\/authorized_keys" . prog-mode))

;; make underscore considered as a "word" character
(modify-syntax-entry ?_ "w")

(load! "+ui")
(load! "+keybindings")
