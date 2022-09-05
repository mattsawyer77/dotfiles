;;;  -*- lexical-binding: t; -*-
(setq server-socket-dir "/tmp/emacs-server")
(setq comp-speed 2
      comp-deferred-compilation t)
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))
;; (load! "+cloudformation-mode")
;; (load! "+ghcid")

(load! "+editor")
(load! "+keybindings")
;; (load! "setup-nano.el")
(load! "+ui")
