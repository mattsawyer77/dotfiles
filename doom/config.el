;;;  -*- lexical-binding: t; -*-
(setq server-socket-dir "/tmp/emacs-server")
(setq comp-speed 2
      comp-deferred-compilation t)
(setq default-frame-alist
      (append (list
               '(inhibit-double-buffering . t)
               '(min-height . 1)
               '(height . 45)
               '(min-width . 1)
               '(width . 81)
               '(vertical-scroll-bars . nil)
               '(internal-border-width . 16)
               '(left-fringe . 0)
               '(right-fringe . 0)
               '(tool-bar-lines . 0)
               '(menu-bar-lines . 0)
               )))
(when (and IS-MAC (display-graphic-p))
  (menu-bar-mode))
;; (load! "+cloudformation-mode")
;; (load! "+ghcid")

(load! "+editor")
(load! "+ui")
(load! "+keybindings")
