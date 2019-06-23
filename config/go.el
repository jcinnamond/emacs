(use-package go-mode
  :ensure t
  :config
  (setq exec-path (append exec-path '("~/go/bin")))
  (define-prefix-command 'go-comma-map)
  (evil-define-key '(normal visual motion emacs) go-mode-map (kbd ",") 'go-comma-map)
  (define-key 'go-comma-map (kbd "d") 'lsp-ui-doc-show)
  (define-key 'go-comma-map (kbd "q") 'lsp-ui-doc-hide)
  (add-hook 'go-mode-hook 'flyspell-prog-mode)
  (add-hook 'go-mode-hook (lambda () (interactive)
			    (setq tab-width 4)
			    (setq indent-tabs-mode 1)))
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save))

(use-package company-go
  :ensure t)

(use-package gorun
  :hook go-mode
  :bind (:map go-comma-map
	      ("c" . gorun-build)
	      ("t r" . gorun-rerun)
	      ("t s" . gorun-test-single)
	      ("t t" . gorun-test-all)))

;; Use gopls and lsp-mode instead of gocode
(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook (go-mode . lsp))

(use-package lsp-ui
  :ensure t
  :config
  (setq-default lsp-ui-sideline-show-hover nil)
  (setq-default lsp-ui-doc-enable nil))

(use-package company-lsp
  :ensure t)
