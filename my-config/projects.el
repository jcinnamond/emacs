;;; Config for working with projects. This sets up `projectile` (for
;;; now - I'm planning on replacing this) and also configures `magit`.

;;;----------------------------------------------------------------------
;;; Projectile
(use-package projectile
  :ensure t
  :commands projectile-mode
  :init
  (projectile-mode 1)
  (define-key space-map (kbd "p b") 'counsel-projectile-switch-to-buffer)
  (define-key space-map (kbd "p f") 'counsel-projectile)
  (define-key space-map (kbd "p p") 'counsel-projectile-switch-project)
  (define-key space-map (kbd "p t") 'projectile-toggle-between-implementation-and-test)

  (use-package counsel-projectile
    :ensure t)

  (use-package which-key
    :commands which-key-add-key-based-replacements
    :config
    (which-key-add-key-based-replacements "SPC p" "Projects")))


;;;----------------------------------------------------------------------
;;; Searching projects
(use-package ag
  :ensure t
  :init
  (define-key space-map (kbd "p s") 'counsel-projectile-ag))


;;;----------------------------------------------------------------------
;;; Git
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
    (define-key 'git-commit-comma-map (kbd "k") 'with-editor-cancel)
    (add-hook 'git-commit-mode-hook 'flyspell-mode)))

(use-package github-browse-file :ensure t)
