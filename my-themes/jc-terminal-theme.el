;; -*- eval: (rainbow-mode) -*-

(require 'color)

(deftheme jc-terminal "Dark theme based on https://terminal.sexy/")

(let* (
       (color-black0 "#1d1f21")
       (color-black1 "#282a2e")
       (color-black2 "#373b41")
       (color-red1 "#a54242")
       (color-red2 "#cc6666")
       (color-green1 "#8c9440")
       (color-green2 "#b5bd68")
       (color-yellow1 "#de935f")
       (color-yellow2 "#f0c674")
       (color-blue1 "#5f819d")
       (color-blue2 "#81a2be")
       (color-magenta1 "#85678f")
       (color-magenta2 "#b294bb")
       (color-cyan1 "#5e8d87")
       (color-cyan2 "#8abeb7")
       (color-white1 "#707880")
       (color-white2 "#c5c8c6")

       ;; (color-darken-name "#24323d" 20)

       (color-background color-black0)
       (color-subtle-background color-black1)
       (color-inactive-background color-black1)

       (color-foreground color-white2)

       (color-comment color-white1)
       (color-keyword color-cyan1)
       (color-constant color-cyan1)

       (color-prompt color-blue2)
       (color-match color-green1)

       (color-highlight-background color-red1)
       (color-highlight-subtle-background color-black1)
       (color-highlight-foreground color-white2)
       (color-standout color-yellow1)
       (color-diminshed color-white1)
       (color-subtle color-red1)

       (color-menu-background "#384d5d")
       (color-menu-selection-background "#24323d")

       (color-success color-green1)
       (color-warning color-yellow1)
       (color-error color-red1)

       (added-color color-green1)
       (removed-color color-red2)

       (color-modeline-background color-red1)
       (color-modeline-foreground color-white2))

  (custom-theme-set-faces
   'jc-terminal

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
   `(font-lock-string-face ((t (:inherit default))))
   `(font-lock-warning-face ((t (:foreground ,color-warning))))

   `(font-lock-builtin-face ((t (:inherit default))))
   `(font-lock-constant-face ((t (:foreground ,color-constant))))
   `(font-lock-function-name-face ((t (:foreground ,color-foreground weight: normal))))
   `(font-lock-keyword-face ((t (:foreground ,color-keyword))))
   `(font-lock-negation-char-face ((t (:inherit default))))
   `(font-lock-preprocessor-face ((t (:inherit default))))
   `(font-lock-reference-face ((t (:inherit default))))
   `(font-lock-regexp-grouping-backslash ((t (:inherit default))))
   `(font-lock-regexp-grouping-construct ((t (:inherit default))))
   `(font-lock-type-face ((t (:inherit default))))
   `(font-lock-variable-name-face ((t (:inherit default))))

   ;; +--- UI ---+
   `(minibuffer-prompt ((t (:foreground ,color-prompt, :weight normal))))

   `(cursor ((t (:background ,color-foreground))))
   `(border ((t (:background ,color-background))))
   `(highlight ((t (:foreground ,color-highlight-foreground :background ,color-highlight-background))))
   `(hl-line ((t (:background ,color-black1))))
   `(isearch ((t (:foreground ,color-match))))
   `(isearch-fail ((t (:foreground ,color-error))))
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
   `(mode-line ((t (:foreground ,color-modeline-foreground :background ,color-modeline-background))))
   `(mode-line-inactive ((t (:foreground ,color-foreground :background ,color-menu-background))))

   ;; > Ivy
   `(ivy-current-match ((t (:background ,color-menu-selection-background))))
   `(ivy-minibuffer-match-face-1 ((t (:foreground ,color-match))))
   `(ivy-posframe ((t (:background ,color-menu-background))))
   `(ivy-posframe-border ((t (:background ,color-black2))))

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
   `(magit-hash ((t (:foreground ,color-blue1))))
   `(magit-section-heading ((t (:inherit default))))
   `(magit-section-highlight ((t (:inherit default))))
   `(magit-diff-context-highlight ((t (:inherit default))))
   `(magit-diff-file-heading ((t (:inherit default))))
   `(magit-diff-hunk-heading ((t (:inherit default))))
   `(magit-diff-hunk-heading-highlight ((t (:inherit default))))
   `(magit-diff-removed ((t (:inherit default :foreground ,color-red2))))
   `(magit-diff-removed-highlight ((t (:inherit default :foreground ,color-red1))))
   `(magit-diff-added ((t (:inherit default :foreground ,color-green2))))
   `(magit-diff-added-highlight ((t (:inherit default :foreground ,color-green1))))
   `(magit-branch-local ((t (:foreground ,color-blue2))))
   `(magit-branch-remote ((t (:foreground ,color-blue2))))
   `(magit-tag ((t (:foreground ,color-blue1))))

   ;; > Eshell
   `(eshell-prompt ((t (:foreground ,color-blue2))))
   `(eshell-ls-executable ((t (:inherit default))))
   `(eshell-ls-directory ((t (:inherit default :underline t))))
   `(eshell-ls-product ((t (:inherit default))))

   ;; Evil
   `(evil-search-highlight-persist-highlight-face ((t (:inherit lazy-highlight))))

   ;; Company mode
   `(company-tooltip ((t (:background ,color-menu-background :foreground ,color-white1))))
   `(company-tooltip-selection ((t (:background ,color-menu-selection-background :foreground ,color-foreground))))
   `(company-tooltip-common ((t (:foreground ,color-match))))
   `(company-tooltip-common-selection ((t (:foreground ,color-match))))
   `(company-scrollbar-bg ((t (:background ,color-background))))
   `(company-scrollbar-color-fg ((t (:background ,color-background))))
   `(company-preview ((t (:foreground ,color-match))))
   `(company-preview-common ((t (:foreground ,color-match))))
   `(company-preview-search ((t (:background ,color-menu-selection-background :foreground ,color-match))))
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
   `(lsp-face-highlight-textual ((t (:inherit default :foreground ,color-match))))
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

(provide-theme 'jc-terminal)
