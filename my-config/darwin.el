(set-face-attribute 'default nil :height 130)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin" (concat ":" (getenv "HOME") "/bin")))
(setq exec-path (append exec-path `("/usr/local/bin" ,(concat (getenv "HOME") "/bin"))))

(setq-default darwin-config-loaded "true")

(setq ispell-program-name "/usr/local/bin/aspell")

;; The key combination for # on a mac with UK layout it option-3 because :shrug:
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

;; Don't quit emacs when I really mean 'reformat paragraph' (alt-q is pretty close to command-q, but the latter is not cool)
(global-unset-key (kbd "s-q"))
