;;; Set up the theme, font and modeline. This config also sets up some
;;; appearance related emacs defaults.

;; Strip back the emacs UI
(setq inhibit-startup-message t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)

;; Set the default font
(set-face-attribute 'default nil
		    :family "Source Code Pro"
		    :weight 'normal
		    :width 'normal)

(set-face-attribute 'variable-pitch nil
                    :family "Helvetica Neue"
                    :weight 'light
                    :width 'normal)
;; Set the font size in OS specific config or in local config files,
;; depending on screen configuration.

;; Load the theme and set a key binding to switch themes
(load-theme 'jc-dark)

(define-key space-map (kbd "t") 'counsel-load-theme)
(which-key-add-key-based-replacements "SPC t" "Theme")

;; Install rainbow-mode to colorize strings that define colors
(use-package rainbow-mode :ensure t)

;; Highlight matching parens
(show-paren-mode 1)

;; Set up the mode line
(require 'jc-mode-line)
(jc-mode-line-init)

;; Better org mode appearance
(use-package org
  :config
  (setq-default org-todo-keywords
                '((sequence "TODO" "|" "DONE" "ABANDONED")))
  (setq-default org-startup-folded nil)
  (setq-default org-hide-leading-stars t)
  (setq-default org-fontify-whole-heading-line t)
  (setq-default org-fontify-done-headline t)
  (setq-default org-hide-emphasis-markers t)
  (setq-default org-cycle-separator-lines -1)
  (add-hook 'org-mode-hook 'org-indent-mode)
  (add-hook 'org-mode-hook 'variable-pitch-mode))

;;------------------------------------------------------------------------------
;; Show indents
(use-package highlight-indent-guides
  :ensure t
  :hook (prog-mode . highlight-indent-guides-mode)
  :defines highlight-indent-guides-method highlight-indent-guides-character highlight-indent-guides-auto-character-face-perc
  :config
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-character 9615)
  (setq highlight-indent-guides-auto-character-face-perc 20))

;;----------------------------------------------------------------------
;; Increase the font size when sharing the screen

(defvar screen-sharing--active nil)
(defvar screen-sharing--previous-height nil)

(defun screen-sharing/on ()
  "Turns on pair mode"
  (interactive)
  (if (not screen-sharing--active)
      (progn
        (setq screen-sharing--previous-height (face-attribute 'default :height))
        (set-face-attribute 'default nil :height (floor (* 1.3 screen-sharing--previous-height)))
        (global-linum-mode t)
        (setq screen-sharing--active t))))

(defun screen-sharing/off ()
  "Turns off pair mode"
  (interactive)
  (if (and screen-sharing--active (bound-and-true-p screen-sharing--previous-height))
      (progn
        (set-face-attribute 'default nil :height screen-sharing--previous-height)
        (global-linum-mode -1)
        (setq screen-sharing--active nil))))

(defun screen-sharing/toggle ()
  "Toggle pair mode on and off"
  (interactive)
  (if screen-sharing--active
      (screen-sharing/off)
    (screen-sharing/on)))
