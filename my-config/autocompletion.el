(use-package company
  :ensure t
  :defer t
  :after yasnippet
  :init
  (use-package company-prescient
    :ensure t
    :commands company-prescient-mode
    :init
    (company-prescient-mode 1))
  :config
  (define-key company-active-map [tab] yas-maybe-expand))

(add-hook 'after-init-hook 'global-company-mode)

(use-package yasnippet
  :ensure t
  :commands yas-global-mode
  :defines yas-maybe-expand
  :init
  (setq yas-snippet-dirs '("~/.emacs.d/my-snippets"))
  (yas-global-mode 1)
  :config
  (evil-define-key 'insert 'yas-minor-mode-map (kbd "TAB") yas-maybe-expand)
  (evil-define-key '(normal visual motion emacs) 'global (kbd "TAB") yas-maybe-expand)

  (define-prefix-command 'snippet-comma-map)
  (evil-define-key '(normal visual motion emacs) snippet-mode-map (kbd ",") 'snippet-comma-map)
  (define-key 'snippet-comma-map (kbd "l") 'yas-load-snippet-buffer))

(use-package yasnippet-snippets
  :ensure t)
