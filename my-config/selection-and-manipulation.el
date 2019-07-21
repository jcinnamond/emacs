;;; Various helpers for selecting regions, or manipulating selections.

;;;----------------------------------------------------------------------
;;; Selecting things
(use-package expand-region
  :ensure t
  :commands er/expand-region
  :bind (:map space-map
              ("v" . 'er/expand-region)))

(defun jc-select-current-line()
  "Select the current line unless the mark is already active"
  (interactive)
  (end-of-line)
  (set-mark (line-beginning-position)))

(use-package evil
  :bind (:map evil-visual-state-map
	      ("a l" . 'jc-select-current-line)))


;;;----------------------------------------------------------------------
;;; Multiple cursors
(use-package iedit :ensure t)

(use-package evil-iedit-state :ensure t)

(use-package evil-mc
  :ensure t
  :commands global-evil-mc-mode
  :init
  (global-evil-mc-mode)
  (evil-define-key 'visual evil-mc-key-map
    "A" #'evil-mc-make-cursor-in-visual-selection-end
    "I" #'evil-mc-make-cursor-in-visual-selection-beg))


;;;----------------------------------------------------------------------
;;; Duplicating or commenting selections
(use-package duplicate-thing
  :ensure t
  :commands duplicate-thing
  :bind (:map space-map
	      ("d" . 'duplicate-thing)))

(use-package comment-dwim-2
  :ensure t
  :commands comment-dwim-2
  :bind (:map space-map
              ("c l" . 'comment-dwim-2)))
