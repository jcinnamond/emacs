;;; jc-compile.el --- helpers for compiling things in named buffers

;; Copyright 2019 John Cinnamond

;; Author: John Cinnamond
;; Version: 1.0.0

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

(defun jc-compile/compile (command name)
  "Run COMMAND in a named buffer"
  (compilation-start command nil (lambda (x) name)))

(provide 'jc-compile)
;; jc-compile.el ends here
