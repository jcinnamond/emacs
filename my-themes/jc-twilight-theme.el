;; -*- eval: (rainbow-mode) -*-

(require 'color)

(deftheme jc-twilight "Dark theme inspired by https://github.com/ianpan870102/twilight-emacs-theme/blob/master/twilight-theme.el")

(let* ((color-fg "#d7d7d7")
       (color-bg "#000000")
       (color-bg1 "#171717")
       (color-bg2 "#252525")
       (color-bg3 "#373737")
       (color-bg4 "#484848")

       (base-color "#cf6a4c")
       (pop-color "#ef4a4c")

       (color-desaturate-0 (color-lighten-name (color-desaturate-name base-color 20) 00))
       (color-desaturate-1 (color-lighten-name (color-desaturate-name base-color 40) 10))
       (color-desaturate-2 (color-desaturate-name pop-color 90))

       (color-dark-0 (color-desaturate-name (color-darken-name pop-color 30) 10))

       (color-orange "#DF8615")
       (color-green "#65b016")
       (color-red "#f73a18")

       (color-background color-bg)
       (color-subtle-background color-bg1)
       (color-inactive-background color-bg3)

       (color-foreground color-fg)
       (color-comment color-desaturate-1)
       (color-keyword color-desaturate-0)
       (color-prompt color-desaturate-0)
       (color-constant color-desaturate-2)

       (color-highlight-background color-dark-0)
       (color-highlight-subtle-background color-bg3)
       (color-highlight-foreground color-foreground)
       (color-standout base-color)
       (color-diminshed color-desaturate-2)
       (color-subtle color-desaturate-1)

       (color-menu-background color-bg2)
       (color-menu-selection-background color-bg4)

       (color-success color-green)
       (color-warning color-orange)
       (color-error color-red)

       (added-color (color-desaturate-name (color-darken-name color-success 20) 20))
       (removed-color (color-desaturate-name (color-darken-name color-error 25) 20)))

  (custom-theme-set-faces
   'jc-twilight

   `(bold ((t (:weight bold))))
   `(bold-italic ((t (:weight bold :slant italic))))
   `(default ((t (:foreground ,color-foreground :background ,color-background))))
   `(error ((t (:foreground ,color-error :weight bold))))
   `(italic ((t (:slant italic))))
   `(shadow ((t (:foreground ,color-foreground))))
   `(underline ((t (:underline t))))
   `(warning ((t (:foreground ,color-warning))))

   `(font-lock-comment-face ((t (:foreground ,color-comment :slant normal))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,color-comment :slant normal))))
   `(font-lock-doc-face ((t (:foreground ,color-diminshed))))
   `(font-lock-string-face ((t (:foreground ,color-foreground))))
   `(font-lock-warning-face ((t (:foreground ,color-warning))))

   `(font-lock-builtin-face ((t (:foreground ,color-foreground))))
   `(font-lock-constant-face ((t (:foreground ,color-constant))))
   `(font-lock-function-name-face ((t (:foreground ,color-foreground weight: normal))))
   `(font-lock-keyword-face ((t (:foreground ,color-keyword))))
   `(font-lock-negation-char-face ((t (:foreground ,color-foreground))))
   `(font-lock-preprocessor-face ((t (:foreground ,color-foreground))))
   `(font-lock-reference-face ((t (:foreground ,color-foreground))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,color-foreground))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,color-foreground))))
   `(font-lock-type-face ((t (:foreground ,color-foreground :weight normal))))
   `(font-lock-variable-name-face ((t (:foreground ,color-foreground))))

   ;; +--- UI ---+
   `(minibuffer-prompt ((t (:foreground ,color-prompt, :weight normal))))

   `(cursor ((t (:background ,color-foreground))))
   `(border ((t (:background ,color-background))))
   `(highlight ((t (:foreground ,color-highlight-foreground :background ,color-highlight-background))))
   `(hl-line ((t (:background ,color-subtle-background))))
   `(isearch ((t (:foreground ,color-standout :background ,color-highlight-subtle-background))))
   `(isearch-fail ((t (:background ,color-background :foreground ,color-error))))
   `(lazy-highlight ((t (:inherit isearch ,color-standout :background ,color-background))))
   `(link ((t (:underline t))))
   `(link-visited ((t (:underline t))))
   `(linum ((t (:foreground ,color-foreground :background ,color-menu-background))))
   `(match ((t (:inherit isearch))))
   `(next-error ((t (:inherit error))))
   `(nobreak-space ((t (:foreground ,color-foreground))))
   `(region ((t (:foreground ,color-foreground :background ,color-highlight-background))))
   `(trailing-whitespace ((t (:strike-through ,color-standout))))
   `(vertical-border ((t (:foreground ,color-foreground))))
   `(window-divider ((t (:background ,color-background))))
   `(window-divider-first-pixel ((t (:background ,color-background))))
   `(window-divider-last-pixel ((t (:background ,color-background))))

   ;; Auto dim other buffers
   `(auto-dim-other-buffers-face ((t (:foreground ,color-diminshed :background ,color-inactive-background))))

   ;; > Flycheck & Flyspell
   `(flycheck-error ((t (:underline (:style wave :color ,color-error) :foreground ,color-error))))
   `(flycheck-warning ((t (:underline (:style wave :color ,color-warning) :foreground ,color-foreground))))
   `(flycheck-info ((t (:underline (:style wave)))))
   `(flycheck-fringe-error ((t (:foreground ,color-error))))
   `(flycheck-fringe-info ((t (:foreground ,color-warning))))
   `(flycheck-fringe-warning ((t (:foreground ,color-warning))))
   `(flyspell-incorrect ((t (:underline (:style line :color ,color-error)))))
   `(flyspell-duplicate ((t (:underline (:style line :color ,color-error)))))

   ;; > Compliation
   `(compilation-info ((t (:foreground ,color-success))))
   `(compilation-error ((t (:foreground ,color-error))))

   ;; > Diff
   `(diff-header ((t (:foreground ,color-foreground :background ,color-highlight-background))))

   ;; > Mode line
   `(mode-line ((t (:foreground ,color-highlight-foreground :background ,color-highlight-background))))
   `(mode-line-inactive ((t (:foreground ,color-foreground :background ,color-menu-background))))

   ;; > Ivy
   `(ivy-current-match ((t (:background ,color-menu-selection-background :foreground ,color-foreground))))
   `(ivy-minibuffer-match-face-1 ((t (:foreground ,color-standout))))
   `(ivy-posframe ((t (:background ,color-menu-background))))

   ;; > Org mode
   `(org-level-1 ((t (:foreground ,color-keyword :height 1.4))))
   `(org-level-2 ((t (:height 1.0))))
   `(org-level-3 ((t (:height 1.0))))
   `(org-level-4 ((t (:height 1.0))))
   `(org-todo ((t (:foreground ,color-keyword :weight bold :height 0.8))))
   `(org-done ((t (:foreground ,color-diminshed :weight normal :height 0.8))))
   `(org-headline-done ((t (:inherit org-done :strike-through t :height 1.2))))
   `(org-block-begin-line ((t (:foreground ,color-foreground :background ,color-background))))
   `(org-block-end-line ((t (:foreground ,color-foreground :background ,color-background))))
   `(org-block-background ((t (:foreground ,color-foreground :background ,color-highlight-background))))

   ;; Markdown
   `(markdown-header-face ((t (:foreground ,color-keyword))))
   `(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.4))))

   ;; > Magit
   `(magit-hash ((t (:foreground ,color-diminshed))))
   `(magit-section-heading ((t (:foreground ,color-foreground :weight normal))))
   `(magit-filename ((t (:foreground ,color-foreground :weight normal))))
   `(magit-section-highlight ((t (:background ,color-background))))
   `(magit-diff-context-highlight ((t (:background ,color-menu-background))))
   `(magit-diff-file-heading ((t (:foreground ,color-foreground :weight normal))))
   `(magit-diff-hunk-heading ((t (:foreground ,color-foreground :weight normal :background ,color-background))))
   `(magit-diff-hunk-heading-highlight ((t (:foreground ,color-foreground :weight normal :background ,color-background))))
   `(magit-diff-removed ((t (:foreground ,color-foreground :background ,removed-color))))
   `(magit-diff-removed-highlight ((t (:foreground ,color-foreground :background ,removed-color))))
   `(magit-diff-added ((t (:foreground ,color-foreground :background ,added-color))))
   `(magit-diff-added-highlight ((t (:foreground ,color-foreground :background ,added-color))))
   `(magit-branch-local ((t (:foreground ,color-subtle))))
   `(magit-branch-remote ((t (:foreground ,color-subtle))))

   ;; > Eshell
   `(eshell-prompt ((t (:foreground ,color-subtle))))
   `(eshell-ls-executable ((t (:foreground ,color-foreground))))
   `(eshell-ls-directory ((t (:foreground ,color-foreground :underline t))))
   `(eshell-ls-product ((t (:foreground ,color-foreground))))

   ;; Evil
   `(evil-search-highlight-persist-highlight-face ((t (:inherit lazy-highlight))))

   ;; Company mode
   `(company-tooltip ((t (:background ,color-menu-background :foreground ,color-standout))))
   `(company-tooltip-selection ((t (:background ,color-menu-selection-background :foreground ,color-foreground))))
   `(company-tooltip-common ((t (:foreground ,color-foreground))))
   `(company-tooltip-common-selection ((t (:foreground ,color-foreground))))
   `(company-scrollbar-bg ((t (:background ,color-background))))
   `(company-scrollbar-color-fg ((t (:background ,color-background))))
   `(company-preview ((t (:foreground ,color-standout))))
   `(company-preview-common ((t (:foreground ,color-standout))))
   `(company-preview-search ((t (:background ,color-highlight-background :foreground ,color-highlight-foreground))))
   `(company-tooltip-annotation ((t (:foreground ,color-diminshed))))
   `(company-tooltip-annotation-selection ((t (:foreground ,color-diminshed))))

   ;; Which key
   `(which-key-key-face ((t (:inherit default :foreground ,color-foreground))))
   `(which-key-separator-face ((t (:inherit default :foreground ,color-foreground))))
   `(which-key-command-description-face ((t (:inherit default :foreground ,color-foreground))))
   `(which-key-posframe ((t (:background ,color-menu-background))))

   ;; Show paren
   `(show-paren-match ((t (:foreground ,color-standout))))

   ;; Shell scripts
   `(sh-quoted-exec ((t (:foreground ,color-keyword))))

   ;; LSP
   `(lsp-face-highlight-textual ((t (:inherit default :foreground ,color-standout))))
   `(lsp-ui-doc-background ((t (:background ,color-menu-background))))
   `(lsp-ui-doc-header ((t (:background ,color-highlight-background :foreground ,color-highlight-foreground))))
   `(lsp-ui-peek-peek ((t (:foreground ,color-foreground :background ,color-menu-background))))
   `(lsp-ui-peek-list ((t (:background ,color-menu-background))))
   `(lsp-ui-peek-filename ((t (:foreground ,color-subtle))))
   `(lsp-ui-peek-line-number ((t (:foreground ,color-subtle))))
   `(lsp-ui-peek-header ((t (:foreground ,color-highlight-foreground :background ,color-highlight-background))))
   `(lsp-ui-peek-footer ((t (:foreground ,color-highlight-foreground :background ,color-highlight-background))))
   `(lsp-ui-peek-selection ((t (:foreground ,color-foreground :background ,color-menu-selection-background))))
   `(lsp-ui-peek-highlight ((t (:foreground ,color-standout))))
   `(lsp-ui-sideline-code-action ((t (:foreground ,color-standout))))
   ))

(provide-theme 'jc-twilight)
