(setq comp-speed 2
      comp-deferred-compilation t)
;;;  -*- lexical-binding: t; -*-
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))
(load! "+cloudformation-mode")
;; (load! "+ghcid")
;; exec-path-from-shell
;; (when (memq window-system '(mac ns x))
;;   (exec-path-from-shell-initialize))

(load! "+editor")
(load! "+keybindings")
(load! "+ui")
