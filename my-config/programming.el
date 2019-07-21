;;; Set up various programming modes.
;;;


(use-package flycheck :ensure t)
(add-hook 'prog-mode-hook 'electric-pair-mode)

;;;----------------------------------------------------------------------
;;; Use LSP for better ide-like functions
(use-package lsp-mode :ensure t)

(use-package lsp-ui
  :ensure t
  :config
  (setq-default lsp-ui-doc-position 'at-point)
  (setq-default lsp-ui-sideline-show-hover nil)
  (setq-default lsp-ui-doc-enable nil))

(use-package company-lsp :ensure t)


;;;----------------------------------------------------------------------
;;; Go programming

(use-package go-mode
  :ensure t
  :hook lsp

  :config
  (define-prefix-command 'go-comma-map)
  (evil-define-key '(normal visual motion emacs) go-mode-map (kbd ",") 'go-comma-map)
  (define-key 'go-comma-map (kbd "d") 'lsp-ui-doc-show)
  (define-key 'go-comma-map (kbd "f") 'lsp-ui-peek-find-references)
  (define-key 'go-comma-map (kbd "j") 'lsp-ui-peek-find-definitions)
  (define-key 'go-comma-map (kbd "q") 'lsp-ui-doc-hide)
  (add-hook 'go-mode-hook 'flyspell-prog-mode)
  (add-hook 'go-mode-hook (lambda () (interactive)
			    (setq tab-width 4)
			    (setq indent-tabs-mode t)))
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save))

(use-package company-go :ensure t)


;;;----------------------------------------------------------------------
;;; Editing protobuf files

(use-package protobuf-mode
  :ensure t
  :config
  (setq-default c-basic-offset 4)
  (setq-default indent-tabs-mode nil))


;;;----------------------------------------------------------------------
;;; Emacs lisp programming
(use-package lisp-mode
  :ensure nil
  :init
  (define-prefix-command 'elisp-comma-map)
  (evil-define-key '(normal visual motion emacs) emacs-lisp-mode-map (kbd ",") 'elisp-comma-map)
  (define-key 'elisp-comma-map (kbd "e b") 'eval-buffer)
  (define-key 'elisp-comma-map (kbd "e e") 'eval-last-sexp)
  (define-key 'elisp-comma-map (kbd "e r") 'eval-region)
  (define-key 'elisp-comma-map (kbd "c") 'emacs-lisp-byte-compile))

(use-package auto-compile
  :ensure t
  :commands auto-compile-on-save-mode auto-compile-on-load-mode
  :init
  (auto-compile-on-save-mode 1)
  (auto-compile-on-load-mode 1))


;;;----------------------------------------------------------------------
;;; Editing markdown files (not technically programming, but close)
(use-package markdown-mode
  :ensure t
  :config
  (add-hook 'markdown-mode-hook 'flyspell-mode))
