;;;  -*- lexical-binding: t; -*-
(setq server-socket-dir "/tmp/emacs-server")
(after! comp
  ;; HACK Disable native-compilation for some troublesome packages
  (mapc (doom-partial #'add-to-list 'native-comp-deferred-compilation-deny-list)
        (list "/emacs-jupyter.*\\.el\\'"
              "/evil-collection-vterm\\.el\\'"
              "/with-editor\\.el\\'")))
(setq comp-speed 2
      comp-deferred-compilation t)
;; (add-to-list 'default-frame-alist '(inhibit-double-buffering . t))
;; (load! "+cloudformation-mode")
;; (load! "+ghcid")
(load! "+go-template-mode")
(load! "+editor")
(load! "+keybindings")
(load! "+ui")
