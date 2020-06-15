;; Customization of org mode

;; Better org mode appearance
(use-package org
  :config
  (setq-default org-todo-keywords
                '((sequence "TODO" "|" "DONE" "ABANDONED")))
  (setq-default org-startup-folded nil)
  (setq-default org-hide-leading-stars t)
  (setq-default org-fontify-whole-heading-line t)
  (setq-default org-fontify-done-headline t)
  (setq-default org-hide-emphasis-markers t)
  (setq-default org-cycle-separator-lines -1)
  (add-hook 'org-mode-hook 'org-indent-mode)
  (add-hook 'org-mode-hook 'variable-pitch-mode))

;; Use org-journal to keep track of my daily thoughts
(use-package org-journal
  :ensure t
  :config
  (setq org-journal-dir "~/journal/")
  (setq org-journal-file-type "daily")
  (setq org-journal-find-file 'find-file))
