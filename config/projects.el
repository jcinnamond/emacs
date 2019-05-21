(use-package projectile
  :ensure t
  :init
  (define-key space-map (kbd "p b") 'counsel-projectile-switch-to-buffer)
  (define-key space-map (kbd "p f") 'counsel-projectile)
  (define-key space-map (kbd "p p") 'counsel-projectile-switch-project)
  (define-key space-map (kbd "p s") 'counsel-projectile-ag)
  (define-key space-map (kbd "p t") 'projectile-toggle-between-implementation-and-test)

  (use-package counsel-projectile
    :ensure t)

  (use-package which-key
    :functions which-key-add-key-based-replacements
    :config
    (which-key-add-key-based-replacements "SPC p" "Projects")))
