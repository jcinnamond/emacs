;; -*- lexical-binding: t -*-

;;; This config is responsible for two main functions. First, it
;;; setups up evil mode to give me vi-style keybindings. Next, it
;;; creates a global keymap based on the <space> leader key (an idea
;;; stolen from spacemacs).


;;;----------------------------------------------------------------------
;;; Set up vi-style keybindings

(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-colemak-dh)
  (meow-motion-overwrite-define-key
   ;; Use e to move up, n to move down.
   ;; Since special modes usually use n to move down, we only overwrite e here.
   '("e" . meow-prev)
   '("<escape>" . ignore)
   '("<SPC>" . space-map))
  (meow-normal-define-key
   '("0" . meow-expand-0)
   '("1" . meow-expand-1)
   '("2" . meow-expand-2)
   '("3" . meow-expand-3)
   '("4" . meow-expand-4)
   '("5" . meow-expand-5)
   '("6" . meow-expand-6)
   '("7" . meow-expand-7)
   '("8" . meow-expand-8)
   '("9" . meow-expand-9)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("/" . isearch-forward)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . kill-region)
   '("e" . meow-prev)
   '("E" . meow-prev-expand)
   '("f" . meow-find)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-right)
   '("I" . meow-right-expand)
   '("j" . meow-join)
   '("k" . meow-kill)
   '("l" . meow-line)
   '("L" . meow-goto-line)
   '("m" . meow-mark-word)
   '("M" . meow-mark-symbol)
   '("n" . meow-next)
   '("N" . meow-next-expand)
   '("o" . meow-block)
   '("O" . meow-to-block)
   '("p" . yank)
   '("P" . meow-yank)
   '("q" . meow-quit)
   '("r" . meow-replace)
   '("s" . meow-insert)
   '("S" . meow-open-above)
   '("t" . meow-till)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-search)
   '("w" . meow-next-word)
   '("W" . meow-next-symbol)
   '("x" . meow-delete)
   '("X" . meow-backward-delete)
   '("y" . kill-ring-save)
   '("z" . meow-pop-selection)
   '(":" . execute-extended-command)
   '("'" . repeat)
   '("<escape>" . ignore)))

(use-package meow
  :ensure t
  :config
  (meow-setup)
  :init
  (meow-global-mode t))


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
  (setq which-key-posframe-border-width 3)
  (which-key-posframe-mode 1))


;;;----------------------------------------------------------------------
;;; Set up global keymap using <space> as the leader key. Other parts
;;; of the configuration might add to this keymap as they define extra
;;; functionality.
(define-prefix-command 'space-map)
(keymap-unset meow-normal-state-keymap "<SPC>")
(keymap-set meow-normal-state-keymap "<SPC>" 'space-map)

;; Emacs
(define-key space-map (kbd "SPC") 'execute-extended-command)
(define-key space-map (kbd ":") 'eval-expression)

;; Buffers
(define-key space-map (kbd "TAB") (lambda () (interactive) (switch-to-buffer (other-buffer))))
(define-key space-map (kbd "b b") 'switch-to-buffer)
(define-key space-map (kbd "b d") 'kill-current-buffer)
(define-key space-map (kbd "b k") 'kill-buffer)
(define-key space-map (kbd "b j") 'ibuffer)
(define-key space-map (kbd "b o") 'switch-to-buffer-other-window)

(keymap-global-set "C-<tab>" 'switch-to-buffer)

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
(define-key space-map (kbd "h F") 'describe-face)
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

;; Projects
(keymap-set space-map "p d" 'project-dired)
(keymap-set space-map "p f" 'project-find-file)
(keymap-set space-map "p m" 'magit-project-status)
(keymap-set space-map "p p" 'project-switch-project)
(keymap-set space-map "p s" 'project-eshell)

;; Quickly jump to todo/journal/notes
(define-key space-map (kbd "J") 'org-journal-new-entry)
(define-key space-map (kbd "N") (lambda () (interactive) (find-file "~/notes.org")))
(define-key space-map (kbd "T") (lambda () (interactive) (find-file "~/todo.org")))

;; Undo tree
(define-key space-map (kbd "u") 'undo-tree-visualize)

;; Windows
(define-key space-map (kbd "w q") 'server-edit)
(define-key space-map (kbd "w w") 'other-window)
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
  (which-key-add-key-based-replacements "SPC T" "Jump to journal")
  (which-key-add-key-based-replacements "SPC n" "Narrowing")
  (which-key-add-key-based-replacements "SPC p" "Projects")
  (which-key-add-key-based-replacements "SPC N" "Jump to notes")
  (which-key-add-key-based-replacements "SPC T" "TODO")
  (which-key-add-key-based-replacements "SPC u" "Undo tree")
  (which-key-add-key-based-replacements "SPC w" "Windows")
  (which-key-add-key-based-replacements "SPC z" "Zoom"))

;;;----------------------------------------------------------------------
;;; Set a mode specific leader map, for commands such as compile or eval
(define-prefix-command 'comma-map)
(keymap-unset meow-normal-state-keymap ",")

;;;----------------------------------------------------------------------
;;; Set up some global keys
(keymap-global-set "C-'" 'eshell)
(keymap-global-unset "C-s")
(keymap-global-set "C-s" 'save-buffer)
(keymap-global-unset "C-w")
(keymap-global-set "C-w" 'kill-current-buffer)
