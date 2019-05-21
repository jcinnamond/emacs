;; Set up menus starting with <space>
(define-prefix-command 'space-map)
(evil-define-key '(normal visual motion emacs) 'global (kbd "SPC") 'space-map)
(evil-define-key '(normal visual motion emacs) 'magit-mode-map (kbd "SPC") 'space-map)

;; Emacs
(define-key space-map (kbd "SPC") 'counsel-M-x)

;; Buffers
(define-key space-map (kbd "TAB") (lambda () (interactive) (switch-to-buffer (other-buffer))))
(define-key space-map (kbd "b b") 'ivy-switch-buffer)
(define-key space-map (kbd "b d") 'evil-delete-buffer)
(define-key space-map (kbd "b k") 'kill-buffer)
(define-key space-map (kbd "b j") 'ibuffer)

;; Compile / Comments
(define-key space-map (kbd "c c") 'compile)
(define-key space-map (kbd "c k") 'kill-compilation)
(define-key space-map (kbd "c r") 'recompile)

;; Errors
(define-key space-map (kbd "e n") 'next-error)
(define-key space-map (kbd "e p") 'previous-error)

;; Files
(define-key space-map (kbd "f D") 'delete-current-buffer-file)
(define-key space-map (kbd "f e") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))
(define-key space-map (kbd "f f") 'counsel-find-file)
(define-key space-map (kbd "f j") 'dired-jump)
(define-key space-map (kbd "f R") 'rename-current-buffer-file)
(define-key space-map (kbd "f r") 'counsel-recentf)
(define-key space-map (kbd "f s") 'save-some-buffers)

;; File variables
(define-key space-map (kbd "f v d") 'add-dir-local-variable)
(define-key space-map (kbd "f v f") 'add-file-local-variable)

;; Git
(define-key space-map (kbd "g s") 'magit-status)

;; Insert
(define-key space-map (kbd "i i") 'insert-char)

;; Narrowing
(define-key space-map (kbd "n f") 'narrow-to-defun)
(define-key space-map (kbd "n k") 'narrow-to-defun-include-comments)
(define-key space-map (kbd "n r") 'narrow-to-region)
(define-key space-map (kbd "n w") 'widen)

;; Searching
(define-key space-map (kbd "s b") 'swiper-all)
(define-key space-map (kbd "s s") 'swiper)

;; Windows
(define-key space-map (kbd "w w") 'evil-window-next)
(define-key space-map (kbd "w h") 'evil-window-left)
(define-key space-map (kbd "w j") 'evil-window-down)
(define-key space-map (kbd "w k") 'evil-window-up)
(define-key space-map (kbd "w l") 'evil-window-right)
(define-key space-map (kbd "w d") 'delete-window)
(define-key space-map (kbd "w m") 'delete-other-windows)
(define-key space-map (kbd "w /") 'split-window-right)
(define-key space-map (kbd "w _") 'split-window-below)

;; Set up the prompts in which-key
(use-package which-key
  :defer t
  :functions which-key-add-key-based-replacements
  :config
  (which-key-add-key-based-replacements "SPC TAB" "Alternate buffer")
  (which-key-add-key-based-replacements "SPC b" "Buffers")
  (which-key-add-key-based-replacements "SPC e" "Errors")
  (which-key-add-key-based-replacements "SPC c" "Compile / Comments")
  (which-key-add-key-based-replacements "SPC f" "Files")
  (which-key-add-key-based-replacements "SPC f e" "Emacs config")
  (which-key-add-key-based-replacements "SPC f v" "File variables")
  (which-key-add-key-based-replacements "SPC g" "Git")
  (which-key-add-key-based-replacements "SPC i" "Insert")
  (which-key-add-key-based-replacements "SPC n" "Narrowing")
  (which-key-add-key-based-replacements "SPC s" "Searching")
  (which-key-add-key-based-replacements "SPC w" "Windows"))
