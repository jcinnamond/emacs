(use-package ivy
  :ensure t
  :commands ivy-mode
  :defer t
  :init
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d) ")
  (use-package ivy-rich
    :ensure t
    :commands ivy-rich-mode
    :functions ivy-format-function ivy-format-function-line
    :defer t
    :init
    (ivy-rich-mode 1)
    (setq ivy-format-function #'ivy-format-function-line))
  (use-package ivy-hydra
    :ensure t))

(use-package counsel
  :ensure t
  :defer t)

;; `prescient` orders ivy suggestions based on usage
(use-package prescient
  :ensure t
  :commands prescient-persist-mode
  :defer t
  :config
  (prescient-persist-mode 1))

(use-package ivy-prescient
  :ensure t
  :commands ivy-prescient-mode
  :defer t
  :init
  (ivy-prescient-mode 1))
