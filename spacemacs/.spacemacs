;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(react
     purescript
     go
     elm
     csv
     lua
     ansible
     python
     typescript
     nginx
     ruby
     html
     tern
     ;; (javascript :variables javascript-backend 'lsp)
     javascript
     osx
     docker
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ivy
     lsp
     ;; helm
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      ;; tab key to complete as much of common completion as possible
                      ;; auto-completion-tab-key-behavior 'cycle
                      ;; automatic docstring display
                      auto-completion-enable-help-tooltip t
                      ;; enable the most frequent matches to show first
                      auto-completion-enable-sort-by-usage t)
     better-defaults
     org
     emacs-lisp
     git
     (markdown :variables markdown-live-preview-engine 'vmd)
     ;; neotree
     treemacs
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     racket
     (haskell :variables
              haskell-completion-backend 'intero
              haskell-enable-hindent-style "johan-tibell")
     ;; perl5
     colors
     shell-scripts
     theming
     themes-megapack
     (version-control :variables
                      version-control-diff-side 'left)
     yaml
     ;; ocaml
     ;; scala
     ;; clojure
     ;; fsharp
     ;; elm
     terraform
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(nodejs-repl
                                      add-node-modules-path
                                      editorconfig
                                      doom-themes
                                      angular-snippets
                                      paren-face
                                      dimmer
                                      prettier-js
                                      nvm
                                      writeroom-mode
                                      kubernetes
                                      kubernetes-evil
                                      flycheck-jest
                                      bliss-theme
                                      oceanic-theme
                                      ;; merlin
                                      ;; lsp-ocaml
                                      ;; reason-mode
                                      ;; (elm-mode :location "/Users/sawyer/.emacs.d/private/local/elm-mode")
                                      ;; (reason-mode
                                      ;;  :location (recipe
                                      ;;             :repo "facebook/reason"
                                      ;;             :fetcher github
                                      ;;             :files ("editorSupport/emacs/reason-model.el" "editorSupport/emacs/refmt.el")))
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(vi-tilde-fringe helm helm-core helm-make linum-relative)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   ;; dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"
   dotspacemacs-emacs-pdumper-executable-file nil

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-tomorrow-night
                         darktooth
                         doom-challenger-deep
                         brin
                         gruvbox-dark-hard
                         gotham
                         doom-peacock
                         clues
                         badwolf
                         hemisu-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator bar :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   ;; dotspacemacs-default-font '("PragmataPro Liga"
   ;;                             :size 24
   ;;                             :weight medium
   ;;                             :width normal
   ;;                             :powerline-scale 1.5)
   dotspacemacs-default-font '("Input"
                               :size 21
                               :weight normal
                               :powerline-scale 1.5)
   ;; The leader key
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ";"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
    This function is called immediately after `dotspacemacs/init', before layer
    configuration.
    It is mostly for variables that should be set before packages are loaded.
    If you are unsure, try setting them in `dotspacemacs/user-config' first."

  (setq theming-modifications '(
                                (darktooth
                                 (line-number :background "#1e1e1e"
                                              :foreground "#333333")
                                 (fringe :background "#1e1e1e")
                                 (font-lock-function-name-face :foreground "#8cb2b0")
                                 (font-lock-string-face :background "#202d2d")
                                 (linum-relative-current-face :inherit (shadow default)
                                                              :background "#3C3836"
                                                              :foreground "#ff0000")
                                 (font-lock-comment-face :slant normal)
                                 (hl-line :background "#3a2933")
                                 )
                                (brin
                                 (hl-line :background "gray25")
                                 (font-lock-function-name-face :foreground "#8cb2b0")
                                 (font-lock-string-face :background "#393f4d")
                                 (line-number :background "#3C3836"
                                              :foreground "SlateGray4")
                                 (line-number-current-line
                                  :background "#81A9A7"
                                  :foreground "#cccccc")
                                 (font-lock-comment-face :slant normal)
                                 (fringe :foreground "#81A9A7" :inherit (background default))
                                 )
                                (gruvbox
                                 (font-lock-string-face :background "#30343c")
                                 )
                                ))
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
    This function is called at the very end of Spacemacs startup, after layer
    configuration.
    Put your configuration code here, except for variables that should be set
    before packages are loaded."

  (global-set-key (kbd "H-=") 'spacemacs/zoom-frm-in)
  (global-set-key (kbd "H--") 'spacemacs/zoom-frm-out)
  (global-set-key (kbd "H-0") 'spacemacs/zoom-frm-unzoom)

  (defun copy-from-osx ()
    (shell-command-to-string "pbpaste"))

  (defun paste-to-osx (text &optional push)
    (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
        (process-send-string proc text)
        (process-send-eof proc))))

  (defun sawyer-configure-terminal-specific ()
    (setq interprogram-cut-function 'paste-to-osx)
    (setq interprogram-paste-function 'copy-from-osx))

  (setq-default line-spacing 3)
  (setq-default scroll-margin 3)
  (setq-default vc-follow-symlinks t)
  (setq-default exec-path-from-shell-check-startup-files t)
  (setq-default neo-theme 'nerd)

  ;; (message "Calling exec-path-from-shell-initialize")
  ;; (exec-path-from-shell-initialize)
  ;; (message "PATH is now: %s" (getenv "PATH"))
  (setq golden-ratio-exclude-modes '("dired-mode"
                                     "ediff-mode"
                                     "eshell-mode"
                                     "neotree-mode"))

  (define-global-minor-mode global-hidden-mode-line-mode
    hidden-mode-line-mode ;; mode to be enabled
    (lambda () (hidden-mode-line-mode) ;; function to enable mode
      ))

  (require 'nvm)

  ;; (require 'flx)
  ;; (setq ivy-re-builders-alist
  ;;       '((ivy-switch-buffer . ivy--regex-fuzzy)
  ;;         (counsel-recentf . ivy--regex-fuzzy)
  ;;         (t . ivy--regex-plus)))

  (spacemacs/set-leader-keys-for-major-mode 'haskell-mode
    "=" 'haskell-mode-stylish-buffer)
  (setq-default js2-mode-show-parse-errors nil)
  (setq-default js2-mode-show-strict-warnings nil)
  (setq-default js2-pretty-multiline-declarations 'all)
  (add-hook 'prog-mode-hook 'display-line-numbers-mode)
  (add-hook 'js2-mode-hook 'display-line-numbers-mode)
  (add-hook 'emacs-lisp-mode-hook 'display-line-numbers-mode)
  (add-hook 'yaml-mode-hook 'display-line-numbers-mode)
  ;; (add-hook 'js2-mode-hook
  ;;           (lambda()
  ;;             (electric-indent-mode -1)))

  (add-hook 'less-css-mode-hook 'rainbow-mode)

  (add-hook 'css-mode-hook 'rainbow-mode)
  (add-hook 'emacs-lisp-mode-hook 'rainbow-mode)
  (add-hook 'lisp-mode-hook 'rainbow-mode)
  (add-hook 'js2-mode-hook 'rainbow-mode)

  (add-hook 'js2-mode-hook 'prettier-js-mode)

  ;; TODO: make the following work to prevent indenting hanging chained function calls
  ;; (advice-add 'js--multi-line-declaration-indentation :around (lambda (orig-fun &rest args) nil))
  (editorconfig-mode 1)
  ;; (dimmer-mode 1)
  ;; TODO: when https://github.com/syl20bnr/spacemacs/issues/10290 is fixed, hopefully the following line can be removed
  ;; (evil-set-initial-state 'ivy-occur-grep-mode 'normal)

  ;; nodejs-repl
  (spacemacs/set-leader-keys-for-major-mode 'js2-mode "ne" 'nodejs-repl-send-last-expression)
  (spacemacs/set-leader-keys-for-major-mode 'js2-mode "nj" 'nodejs-repl-send-line)
  (spacemacs/set-leader-keys-for-major-mode 'js2-mode "nr" 'nodejs-repl-send-region)
  (spacemacs/set-leader-keys-for-major-mode 'js2-mode "nf" 'nodejs-repl-load-file)
  (spacemacs/set-leader-keys-for-major-mode 'js2-mode "n'" 'nodejs-repl-switch-to-repl)
  (spacemacs/set-leader-keys-for-major-mode 'js2-mode "ns" 'nodejs-repl-switch-to-repl)

  (spacemacs-buffer/insert-startup-lists)
  (setq mac-mouse-wheel-smooth-scroll nil)

  ;; make flycheck window auto-resize (with a max height of 15 lines)
  (defadvice flycheck-error-list-refresh (around shrink-error-list activate)
    ad-do-it
    (-when-let (window (flycheck-get-error-list-window t))
      (with-selected-window window
        (fit-window-to-buffer window 15))))

  ;; attempt to disable js2 mode's overreach and let flycheck work instead
  (add-hook 'js2-init-hook
            '(lambda ()
               (setq next-error-function 'flycheck-next-error)
               (setq previous-error-function 'flycheck-previous-error)
               )
            )

  (add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)

  ;; (add-to-list 'load-path "~/.emacs.d/lsp-javascript")

  ;; enable LSP (TODO: remove when lsp-javascript-typescript is fixed)
  ;; (require 'lsp-mode)
  ;; (require 'typescript-mode)

  ;; (defconst lsp-javascript-typescript--get-root
  ;;   (lsp-make-traverser #'(lambda (dir)
  ;;                           (directory-files dir nil "package.json"))))

  ;; (defun lsp-javascript-typescript--render-string (str)
  ;;   (ignore-errors
  ;;     (with-temp-buffer
  ;;       (typescript-mode)
  ;;       (insert str)
  ;;       (font-lock-ensure)
  ;;       (buffer-string))))

  ;; (defun lsp-javascript-typescript--initialize-client (client)
  ;;   (lsp-provide-marked-string-renderer
  ;;    client "typescript" 'lsp-javascript-typescript--render-string)
  ;;   (lsp-provide-marked-string-renderer
  ;;    client "javascript" 'lsp-javascript-typescript--render-string))

  ;; (lsp-define-stdio-client lsp-javascript-typescript "javascript"
  ;;                          lsp-javascript-typescript--get-root '("javascript-typescript-stdio")
  ;;                          :ignore-messages '("readFile .*? requested by TypeScript but content not available")
  ;;                          :initialize 'lsp-javascript-typescript--initialize-client)

  ;; (provide 'lsp-javascript-typescript)
  ;; end of LSP javascript stuff

  ;; (add-hook 'js2-mode-hook #'lsp-javascript-typescript-enable)

  ;; ;; temporary workaround for LSP engine not handling the completion prefix
  ;; (defun my-company-transformer (candidates)
  ;;   (let ((completion-ignore-case t))
  ;;     (all-completions (company-grab-symbol) candidates)))

  ;; (defun my-js-hook nil
  ;;   (make-local-variable 'company-transformers)
  ;;   (push 'my-company-transformer company-transformers))

  ;; (add-hook 'js-mode-hook 'my-js-hook)

  ;; enable ligatures (only works with railwaycat emacs)
  ;; (mac-auto-operator-composition-mode)

  ;;----------------------------------------------------------------------------
  ;; Reason setup
  ;; Expects reason-cli to be installed:
  ;; npm install -g git://github.com/reasonml/reason-cli.git
  ;;----------------------------------------------------------------------------

  ;; (defun chomp-end (str)
  ;;   "Chomp tailing whitespace from STR."
  ;;   (replace-regexp-in-string (rx (* (any " \t\n")) eos)
  ;;                             ""
  ;;                             str))

  ;; (defun real-path (path)
  ;;   "Resolves the actual path for PATH."
  ;;   (chomp-end (shell-command-to-string (concat "realpath " path))))

  ;; (let ((support-base-dir (concat (replace-regexp-in-string "refmt\n" "" (shell-command-to-string (concat "realpath " (shell-command-to-string "which refmt")))) ".."))
  ;;       (merlin-base-dir (concat (replace-regexp-in-string "ocamlmerlin\n" "" (shell-command-to-string (concat "realpath " (shell-command-to-string "which ocamlmerlin")))) "..")))
  ;;   ;; Add npm merlin.el to the emacs load path and tell emacs where to find ocamlmerlin
  ;;   (add-to-list 'load-path (concat merlin-base-dir "/share/emacs/site-lisp/"))
  ;;   (setq merlin-command (concat merlin-base-dir "/bin/ocamlmerlin"))

  ;;   ;; Add npm reason-mode to the emacs load path and tell emacs where to find refmt
  ;;   (add-to-list 'load-path (concat support-base-dir "/share/emacs/site-lisp"))
  ;;   (setq refmt-command (concat support-base-dir "/bin/refmt")))

  ;; (require 'reason-mode)
  ;; (require 'merlin)
  (add-hook 'reason-mode-hook (lambda ()
                                (add-hook 'before-save-hook 'refmt-before-save)
                                ))

  ;; (setq merlin-ac-setup t)

  ;; (require 'merlin-iedit)
  ;; (defun evil-custom-merlin-iedit ()
  ;;   (interactive)
  ;;   (if iedit-mode (iedit-mode)
  ;;     (merlin-iedit-occurrences)))
  ;; (define-key merlin-mode-map (kbd "C-c C-e") 'evil-custom-merlin-iedit)

  ;; Company
  (require 'company)
  (add-hook 'after-init-hook 'global-company-mode)

  ;; Elm
  ;; (require 'elm-mode)
  ;; (setq elm-format-on-save t)
  ;; (setq elm-sort-imports-on-save t)
  ;; (add-hook 'elm-mode-hook #'elm-oracle-setup-completion)
  ;; (add-to-list 'company-backends 'company-elm)

  (global-paren-face-mode t)

  ;; ORG MODE!!!!!!

  ;; (with-eval-after-load 'org
  ;;   (let* ((variable-tuple
  ;;           (cond ((x-list-fonts "Avenir Next") '(:font "Avenir Next"))
  ;;                 ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
  ;;                 (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
  ;;         (base-font-color     (face-foreground 'default nil 'default))
  ;;         (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  ;;     (custom-theme-set-faces
  ;;      'user
  ;;      '(variable-pitch ((t (:family "Avenir Next" :height 180 :weight light))))
  ;;      '(fixed-pitch ((t ( :family "PragmataPro Liga" :slant normal :weight normal :height 1.0 :width normal))))))

  ;;   (custom-theme-set-faces
  ;;    'user
  ;;    `(org-level-8 ((t (,@headline ,@variable-tuple))))
  ;;    `(org-level-7 ((t (,@headline ,@variable-tuple))))
  ;;    `(org-level-6 ((t (,@headline ,@variable-tuple))))
  ;;    `(org-level-5 ((t (,@headline ,@variable-tuple))))
  ;;    `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
  ;;    `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
  ;;    `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
  ;;    `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
  ;;    `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

  ;;   (custom-theme-set-faces
  ;;    'user
  ;;    '(org-block                 ((t (:inherit fixed-pitch))))
  ;;    '(org-document-info         ((t (:foreground "dark orange"))))
  ;;    '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
  ;;    '(org-link                  ((t (:foreground "royal blue" :underline t))))
  ;;    '(org-meta-line             ((t (:inherit (font-lock-comment-face fixed-pitch)))))
  ;;    '(org-property-value        ((t (:inherit fixed-pitch))) t)
  ;;    '(org-special-keyword       ((t (:inherit (font-lock-comment-face fixed-pitch)))))
  ;;    '(org-tag                   ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
  ;;    '(org-verbatim              ((t (:inherit (shadow fixed-pitch))))))

  ;;   (add-hook 'org-mode-hook 'variable-pitch-mode)
  ;;   (add-hook 'org-mode-hook 'visual-line-mode)
  ;; END OF ORG MODE
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.


(defun dotspacemacs/emacs-custom-settings ()
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(package-selected-packages
     '(hl-todo projectile zenburn-theme zen-and-art-theme yasnippet-snippets yapfify yaml-mode ws-butler writeroom-mode winum white-sand-theme which-key wgrep web-mode web-beautify volatile-highlights vmd-mode uuidgen use-package unfill underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme treemacs-projectile treemacs-evil toxi-theme toc-org tide tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit symon sunny-day-theme sublime-themes subatomic256-theme subatomic-theme string-inflection spaceline-all-the-icons spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smex smeargle slim-mode seti-theme seeing-is-believing scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocop rspec-mode robe rjsx-mode reverse-theme reveal-in-osx-finder restart-emacs request rebecca-theme rbenv rake rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme racket-mode pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode psci psc-ide professional-theme prettier-js popwin planet-theme pippel pipenv pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode password-generator paren-face paradox overseer osx-trash osx-dictionary orgit organic-green-theme org-projectile org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file omtose-phellack-theme oldlace-theme oceanic-theme occidental-theme obsidian-theme nvm nodejs-repl noctilux-theme nginx-mode naquadah-theme nameless mwim mustang-theme move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minitest minimal-theme material-theme markdown-toc majapahit-theme magit-svn magit-gitflow madhat2r-theme macrostep lush-theme lsp-ui lsp-python lsp-javascript-typescript lsp-go lorem-ipsum livid-mode live-py-mode link-hint light-soap-theme launchctl kubernetes-evil kaolin-themes json-navigator js2-refactor js-doc jinja2-mode jbeans-theme jazz-theme ivy-yasnippet ivy-xref ivy-purpose ivy-hydra ir-black-theme intero insert-shebang inkpot-theme indent-guide importmagic impatient-mode ibuffer-projectile hungry-delete hlint-refactor hindent highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc gnuplot gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy font-lock+ flycheck-pos-tip flycheck-jest flycheck-haskell flycheck-elm flycheck-bashate flx-ido flatui-theme flatland-theme fish-mode fill-column-indicator farmhouse-theme fancy-battery eziam-theme eyebrowse expand-region exotica-theme evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu espresso-theme emmet-mode elm-test-runner elm-mode elisp-slime-nav editorconfig dumb-jump dracula-theme dotenv-mode doom-themes doom-modeline dockerfile-mode docker django-theme dimmer diminish diff-hl darktooth-theme darkokai-theme darkmine-theme darkburn-theme dante dakrone-theme cython-mode cyberpunk-theme csv-mode counsel-projectile counsel-css company-web company-terraform company-tern company-statistics company-shell company-quickhelp company-lua company-lsp company-go company-ghci company-ghc company-cabal company-ansible company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-identifiers-mode cmm-mode clues-theme clean-aindent-mode chruby cherry-blossom-theme centered-cursor-mode busybee-theme bundler bubbleberry-theme browse-at-remote bliss-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ansible-doc ansible angular-snippets ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme ace-link ac-ispell)))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(treemacs-collapse-dirs 3)
   '(treemacs-filewatch-mode t)
   '(treemacs-follow-after-init t)
   '(treemacs-follow-mode t)
   '(treemacs-fringe-indicator-mode t)
   '(treemacs-git-mode 'deferred)
   '(treemacs-space-between-root-nodes nil)
   '(treemacs-directory-face ((t (:foreground "#c5c8c6" :height 0.8 :family "Fira Sans"))))
   '(treemacs-file-face ((t (:foreground "#c5c8c6" :height 0.8 :family "Fira Sans"))))
   '(treemacs-fringe-indicator-face ((t (:foreground "DarkGoldenrod2" :family "Fira Sans"))))
   '(treemacs-git-added-face ((t (:foreground "#b5bd68" :family "Fira Sans"))))
   '(treemacs-git-conflict-face ((t (:foreground "#cc6666" :family "Fira Sans"))))
   '(treemacs-git-ignored-face ((t (:inherit font-lock-comment-face :family "Fira Sans"))))
   '(treemacs-git-modified-face ((t (:foreground "#b294bb" :family "Fira Sans"))))
   '(treemacs-git-renamed-face ((t (:inherit font-lock-doc-face :family "Fira Sans"))))
   '(treemacs-git-untracked-face ((t (:inherit font-lock-doc-face :family "Fira Sans"))))
   '(treemacs-help-column-face ((t (:inherit font-lock-keyword-face :underline t :family "Fira Sans"))))
   '(treemacs-help-title-face ((t (:inherit spacemacs-transient-state-title-face :family "Fira Sans"))))
   '(treemacs-on-failure-pulse-face ((t (:background "#ab3737" :foreground "#111111" :family "Fira Sans"))))
   '(treemacs-on-success-pulse-face ((t (:background "#669966" :foreground "#111111" :family "Fira Sans"))))
   '(treemacs-root-face ((t (:inherit font-lock-string-face :weight semi-bold :height 1.0 :family "Fira Sans"))))
   )
  )
