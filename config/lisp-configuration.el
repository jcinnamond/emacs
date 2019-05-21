(use-package emacs-lisp-mode
  :defer t
  :init
  (define-prefix-command 'elisp-comma-map)
  (evil-define-key '(normal visual motion emacs) emacs-lisp-mode-map (kbd ",") 'elisp-comma-map)
  (define-key 'elisp-comma-map (kbd "e b") 'eval-buffer)
  (define-key 'elisp-comma-map (kbd "e e") 'eval-last-sexp)
  (define-key 'elisp-comma-map (kbd "e r") 'eval-region)
  (define-key 'elisp-comma-map (kbd "c") 'emacs-lisp-byte-compile))

(use-package auto-compile
  :ensure t
  :functions auto-compile-on-save-mode auto-compile-on-load-mode
  :init
  (auto-compile-on-save-mode 1)
  (auto-compile-on-load-mode 1))
