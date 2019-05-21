(set-face-attribute 'default nil
		    :family "Source Code Pro"
		    :height 210
		    :weight 'normal
		    :width 'normal)

(load-theme 'jc-dark)

(define-key space-map (kbd "t") 'counsel-load-theme)
(which-key-add-key-based-replacements "SPC t" "Theme")

(use-package rainbow-mode
  :ensure t)

(require 'jc-mode-line)
(jc-mode-line-init)
