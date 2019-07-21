;;; This config changes the default behaviour of emacs. See also `appearance.el`

(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(put 'narrow-to-region 'disabled nil)

(setq standard-indent 2)
(setq indent-tabs-mode nil)


;;;----------------------------------------------------------------------
;;; Control files automatically created by emacs.

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
