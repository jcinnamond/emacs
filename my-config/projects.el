;;; Config for working with projects. This sets up bindings to open
;;; files and also configures `magit`.

;;;----------------------------------------------------------------------
;;; Find file in project
;;;
;;; Most of my projectile usage is finding files in a project.
(use-package find-file-in-project
  :ensure t
  :commands find-file-in-current-directory find-file-in-project
  :bind (:map space-map
              ("f d" . 'find-file-in-current-directory)
              ("f p" . 'find-file-in-project)))


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