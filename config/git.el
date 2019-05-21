(setq evil-magit-state 'normal)
(use-package evil-magit
  :ensure t
  :config
  (setq-default magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1))

(use-package github-browse-file
  :ensure t)

