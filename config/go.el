(use-package go-mode
  :ensure t
  :config
  (setq exec-path (append exec-path '("~/go/bin")))
  (define-prefix-command 'go-comma-map)
  (evil-define-key '(normal visual motion emacs) go-mode-map (kbd ",") 'go-comma-map)
  (add-hook 'go-mode-hook (lambda () (interactive)
			    (setq tab-width 4)
			    (setq indent-tabs-mode 1)
			    (set (make-local-variable 'company-backends) '(company-go))))
  (add-hook 'before-save-hook 'gofmt-before-save))

(use-package company-go
  :ensure t)

(use-package gorun
  :hook go-mode
  :bind (:map go-comma-map
	      ("c" . gorun-build)
	      ("t s" . gorun-test-single)
	      ("t t" . gorun-test-all)))
