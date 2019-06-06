(use-package go-mode
  :ensure t
  :config
  (define-prefix-command 'go-comma-map)
  (evil-define-key '(normal visual motion emacs) go-mode-map (kbd ",") 'go-comma-map)
  (add-hook 'go-mode-hook (lambda () (interactive)
			    (setq tab-width 4)
			    (setq indent-tabs-mode 1)))
  (add-hook 'before-save-hook 'gofmt-before-save))

(use-package godock
  :hook go-mode
  :bind (:map go-comma-map
	      ("c" . godock-build)
	      ("t t" . godock-test-file)))
