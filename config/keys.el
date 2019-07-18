;; Use evil mode for vi like keybindings
(use-package evil
  :ensure t
  :init
  (evil-mode t))

;; Helpers for wrapping the selection in parens, quotes, etc
(use-package evil-surround
  :ensure t
  :functions global-evil-surround-mode
  :config
  (global-evil-surround-mode t))

;; Use which-key to prompt during key sequences
(use-package which-key
  :ensure t
  :defer t
  :init
  (which-key-mode))
