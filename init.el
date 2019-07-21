;;; My emacs config.
;;;
;;; This file is responsible for setting up the the load path and then loading
;;; individual configuration files in the correct order.
;;;
;;; The config is split into individual config files and packages, each one
;;; responsible for a particular function or type of config.
;;;
;;; The following directories are checked into git as part of this repo:
;;;
;;;   - my-config/*.el    contains individual config files loaded from here
;;;   - my-lisp/**/*.el   contains customer packages that I haven't shared
;;;   - themes/*.el       contains my custom theme(s)
;;;   - snippets/**/*     contains snippet definintions for yasnippet
;;;
;;; The following directories might contain config information but are
;;; not commited to git:
;;;
;;;   - local-config/*.el   contains config files specific to this machine


;;;----------------------------------------------------------------------
;;; Set up various paths to be able to load or require my custom lisp

;; Allow require to work with custom packages
(let ((default-directory  "~/.emacs.d/my-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Allow emacs to find each config file
(add-to-list 'load-path "~/.emacs.d/my-config")

;; Find custom themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/my-themes")


;;;----------------------------------------------------------------------
;;; Load the individual config files

;; Bootstrap use-package so that everything else can automatically
;; install packages I need.
(load "packages")

;; Set up keybindings first so that if anything else fails at least
;; I'll understand how to type commands.
;;
;; This sets up evil mode and the space-leader-key menu
(load "keys")

;; Override emacs default settings. This is important to do early
;; because it tells emacs where to store custom config.
(load "override-defaults")

;; Next, set up the theme so that errors look lovely if anything else fails.
(load "appearance")

;; Set up ivy/counsel
(load "ivy")

;; Packages for selecting or manipulting text
(load "selection-and-manipulation")

;; Set up company and yasnippet
(load "autocompletion")

;; Set up various programming modes
(load "programming")

;; Config for working with projects
(load "projects")


;;;----------------------------------------------------------------------
;;; OS specific configuration

;; If a config file exists for this architecture, load it
(if (file-exists-p (format "~/.emacs.d/my-config/%s.el" system-type))
    (load (symbol-name system-type)))


;;;----------------------------------------------------------------------
;;; Machine specific config. Load any files under `local-config`
(dolist (f (directory-files "~/.emacs.d/local-config" t "\\.el$"))
        (load f))

;;;----------------------------------------------------------------------
;;; Start a server
;;;
;;; If everything else has loaded then we're good to reuse this instance.
(require 'server)
(unless (server-running-p) (server-start))
