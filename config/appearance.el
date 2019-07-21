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

(if (string= (system-name) "windy")
    (set-face-attribute 'default nil :height 210))

;; Load the theme and set a key binding to switch themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
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

;; Start in fullscreen
(set-frame-parameter nil 'fullscreen 'nil)
