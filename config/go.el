(use-package go-mode
  :ensure t
  :config
  (add-hook 'go-mode-hook (lambda () (interactive)
							(setq tab-width 4)
							(setq indent-tabs-mode 1)))
  (add-hook 'before-save-hook 'gofmt-before-save))
