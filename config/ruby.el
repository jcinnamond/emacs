(use-package ruby-mode
  :ensure t
  :config
  (define-prefix-command 'ruby-comma-map)
  (evil-define-key '(normal visual motion emacs) ruby-mode-map (kbd ",") 'ruby-comma-map)
  (define-key 'ruby-comma-map (kbd "t t") 'dockspec-run-current-file)
  (define-key 'ruby-comma-map (kbd "t s") 'dockspec-run-current-line)
  (define-key 'ruby-comma-map (kbd "t a") 'dockspec-run-all)
  (define-key 'ruby-comma-map (kbd "t r") 'dockspec-rerun)
  (setq-default ruby-align-chained-calls t)
  (add-hook 'ruby-mode-hook 'flyspell-prog-mode)
  (add-hook 'ruby-mode-hook 'flycheck-mode)
  (add-hook 'ruby-mode-hook 'seeing-is-believing))

(use-package seeing-is-believing
  :ensure t
  :after ruby-mode
  :init
  (define-key 'ruby-comma-map (kbd "e") 'seeing-is-believing-run-as-xmpfilter))

(use-package yaml-mode
  :ensure t)
