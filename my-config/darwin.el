(set-face-attribute 'default nil :height 130)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin:~/bin"))
(setq exec-path (append exec-path '("/usr/local/bin" "~/bin")))

(setq-default darwin-config-loaded "true")

(setq ispell-program-name "/usr/local/bin/aspell")
