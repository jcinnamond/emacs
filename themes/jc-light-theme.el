;; -*- eval: (rainbow-mode) -*-

(require 'color)

(deftheme jc-light "My minimalist, light theme")

(let* ((bg-color "#FFFFFF")
       (fg-color "#000000")
       (contrast-1-color "#315162")
       (contrast-2-color "#313862")
       (highlight-bg-color "#d5d7df")
       (menu-bg-color (color-darken-name bg-color 10))
       (menu-selection-bg-color (color-darken-name bg-color 20))
       (highlight-fg-color (color-darken-name (color-complement-hex highlight-bg-color) 10))
       (success "#3E8870")
       (warning "#A66F32")
       (error "#A43235")

       (added-color (color-lighten-name success 20))
       (removed-color (color-lighten-name error 20)))

  (custom-theme-set-faces
   'jc-light

   `(bold ((t (:weight bold))))
   `(bold-italic ((t (:weight bold :slant italic))))
   `(default ((t (:foreground ,fg-color :background ,bg-color))))
   `(error ((t (:foreground ,error :weight bold))))
   `(italic ((t (:slant italic))))
   `(shadow ((t (:foreground ,fg-color))))
   `(underline ((t (:underline t))))
   `(warning ((t (:foreground ,warning))))

   `(font-lock-comment-face ((t (:foreground ,contrast-1-color :background ,bg-color :slant italic))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,contrast-1-color :slant italic))))
   `(font-lock-string-face ((t (:foreground ,fg-color))))
   `(font-lock-warning-face ((t (:foreground ,warning))))

   `(font-lock-builtin-face ((t (:foreground ,fg-color))))
   `(font-lock-constant-face ((t (:foreground ,fg-color))))
   `(font-lock-doc-face ((t (:foreground ,contrast-2-color))))
   `(font-lock-function-name-face ((t (:foreground ,fg-color :weight normal))))
   `(font-lock-keyword-face ((t (:foreground ,contrast-2-color :weight semi-bold))))
   `(font-lock-negation-char-face ((t (:foreground ,fg-color))))
   `(font-lock-preprocessor-face ((t (:foreground ,fg-color))))
   `(font-lock-reference-face ((t (:foreground ,fg-color))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,fg-color))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,fg-color))))
   `(font-lock-type-face ((t (:foreground ,fg-color :weight normal))))
   `(font-lock-variable-name-face ((t (:foreground ,fg-color))))

   ;; +--- UI ---+
   `(minibuffer-prompt ((t (:foreground ,fg-color, :weight normal))))

   `(border ((t (:foreground ,fg-color))))
   `(cursor ((t (:background ,fg-color))))
   `(highlight ((t (:foreground ,highlight-fg-color :background ,highlight-bg-color))))
   `(hl-line ((t (:background ,menu-bg-color))))
   `(isearch ((t (:foreground ,highlight-fg-color :background ,highlight-bg-color))))
   `(isearch-fail ((t (:background ,error, :foreground ,fg-color))))
   `(link ((t (:underline t))))
   `(link-visited ((t (:underline t))))
   `(linum ((t (:foreground ,fg-color :background ,menu-bg-color))))
   `(linum-relative-current-face ((t (:foreground ,fg-color :background ,highlight-fg-color))))
   `(match ((t (:inherit isearch))))
   `(next-error ((t (:inherit error))))
   `(nobreak-space ((t (:foreground ,fg-color))))
   `(region ((t (:foreground ,fg-color :background ,highlight-bg-color))))
   `(show-paren-match-face ((t (:foreground ,fg-color :background ,menu-selection-bg-color))))
   `(show-paren-mismatch-face ((t (:foreground ,fg-color, :background ,error))))
   `(trailing-whitespace ((t (:foreground ,warning))))
   `(vertical-border ((t (:foreground ,fg-color))))
   `(window-divider ((t (:background ,bg-color))))
   `(window-divider-first-pixel ((t (:background ,bg-color))))
   `(window-divider-last-pixel ((t (:background ,bg-color))))

   ;; > Flycheck & Flyspell
   `(flycheck-error ((t (:underline (:style wave :color ,error) :background ,error :foreground ,bg-color))))
   `(flycheck-warning ((t (:box t :background ,bg-color :foreground ,warning))))
   `(flycheck-info ((t (:underline (:style wave :color ,warning) :foreground ,warning))))
   `(flycheck-fringe-error ((t (:foreground ,error))))
   `(flycheck-fringe-info ((t (:foreground ,error))))
   `(flycheck-fringe-warning ((t (:foreground ,warning))))
   `(flyspell-incorrect ((t (:underline (:style wave :color ,warning)))))

   ;; > Compliation
   `(compilation-info ((t (:foreground ,success))))
   `(compilation-error ((t (:foreground ,error))))

   ;; > Diff
   `(diff-header ((t (:foreground ,fg-color :background ,highlight-bg-color))))


   ;; > Ivy
   `(ivy-current-match ((t (:background ,menu-selection-bg-color :foreground ,fg-color))))
   `(ivy-minibuffer-match-face-2 ((t (:foreground ,success))))

   ;; > Mode line
   `(mode-line ((t (:foreground ,fg-color :background ,added-color))))
   `(mode-line-inactive ((t (:foreground ,fg-color :background ,menu-bg-color))))

   ;; > Org mode
   `(org-level-1 ((t (:foreground ,fg-color :background ,highlight-bg-color))))
   `(org-todo ((t (:foreground ,warning :weight bold))))
   `(org-block-begin-line ((t (:foreground ,fg-color :background ,bg-color))))
   `(org-block-end-line ((t (:foreground ,fg-color :background ,bg-color))))
   `(org-block-background ((t (:foreground ,fg-color :background ,highlight-bg-color))))

   ;; > Magit
   `(magit-section-heading ((t (:foreground ,fg-color :weight normal))))
   `(magit-filename ((t (:foreground ,fg-color :weight normal))))
   `(magit-section-highlight ((t (:background ,menu-bg-color))))
   `(magit-diff-context-highlight ((t (:background ,menu-selection-bg-color))))
   `(magit-diff-file-heading ((t (:foreground ,fg-color :weight normal))))
   `(magit-diff-hunk-heading ((t (:foreground ,fg-color :weight normal :background ,menu-bg-color))))
   `(magit-diff-hunk-heading-highlight ((t (:foreground ,fg-color :weight normal :background ,menu-bg-color))))
   `(magit-diff-removed ((t (:foreground ,fg-color :background ,removed-color))))
   `(magit-diff-removed-highlight ((t (:foreground ,fg-color :background ,error))))
   `(magit-diff-added ((t (:foreground ,fg-color :background ,added-color))))
   `(magit-diff-added-highlight ((t (:foreground ,fg-color :background ,added-color))))
   `(magit-branch-local ((t (:foreground ,fg-color))))
   `(magit-branch-remote ((t (:foreground ,fg-color))))

   ;; > Eshell
   `(eshell-prompt ((t (:foreground ,fg-color))))
   `(eshell-ls-executable ((t (:foreground ,fg-color))))
   `(eshell-ls-directory ((t (:foreground ,warning))))

   ;; > Web mode
   `(web-mode-html-tag-face ((t (:foreground ,fg-color))))
   `(web-mode-builtin-face ((t (:foreground ,fg-color))))
   `(web-mode-keyword-face ((t (:foreground ,fg-color))))
   `(web-mode-type-face ((t (:foreground ,fg-color))))
   `(web-mode-block-delimiter-face ((t (:weight normal))))
   `(web-mode-block-string-face ((t (:foreground ,fg-color))))
   `(web-mode-html-attr-name-face ((t (:foreground ,fg-color))))
   `(web-mode-html-attr-value-face ((t (:foreground ,fg-color))))
   `(web-mode-symbol-face ((t (:foreground ,fg-color))))

   ;; Evil
   `(evil-search-highlight-persist-highlight-face ((t (:foreground ,highlight-fg-color :background ,highlight-bg-color))))

   ;; Company mode
   `(company-tooltip ((t (:background ,menu-bg-color :foreground ,fg-color))))
   `(company-tooltip-selection ((t (:background ,menu-selection-bg-color :foreground ,fg-color))))
   `(company-tooltip-common ((t (:foreground ,contrast-1-color))))
   `(company-tooltip-common-selection ((t (:foreground ,contrast-1-color))))
   `(company-scrollbar-bg ((t (:background ,menu-bg-color))))
   `(company-scrollbar-fg ((t (:background ,menu-selection-bg-color))))
   `(company-preview ((t (:background ,menu-selection-bg-color :foreground ,fg-color))))
   `(company-preview-common ((t (:background ,menu-selection-bg-color :foreground ,fg-color))))
   `(company-preview-search ((t (:background ,menu-selection-bg-color :foreground ,warning))))

   ;; Elixir
   `(elixir-atom-face ((t (:foreground ,fg-color :background ,bg-color))))
   `(elixir-attribute-face ((t (:foreground ,contrast-1-color :background ,bg-color))))
   ))

(provide-theme 'jc-light)
