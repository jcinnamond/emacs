(use-package js
  :config
  (define-prefix-command 'js-comma-map)
  (setq-default indent-tabs-mode nil)
  (setq-default js-indent-level 2)
  (add-hook 'js-mode-hook 'subword-mode))
