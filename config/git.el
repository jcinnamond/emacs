(setq evil-magit-state 'normal)
(use-package evil-magit
  :ensure t
  :config
  (setq-default magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1)
  (add-hook 'magit-mode-hook (lambda () (interactive) (turn-off-evil-mc-mode)))

  (use-package git-commit
    :config
    (define-prefix-command 'git-commit-comma-map)
    (evil-define-key '(normal visual motion emacs) git-commit-mode-map (kbd ",") 'git-commit-comma-map)
    (define-key 'git-commit-comma-map (kbd "c") 'with-editor-finish)
    (define-key 'git-commit-comma-map (kbd "k") 'with-editor-cancel)))

(use-package github-browse-file
  :ensure t)

