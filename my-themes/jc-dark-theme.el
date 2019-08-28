;; -*- eval: (rainbow-mode) -*-

(require 'color)

(deftheme jc-dark "My minimalist, dark theme")

(let* ((color-background "#151515")
       (color-foreground "#D6D6D6")

       (color-0 "#808a87")
       (color-1 "#ae8f63")
       (color-2 "#f73a18")
       (color-3 "#74281a") ; (color-darken-name (color-desaturate-name "#f73a18" 30) 25)

       (color-4 "#DF8615")
       (color-5 "#65b016")

       (color-highlight-background color-3)
       (color-highlight-foreground color-foreground)

       (color-menu-background (color-lighten-name color-background 5))
       (color-menu-selection-background (color-lighten-name color-background 10))

       (success color-5)
       (warning color-4)
       (error (color-darken-name color-2 10))

       (added-color (color-desaturate-name (color-darken-name success 20) 20))
       (removed-color (color-desaturate-name (color-darken-name error 25) 20)))

  (custom-theme-set-faces
   'jc-dark

   `(bold ((t (:weight bold))))
   `(bold-italic ((t (:weight bold :slant italic))))
   `(default ((t (:foreground ,color-foreground :background ,color-background))))
   `(error ((t (:foreground ,error :weight bold))))
   `(italic ((t (:slant italic))))
   `(shadow ((t (:foreground ,color-foreground))))
   `(underline ((t (:underline t))))
   `(warning ((t (:foreground ,warning))))

   `(font-lock-comment-face ((t (:foreground ,color-1 :slant normal))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,color-0 :slant normal))))
   `(font-lock-doc-face ((t (:foreground ,color-1))))
   `(font-lock-string-face ((t (:foreground ,color-foreground))))
   `(font-lock-warning-face ((t (:foreground ,warning))))

   `(font-lock-builtin-face ((t (:foreground ,color-foreground))))
   `(font-lock-constant-face ((t (:foreground ,color-0))))
   `(font-lock-function-name-face ((t (:foreground ,color-foreground weight: normal))))
   `(font-lock-keyword-face ((t (:foreground ,color-0))))
   `(font-lock-negation-char-face ((t (:foreground ,color-foreground))))
   `(font-lock-preprocessor-face ((t (:foreground ,color-foreground))))
   `(font-lock-reference-face ((t (:foreground ,color-foreground))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,color-foreground))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,color-foreground))))
   `(font-lock-type-face ((t (:foreground ,color-foreground :weight normal))))
   `(font-lock-variable-name-face ((t (:foreground ,color-foreground))))

   ;; +--- UI ---+
   `(minibuffer-prompt ((t (:foreground ,color-foreground, :weight normal))))

   `(border ((t (:foreground ,color-foreground))))
   `(cursor ((t (:background ,color-foreground))))
   `(highlight ((t (:foreground ,color-highlight-foreground :background ,color-highlight-background))))
   `(hl-line ((t (:background ,color-menu-background))))
   `(isearch ((t (:foreground ,color-2 :background ,color-menu-selection-background))))
   `(isearch-fail ((t (:background ,color-3, :foreground ,color-foreground))))
   `(lazy-highlight ((t (:inherit isearch :background ,color-background))))
   `(link ((t (:underline t))))
   `(link-visited ((t (:underline t))))
   `(linum ((t (:foreground ,color-foreground :background ,color-menu-selection-background))))
   `(match ((t (:inherit isearch))))
   `(next-error ((t (:inherit error))))
   `(nobreak-space ((t (:foreground ,color-foreground))))
   `(region ((t (:foreground ,color-foreground :background ,color-highlight-background))))
   `(trailing-whitespace ((t (:strike-through ,color-2))))
   `(vertical-border ((t (:foreground ,color-foreground))))
   `(window-divider ((t (:background ,color-background))))
   `(window-divider-first-pixel ((t (:background ,color-background))))
   `(window-divider-last-pixel ((t (:background ,color-background))))

   ;; > Flycheck & Flyspell
   `(flycheck-error ((t (:underline (:style wave :color ,error) :foreground ,error))))
   `(flycheck-warning ((t (:underline (:style wave :color ,warning) :foreground ,color-foreground))))
   `(flycheck-info ((t (:underline (:style wave)))))
   `(flycheck-fringe-error ((t (:foreground ,error))))
   `(flycheck-fringe-info ((t (:foreground ,warning))))
   `(flycheck-fringe-warning ((t (:foreground ,warning))))
   `(flyspell-incorrect ((t (:underline (:style line :color ,error)))))
   `(flyspell-duplicate ((t (:underline (:style line :color ,error)))))

   ;; > Compliation
   `(compilation-info ((t (:foreground ,success))))
   `(compilation-error ((t (:foreground ,error))))

   ;; > Diff
   `(diff-header ((t (:foreground ,color-foreground :background ,color-highlight-background))))

   ;; > Mode line
   `(mode-line ((t (:foreground ,color-highlight-foreground :background ,color-3))))
   `(mode-line-inactive ((t (:foreground ,color-foreground :background ,color-menu-selection-background :box ,color-0))))

   ;; > Ivy
   `(ivy-current-match ((t (:background ,color-menu-selection-background :foreground ,color-foreground))))
   `(ivy-minibuffer-match-face-1 ((t (:foreground ,color-0))))
   `(ivy-minibuffer-match-face-3 ((t (:foreground ,color-0))))

   ;; > Org mode
   `(org-level-1 ((t (:foreground ,color-1))))
   `(org-todo ((t (:foreground ,color-2 :weight bold))))
   `(org-done ((t (:foreground ,color-0 :weight normal :strike-through t))))
   `(org-block-begin-line ((t (:foreground ,color-foreground :background ,color-background))))
   `(org-block-end-line ((t (:foreground ,color-foreground :background ,color-background))))
   `(org-block-background ((t (:foreground ,color-foreground :background ,color-highlight-background))))

   ;; > Magit
   `(magit-hash ((t (:foreground ,color-1))))
   `(magit-section-heading ((t (:foreground ,color-foreground :weight normal))))
   `(magit-filename ((t (:foreground ,color-foreground :weight normal))))
   `(magit-section-highlight ((t (:background ,color-menu-background))))
   `(magit-diff-context-highlight ((t (:background ,color-menu-selection-background))))
   `(magit-diff-file-heading ((t (:foreground ,color-foreground :weight normal))))
   `(magit-diff-hunk-heading ((t (:foreground ,color-foreground :weight normal :background ,color-menu-background))))
   `(magit-diff-hunk-heading-highlight ((t (:foreground ,color-foreground :weight normal :background ,color-menu-background))))
   `(magit-diff-removed ((t (:foreground ,color-foreground :background ,removed-color))))
   `(magit-diff-removed-highlight ((t (:foreground ,color-foreground :background ,removed-color))))
   `(magit-diff-added ((t (:foreground ,color-foreground :background ,added-color))))
   `(magit-diff-added-highlight ((t (:foreground ,color-foreground :background ,added-color))))
   `(magit-branch-local ((t (:foreground ,color-0))))
   `(magit-branch-remote ((t (:foreground ,color-0))))

   ;; > Eshell
   `(eshell-prompt ((t (:foreground ,color-0))))
   `(eshell-ls-executable ((t (:foreground ,color-foreground))))
   `(eshell-ls-directory ((t (:foreground ,color-foreground :underline t))))
   `(eshell-ls-product ((t (:foreground ,color-foreground))))

   ;; Evil
   `(evil-search-highlight-persist-highlight-face ((t (:inherit lazy-highlight))))

   ;; Company mode
   `(company-tooltip ((t (:background ,color-menu-background :foreground ,color-2))))
   `(company-tooltip-selection ((t (:background ,color-menu-selection-background :foreground ,color-2))))
   `(company-tooltip-common ((t (:foreground ,color-foreground))))
   `(company-tooltip-common-selection ((t (:foreground ,color-foreground))))
   `(company-scrollbar-bg ((t (:background ,color-menu-background))))
   `(company-scrollbar-fg ((t (:background ,color-menu-selection-background))))
   `(company-preview ((t (:foreground ,color-2))))
   `(company-preview-common ((t (:foreground ,color-2))))
   `(company-preview-search ((t (:background ,color-menu-selection-background :foreground ,warning))))

   ;; Elixir
   `(elixir-atom-face ((t (:foreground ,color-foreground :background ,color-background))))
   `(elixir-attribute-face ((t (:foreground ,color-1 :background ,color-background))))

   ;; Which key
   `(which-key-key-face ((t (:inherit default :foreground ,color-foreground))))
   `(which-key-separator-face ((t (:inherit default :foreground ,color-foreground))))
   `(which-key-command-description-face ((t (:inherit default :foreground ,color-foreground))))

   ;; Show paren
   `(show-paren-match ((t (:foreground ,color-2))))

   ;; Shell scripts
   `(sh-quoted-exec ((t (:foreground ,color-0))))

   ;; LSP
   `(lsp-face-highlight-textual ((t (:inherit default :foreground ,color-2))))
   `(lsp-ui-doc-background ((t (:background ,color-menu-selection-background))))
   `(lsp-ui-doc-header ((t (:inherit lsp-ui-doc-background :foreground ,color-2))))
   `(lsp-ui-peek-peek ((t (:foreground ,color-foreground :background ,color-menu-selection-background))))
   `(lsp-ui-peek-list ((t (:background ,color-menu-selection-background))))
   `(lsp-ui-peek-filename ((t (:foreground ,color-1))))
   `(lsp-ui-peek-line-number ((t (:foreground ,color-1))))
   `(lsp-ui-peek-header ((t (:foreground ,color-highlight-foreground :background ,color-highlight-background))))
   `(lsp-ui-peek-footer ((t (:foreground ,color-highlight-foreground :background ,color-highlight-background))))
   `(lsp-ui-peek-selection ((t (:foreground ,color-highlight-foreground :background ,color-highlight-background))))
   `(lsp-ui-peek-highlight ((t (:foreground ,color-2))))
   `(lsp-ui-sideline-code-action ((t (:foreground ,color-2))))
   ))

(provide-theme 'jc-dark)
