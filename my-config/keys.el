;;; This config is responsible for two main functions. First, it
;;; setups up evil mode to give me vi-style keybindings. Next, it
;;; creates a global keymap based on the <space> leader key (an idea
;;; stolen from spacemacs).


;;;----------------------------------------------------------------------
;;; Set up vi-style keybindings

;; Use evil mode for vi like keybindings
(use-package evil
  :ensure t
  :init
  (evil-mode t)
  :config
  (setq-default evil-want-Y-yank-to-eol t))

;; Helpers for wrapping the selection in parens, quotes, etc
(use-package evil-surround
  :ensure t
  :commands global-evil-surround-mode
  :init
  (global-evil-surround-mode t))


;;;----------------------------------------------------------------------
;;; Use which-key to prompt during key sequences
(use-package which-key
  :ensure t
  :commands which-key-mode
  :init
  (which-key-mode))

(use-package which-key-posframe
  :ensure t
  :defines which-key-posframe-poshandler which-key-posframe-border-width
  :hook (which-key-mode . which-key-posframe-mode)
  :config
  (setq which-key-posframe-poshandler 'posframe-poshandler-frame-bottom-center)
  (setq which-key-posframe-border-width 10)
  (which-key-posframe-mode 1))


;;;----------------------------------------------------------------------
;;; Set up global keymap using <space> as the leader key. Other parts
;;; of the configuration might add to this keymap as they define extra
;;; functionality.
(define-prefix-command 'space-map)
(evil-define-key '(normal visual motion emacs) 'global (kbd "SPC") 'space-map)
(evil-define-key '(normal visual motion emacs) 'magit-mode-map (kbd "SPC") 'space-map)

;; Emacs
(define-key space-map (kbd "SPC") 'execute-extended-command)
(define-key space-map (kbd ":") 'eval-expression)

;; Buffers
(define-key space-map (kbd "TAB") (lambda () (interactive) (switch-to-buffer (other-buffer))))
(define-key space-map (kbd "b b") 'switch-to-buffer)
(define-key space-map (kbd "b d") 'evil-delete-buffer)
(define-key space-map (kbd "b k") 'kill-buffer)
(define-key space-map (kbd "b j") 'ibuffer)
(define-key space-map (kbd "b o") 'switch-to-buffer-other-window)

(defun peek-buffer (buffer-or-name)
  "Open buffer in another window without focusing"
  (interactive (list (read-buffer-to-switch "Peek buffer: ")))
  (let ((pop-up-windows t))
    (pop-to-buffer buffer-or-name nil nil)
    (other-window -1)))
(define-key space-map (kbd "b p") 'peek-buffer)

;; Compile / Comments
(define-key space-map (kbd "c c") 'compile)
(define-key space-map (kbd "c k") 'kill-compilation)
(define-key space-map (kbd "c r") 'recompile)

;; Errors
(define-key space-map (kbd "e j") 'flycheck-next-error)
(define-key space-map (kbd "e k") 'flycheck-previous-error)
(define-key space-map (kbd "e n") 'next-error)
(define-key space-map (kbd "e p") 'previous-error)

;; Files
(define-key space-map (kbd "f D") 'delete-current-buffer-file)
(define-key space-map (kbd "f e") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))
(define-key space-map (kbd "f f") 'find-file)
(define-key space-map (kbd "f i") 'insert-file)
(define-key space-map (kbd "f j") 'dired-jump)
(define-key space-map (kbd "f R") 'rename-current-buffer-file)
(define-key space-map (kbd "f o") 'find-file-other-window)
(define-key space-map (kbd "f t") (lambda () (interactive) (set-buffer-modified-p t) (save-buffer)))
(define-key space-map (kbd "f y") 'my-config/copy-filename-in-project)

;; File variables
(define-key space-map (kbd "f v d") 'add-dir-local-variable)
(define-key space-map (kbd "f v f") 'add-file-local-variable)

;; Help
(define-key space-map (kbd "h f") 'describe-function)
(define-key space-map (kbd "h j") 'find-function)
(define-key space-map (kbd "h k") 'describe-key)
(define-key space-map (kbd "h m") 'describe-mode)
(define-key space-map (kbd "h v") 'describe-variable)

;; Insert
(define-key space-map (kbd "i i") 'insert-char)

;; Narrowing
(define-key space-map (kbd "n f") 'narrow-to-defun)
(define-key space-map (kbd "n k") 'narrow-to-defun-include-comments)
(define-key space-map (kbd "n r") 'narrow-to-region)
(define-key space-map (kbd "n w") 'widen)

;; Quickly jump to my todo list
(define-key space-map (kbd "T") (lambda () (interactive) (find-file "~/todo.org")))

;; Undo tree
(define-key space-map (kbd "u") 'undo-tree-visualize)

;; Windows
(define-key space-map (kbd "w q") 'server-edit)
(define-key space-map (kbd "w w") 'evil-window-next)
(define-key space-map (kbd "w h") 'evil-window-left)
(define-key space-map (kbd "w j") 'evil-window-down)
(define-key space-map (kbd "w k") 'evil-window-up)
(define-key space-map (kbd "w l") 'evil-window-right)
(define-key space-map (kbd "w d") 'delete-window)
(define-key space-map (kbd "w D") 'delete-frame)
(define-key space-map (kbd "w m") 'delete-other-windows)
(define-key space-map (kbd "w N") 'make-frame-command)
(define-key space-map (kbd "w o b") 'scroll-other-window-down)
(define-key space-map (kbd "w o f") 'scroll-other-window)
(define-key space-map (kbd "w v") 'delete-other-windows-vertically)
(define-key space-map (kbd "w /") 'split-window-right)
(define-key space-map (kbd "w _") 'split-window-below)

;; Zoom
(define-key space-map (kbd "z j") 'jc/zoom-in)
(define-key space-map (kbd "z k") 'jc/zoom-out)
(define-key space-map (kbd "z z") 'jc/zoom-reset)

;; Set up the prompts in which-key
(use-package which-key
  :functions which-key-add-key-based-replacements
  :config
  (which-key-add-key-based-replacements "SPC TAB" "Alternate buffer")
  (which-key-add-key-based-replacements "SPC b" "Buffers")
  (which-key-add-key-based-replacements "SPC e" "Errors")
  (which-key-add-key-based-replacements "SPC c" "Compile / Comments")
  (which-key-add-key-based-replacements "SPC f" "Files")
  (which-key-add-key-based-replacements "SPC f e" "Emacs config")
  (which-key-add-key-based-replacements "SPC f t" "Touch file")
  (which-key-add-key-based-replacements "SPC f v" "File variables")
  (which-key-add-key-based-replacements "SPC h" "Help")
  (which-key-add-key-based-replacements "SPC i" "Insert")
  (which-key-add-key-based-replacements "SPC n" "Narrowing")
  (which-key-add-key-based-replacements "SPC T" "TODO")
  (which-key-add-key-based-replacements "SPC u" "Undo tree")
  (which-key-add-key-based-replacements "SPC w" "Windows")
  (which-key-add-key-based-replacements "SPC z" "Zoom"))
