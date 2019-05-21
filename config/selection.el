(use-package expand-region
  :ensure t
  :functions er/expand-region
  :bind (:map space-map
              ("v" . 'er/expand-region)))

(use-package iedit
  :ensure t)

(use-package evil-iedit-state
  :ensure t
  :commands evil-iedit-state/iedit-mode)

(use-package evil-mc
  :ensure t
  :functions global-evil-mc-mode
  :init
  (global-evil-mc-mode)
  (evil-define-key 'visual evil-mc-key-map
    "A" #'evil-mc-make-cursor-in-visual-selection-end
    "I" #'evil-mc-make-cursor-in-visual-selection-beg))

(use-package ag
  :ensure t
  :commands ag)

