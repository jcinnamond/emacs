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
