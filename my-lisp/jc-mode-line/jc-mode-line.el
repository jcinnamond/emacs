;;; jc-mode-line.el --- custom modeline

;; Copyright 2018 John Cinnamond

;; Author: John Cinnamond
;; Version: 1.1.0

;;; Commentary:
;;
;; My modeline config. Try to make the key information obvious. Strip
;; out a lot of stuff I don't use.

;;; License:

;; This file is not part of GNU Emacs.
;; However, it is distributed under the same license.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(make-face 'jc-mode-line-buffername-face)
(make-face 'jc-mode-line-mode-face)
(make-face 'jc-mode-line-space-face)
(make-face 'jc-mode-line-position-face)
(make-face 'jc-mode-line-flycheck-error-face)
(make-face 'jc-mode-line-flycheck-warning-face)
(make-face 'jc-mode-line-state-normal-face)
(make-face 'jc-mode-line-state-insert-face)
(make-face 'jc-mode-line-state-emacs-face)
(make-face 'jc-mode-line-state-replace-face)
(make-face 'jc-mode-line-state-visual-face)
(make-face 'jc-mode-line-state-motion-face)

(defun jc-mode-line-line-count ()
  "Count the number of lines in a file"
  (int-to-string (line-number-at-pos (point-max))))

(defun jc-mode-line-flycheck-summary ()
  "Return a count of the number of flycheck errors in a file, if applicable. The result is propertized for the modeline."
  (if (bound-and-true-p flycheck-mode)
      (let ((error-type (caar (flycheck-count-errors flycheck-current-errors)))
            (error-count (cdar (flycheck-count-errors flycheck-current-errors))))
        (cond ((eq 'error error-type)
               (propertize (format "  %d errors " error-count)
                           'face 'jc-mode-line-flycheck-error-face))
              ((eq 'warning error-type)
               (propertize (format "  %d warnings " error-count) 'face
                           'jc-mode-line-flycheck-warning-face))
              ((eq 'info error-type)
               (propertize (format "  %d comments " error-count)
                           'face 'jc-mode-line-flycheck-warning-face))))))

(defun jc-mode-line-state ()
  "Returns information about the current spacemacs state."
  (if (bound-and-true-p evil-local-mode)
      (pcase evil-state
        ('normal  (propertize "<N> " 'face 'jc-mode-line-state-normal-face))
        ('insert  (propertize "<I> " 'face 'jc-mode-line-state-insert-face))
        ('emacs   (propertize "<E> " 'face 'jc-mode-line-state-emacs-face))
        ('replace (propertize "<R> " 'face 'jc-mode-line-state-replace-face))
        ('visual  (propertize "<V> " 'face 'jc-mode-line-state-visual-face))
        ('motion  (propertize "<M> " 'face 'jc-mode-line-state-motion-face)))))

(defun jc-mode-line-init ()
  "Set the modeline"
  (interactive)
  (setq-default mode-line-format
    '("%e"
      (:eval (jc-mode-line-flycheck-summary))
      (:eval (jc-mode-line-state))
      " %*  "
      (:eval (abbreviate-file-name default-directory))
      (:propertize " %b " face jc-mode-line-buffername-face)
      (:propertize "  %l/" face jc-mode-line-position-face)
      (:eval (propertize (jc-mode-line-line-count) 'face 'jc-mode-line-position-face))
      (:propertize "  |  " face jc-mode-line-space-face)
      mode-name
      )))

(provide 'jc-mode-line)
;;; jc-mode-line.el ends here
