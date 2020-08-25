;;; Set up various programming modes.
;;;


(use-package flycheck :ensure t)
(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'prog-mode-hook 'linum-mode)

;;;----------------------------------------------------------------------
;;; Use LSP for better ide-like functions
(use-package lsp-mode
  :ensure t
  :config
  (setq-default lsp-enable-file-watchers nil) ;; This causes problems with large monorepos
  (setq-default lsp-prefer-flymake nil)
  (setq-default lsp-enable-links nil)

  ;; reduce delay when showing company completions if LSP is running
  (setq-local company-minimum-prefix-length 2
              company-idle-delay 0))

;; Set some defaults for better lsp performance
;; (see https://emacs-lsp.github.io/lsp-mode/page/performance/)
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(use-package lsp-ui
  :ensure t
  :config
  (setq-default lsp-ui-doc-position 'bottom)
  (setq-default lsp-ui-doc-alignment 'window)
  (setq-default lsp-ui-sideline-show-hover nil)
  (setq-default lsp-ui-sideline-show-code-actions t)
  (setq-default lsp-ui-sideline-show-code-diagnostics t)
  (setq-default lsp-ui-flycheck-enable t)
  (setq-default lsp-ui-doc-header t)
  (setq-default lsp-ui-doc-enable nil))


;;;----------------------------------------------------------------------
;;; Go programming

(require 'go-extra)

(use-package go-mode
  :ensure t

  :init
  (define-prefix-command 'go-comma-map)
  (evil-define-key '(normal visual motion emacs) go-mode-map (kbd ",") 'go-comma-map)

  :bind (:map go-comma-map
              ("a" . go-extra/switch-to-alternative)
              ("c" . go-extra/compile)
              ("r" . go-extra/run)
              ("t r" . go-extra/rerun-test)
              ("t s" . go-extra/test-single)
              ("t t" . go-extra/test))

  :config
  (add-hook 'go-mode-hook 'flyspell-prog-mode)
  (add-hook 'go-mode-hook 'subword-mode)
  (add-hook 'go-mode-hook (lambda () (interactive)
			    (setq tab-width 4)
			    (setq indent-tabs-mode t)
                            (setq-default fill-column 100)))
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save))

(use-package company-go :ensure t)

;; Hook up lsp
(use-package lsp-mode
  :hook (go-mode . lsp)
  :bind (:map go-comma-map
              ("l a" . lsp-execute-code-action)
              ("l b" . lsp-ui-peek-jump-backward)
              ("l d" . lsp-ui-doc-glance)
              ("l e" . lsp-ui-flycheck-list)
              ("l f" . lsp-ui-peek-find-references)
              ("l j" . lsp-ui-peek-find-definitions)
              ("l J" . lsp-ui-peek-find-implementation)
              ("l q" . lsp-ui-doc-hide)
              ("l r" . lsp-rename)
              ("l R" . lsp-workspace-restart)
              ("l t" . lsp-find-type-definition)))

;; When running go tests, use an existing buffer in another frame for output if available
(add-to-list 'display-buffer-alist '("\* Go Test \*" nil (reusable-frames . t)))
(add-to-list 'display-buffer-alist '("\*compilation\*" nil (reusable-frames . t)))
(setq-default compilation-scroll-output t)

;;;----------------------------------------------------------------------
;;; Editing protobuf files

(use-package protobuf-mode
  :ensure t
  :init
  (define-prefix-command 'protobuf-comma-map)
  (evil-define-key '(normal visual motion emacs) protobuf-mode-map (kbd ",") 'protobuf-comma-map)
  :config
  (setq-default c-basic-offset 4)
  (setq-default indent-tabs-mode nil))


;;;----------------------------------------------------------------------
;;; Editing cassandra schema definitions

(use-package cql-mode
  :ensure t
  :init
  (define-prefix-command 'cql-comma-map)
  (evil-define-key '(normal visual motion emacs) cql-mode-map (kbd ",") 'cql-comma-map))


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
  (setq-default markdown-hide-markup t)
  (add-hook 'markdown-mode-hook 'visual-line-mode)
  (add-hook 'markdown-mode-hook 'variable-pitch-mode)
  (add-hook 'markdown-mode-hook 'flyspell-mode))


;;;----------------------------------------------------------------------
;;; Editing Javascript
(use-package js
  :ensure nil
  :config
  (setq-default js-indent-level 2))


;;;----------------------------------------------------------------------
;;; Editing Graphql
(use-package graphql
  :ensure t)

;;;----------------------------------------------------------------------
;;; Editing shells
(use-package fish-mode
  :ensure t)

;;;----------------------------------------------------------------------
;;; Editing CSV files is basically programming
(use-package csv-mode
  :ensure t)

;;;------------------------------------------------------------------------------
;;; Same for editing yaml
(use-package yaml-mode
  :ensure t)

;;;------------------------------------------------------------------------------
;;; Haskell
;;; Very basic setup, really just for editing xmonad config
(use-package haskell-mode
  :ensure t

  :init
  (define-prefix-command 'haskell-comma-map)
  (evil-define-key '(normal visual motion emacs) haskell-mode-map (kbd ",") 'haskell-comma-map)

  :bind (:map haskell-comma-map
              ("c" . compile)))
