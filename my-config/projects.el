;;; Config for working with projects. This sets up bindings to open
;;; files and also configures `magit`.

;;;----------------------------------------------------------------------
;;; Set and use the project root
(defvar my-config/override-project-root-directory nil)

(defun my-config/project-root-directory ()
  "Return the project root directory or the current directory"
  (or my-config/override-project-root-directory default-directory))

(defmacro my-config/run-in-root (body)
  `(let ((default-directory (my-config/project-root-directory)))
     ,body))


;;;----------------------------------------------------------------------
;;; Find file in project
;;;
;;; Most of my projectile usage is finding files in a project.
(use-package find-file-in-project
  :ensure t
  :commands find-file-in-current-directory find-file-in-project find-file-in-project-by-selected
  :bind (:map space-map
              ("f d" . 'find-file-in-current-directory)
              ("f p" . 'find-file-in-project-by-selected)
              ("f s" . 'find-file-in-project)))


;;;----------------------------------------------------------------------
;;; Searching projects
(use-package ag
  :ensure t
  :commands counsel-ag
  :bind (:map space-map
              ("s p" . 'counsel-ag)))


;;;----------------------------------------------------------------------
;;; Git
(setq evil-magit-state 'normal)

(use-package evil-magit
  :ensure t
  :init
  (which-key-add-key-based-replacements "SPC g" "Git")
  :bind (:map space-map
              ("g a" . 'magit-blame-addition)
              ("g f" . 'github-browse-file)
              ("g l" . 'magit-log)
              ("g g" . 'github-browse-commit)
              ("g s" . 'magit-status))
  :config
  (setq-default magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1)
  (add-hook 'magit-mode-hook (lambda () (interactive) (turn-off-evil-mc-mode)))

  (use-package git-commit
    :config
    (define-prefix-command 'git-commit-comma-map)
    (evil-define-key '(normal visual motion emacs) git-commit-mode-map (kbd ",") 'git-commit-comma-map)
    (define-key 'git-commit-comma-map (kbd "c") 'with-editor-finish)
    (define-key 'git-commit-comma-map (kbd "k") 'with-editor-cancel)
    (add-hook 'git-commit-mode-hook 'flyspell-mode)))

(use-package github-browse-file :ensure t)
