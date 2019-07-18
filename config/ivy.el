(use-package ivy
  :ensure t
  :functions ivy-mode
  :defer t
  :init
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d) ")
  (use-package ivy-rich
    :ensure t
    :functions ivy-rich-mode ivy-format-function ivy-format-function-line
    :defer t
    :init
    (ivy-rich-mode 1)
    (setq ivy-format-function #'ivy-format-function-line))
  (use-package ivy-hydra
    :ensure t))

(use-package counsel
  :ensure t
  :defer t)

(use-package prescient
  :ensure t
  :functions prescient-persist-mode
  :defer t
  :config
  (prescient-persist-mode 1))

(use-package ivy-prescient
  :ensure t
  :functions ivy-prescient-mode
  :defer t
  :init
  (ivy-prescient-mode 1))
