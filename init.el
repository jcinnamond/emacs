(let ((default-directory  "~/.emacs.d/my-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Start a server unless one is already running
(require 'server)
(unless (server-running-p) (server-start))

;; Appearance
;;
;; Strip back the emacs UI, set up the default font, and load the theme
(setq inhibit-startup-message t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(set-frame-parameter nil 'fullscreen 'fullscreen)

(setq ring-bell-function 'ignore)

(show-paren-mode 1)

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

;; Ivy
(use-package ivy
  :ensure t
  :defer t
  :init
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d) ")
  (use-package ivy-rich
    :ensure t
    :functions ivy-rich-mode ivy-format-function ivy-format-function-line
    :defer t
    :init
    (ivy-rich-mode 1)
    (setq ivy-format-function #'ivy-format-function-line)))

(use-package counsel
  :ensure t
  :defer t)

(use-package prescient
  :ensure t
  :defer t
  :config
  (prescient-persist-mode 1))

(use-package ivy-prescient
  :ensure t
  :defer t
  :init
  (ivy-prescient-mode 1))

;; KEYBINDINGS
;;
;; evil mode
(use-package evil
  :ensure t
  :init
  (evil-mode t))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode t))

; Use which-key to prompt during key sequences
(use-package which-key
  :ensure t
  :defer t
  :init
  (which-key-mode))

(load "space-keys")

(load "appearance")
(load "projects")
(load "selection")
(load "git")
(load "autocompletion")

(use-package comment-dwim-2
  :ensure t
  :bind (:map space-map
              ("c l" . 'comment-dwim-2)))

(use-package dockspec)

;; Programming modes
(add-hook 'prog-mode-hook 'electric-pair-mode)

(use-package flycheck
  :ensure t)

(load "lisp-configuration")
(load "ruby")
(load "javascript")
(load "elm")
(load "css")
(load "markdown")
(load "elixir")

;; TODO: elixir
;; TODO: haskell
