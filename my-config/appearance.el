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
		    :weight 'normal
		    :width 'normal)

(set-face-attribute 'variable-pitch nil
                    :weight 'light
                    :width 'normal)
;; Set the font size in OS specific config or in local config files,
;; depending on screen configuration.

;; Load the theme and set a key binding to switch themes
(load-theme 'jc-terminal)

(define-key space-map (kbd "t") 'counsel-load-theme)
(which-key-add-key-based-replacements "SPC t" "Theme")

;; Install rainbow-mode to colorize strings that define colors
(use-package rainbow-mode :ensure t)

;; Highlight matching parens
(show-paren-mode 1)

;; Highlight the current line
(global-hl-line-mode 1)

;; Set up the mode line
(require 'jc-mode-line)
(jc-mode-line-init)

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

;; Dim inactive windows
;; (use-package auto-dim-other-buffers

;;------------------------------------------------------------------------------
;; Functions for zooming in/out
(defvar jc--zoom-original-size nil "stores the height of the default face before zooming in")

(defun jc/zoom-in ()
  "Increase the default font size, useful for screen sharing & pair programming"
  (interactive)
  (let ((current-height (face-attribute 'default :height)))
    (jc--ensure-original-zoom-stored current-height)
    (jc--zoom-to (* current-height 1.4))))

(defun jc/zoom-out ()
  "Decrease the default font size"
  (interactive)
  (let ((current-height (face-attribute 'default :height)))
    (jc--ensure-original-zoom-stored current-height)
    (jc--zoom-to (/ current-height 1.4))))

(defun jc/zoom-reset ()
  "Reset the original default font size"
  (interactive)
  (if jc--zoom-original-size
      (jc--zoom-to jc--zoom-original-size)))

(defun jc--ensure-original-zoom-stored (height)
  "Store 'height' as the original face size unless it has previously been set. This can be used to restore the original size after zooming."
  (if (not jc--zoom-original-size)
      (setq jc--zoom-original-size (face-attribute 'default :height))))

(defun jc--zoom-to (height)
  "Helper for setting the default face height and resizing the frame"
  (set-face-attribute 'default nil :height (floor height))
  (set-frame-parameter nil 'fullscreen 'maximized))

;;------------------------------------------------------------------------------
;; Ligature support when using firacode
(use-package fira-code-mode
  :ensure t
  :hook prog-mode)
