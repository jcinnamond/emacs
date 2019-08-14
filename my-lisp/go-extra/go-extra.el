;;; go-extra.el --- commands for running Go programs

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


;;----------------------------------------------------------------------
;; Switch between test and implementation

(defun go-extra/test-file-p ()
  "Predicate to work out if current file is a test"
  (string-suffix-p "_test"
                   (file-name-sans-extension (file-name-nondirectory (buffer-file-name)))))

(defun go-extra/switch-to-test ()
  "Open test for the current file (assuming matching filenames)"
  (let ((directory (file-name-directory (buffer-file-name)))
        (basename (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))
        (extn (file-name-extension (buffer-file-name))))
    (find-file (format "%s/%s_test.%s" directory basename extn))))

(defun go-extra/switch-to-implementation ()
  "Open implementation for the current test (assuming matching filenames)"
  (let ((directory (file-name-directory (buffer-file-name)))
        (basename (string-remove-suffix "_test" (file-name-sans-extension (file-name-nondirectory (buffer-file-name)))))
        (extn (file-name-extension (buffer-file-name))))
    (find-file (format "%s/%s.%s" directory basename extn))))

(defun go-extra/switch-to-alternative ()
  "Switch between test and implementation files"
  (interactive)
  (if (go-extra/test-file-p)
      (go-extra/switch-to-implementation)
    (go-extra/switch-to-test)))


;;----------------------------------------------------------------------
;; Commands for running go

(require 'jc-compile)

(defconst go-extra/test-buffer-name "* Go Test *")
(defconst go-extra/compile-buffer-name "* Go *")

(defvar go-extra/package-directory nil "the directory containing the current package")

(defun go-extra--package-directory ()
  "Return or calcualte the directory for running go commands"
  (if (bound-and-true-p go-extra/package-directory)
      go-extra/package-directory
    (setq-local go-extra/package-directory ".")))

(defun go-extra--build-path (&optional file)
  "Return the path to a file or directory, for passing to a go command"
  (let ((final-part (or file "...")))
    (format "%s/%s" (go-extra--package-directory) final-part)))

(defun go-extra--run-command (command name &optional path)
  "Build and run a command"
  (my-config/run-in-root (jc-compile/compile (format "%s %s" command (go-extra--build-path path)) name)))

(defun go-extra/compile ()
  "Compile the current directory"
  (interactive)
  (go-extra--run-command "go build" go-extra/compile-buffer-name))

(defun go-extra/run ()
  "Run the current directory"
  (interactive)
  (go-extra--run-command "go run" go-extra/compile-buffer-name "main.go"))

(defun go-extra/test ()
  "Test the current directory"
  (interactive)
  (go-extra--run-command "go test" go-extra/test-buffer-name))

(defun go-extra/test-single ()
  "Run the current test"
  (interactive)
  (jc-compile/compile (format "go test -run %s" (go--function-name)) go-extra/test-buffer-name))


(provide 'go-extra)
;; go-extra.el ends here
