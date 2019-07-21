;;; This config installs ivy/swiper/counsel to provide an interactive
;;; completion interface. Most obviously, this replaces completing
;;; read functions from the minibuffer.
(use-package ivy
  :ensure t
  :commands ivy-mode
  :init
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d) ")
  (which-key-add-key-based-replacements "SPC s" "Searching")
  :bind (:map space-map
              ("s b" . swiper-all)
              ("s s" . swiper)))

(use-package ivy-hydra :ensure t)

(use-package ivy-rich
  :ensure t
  :commands ivy-rich-mode
  :functions ivy-format-function ivy-format-function-line
  :init
  (ivy-rich-mode 1)
  (setq ivy-format-function #'ivy-format-function-line))

(use-package counsel
  :ensure t
  :commands counsel-M-x counsel-switch-buffer counsel-find-file counsel-recentf
  :bind (([remap execute-extended-command] . 'counsel-M-x)
         ([remap find-file] . 'counsel-find-file)
         ([remap switch-to-buffer] . 'counsel-switch-buffer)
         :map space-map
         ("f r" . 'counsel-recentf)))

;; `prescient` orders ivy suggestions based on usage
(use-package prescient
  :ensure t
  :commands prescient-persist-mode
  :config
  (prescient-persist-mode 1))

(use-package ivy-prescient
  :ensure t
  :commands ivy-prescient-mode
  :init
  (ivy-prescient-mode 1))
