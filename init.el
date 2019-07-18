(let ((default-directory  "~/.emacs.d/my-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Start a server unless one is already running
(require 'server)
(unless (server-running-p) (server-start))


(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; MISC
(put 'narrow-to-region 'disabled nil)

;;; AUTO GENERATED FILES
;; Control files automatically created by emacs.

;; Put auto-generated config into its own file
(setq custom-file-path (concat user-emacs-directory "auto_custom.el"))
(unless (file-exists-p custom-file-path) (write-region "" nil custom-file-path))
(setq custom-file custom-file-path)
(load custom-file)

;; Don't litter the current directory with autosave files
(make-directory "~/.emacs.d/auto-save" "~/.emacs.d")
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/auto-save/" t)))

;; Don't create backups or lockfiles - it messes up the current directory
(setq make-backup-files nil)
(setq create-lockfiles nil)

;; This configuration is split into multiple files. Tell emacs where
;; to load it from.
(add-to-list 'load-path "~/.emacs.d/config")

;;; INDENTATION
(setq standard-indent 2)
(setq indent-tabs-mode nil)

;; Packages
;;
;; Set up use-package to simplify adding more packages
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'bind-key)

(load "ivy")
(load "keys")
(load "space-keys")

(load "appearance")
(load "projects")
(load "selection")
(load "git")
(load "autocompletion")

(if (string= system-type "darwin")
    (load "macos"))

(use-package comment-dwim-2
  :ensure t
  :bind (:map space-map
              ("c l" . 'comment-dwim-2)))

;; Programming modes
(add-hook 'prog-mode-hook 'electric-pair-mode)

(use-package flycheck
  :ensure t)

(load "lisp-configuration")
(load "javascript")
(load "elm")
(load "css")
(load "markdown")
(load "elixir")
(load "go")

;; TODO: elixir
;; TODO: haskell
