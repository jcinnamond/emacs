(use-package js
  :config
  (define-prefix-command 'js-comma-map)
  (evil-define-key '(normal visual motion emacs) js-mode-map (kbd ",") 'js-comma-map)
  (define-key 'js-comma-map (kbd "t t") 'dockspec-run-current-file)
  (define-key 'js-comma-map (kbd "t s") 'dockspec-run-current-line)
  (define-key 'js-comma-map (kbd "t a") 'dockspec-run-all)
  (define-key 'js-comma-map (kbd "t r") 'dockspec-rerun)
  (setq-default indent-tabs-mode nil)
  (setq-default js-indent-level 2)
  (add-hook 'js-mode-hook 'subword-mode))
