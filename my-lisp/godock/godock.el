;;; godock.el --- run commands on docker

;; Copyright 2019 John Cinnamond

;; Author: John Cinnamond
;; Version: 1.0.0

;;; Commentary:
;;
;; Run go commands in a docker container.

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

(defgroup godock nil
  "Library for running a command in a docker container."
  :group 'languages)

(defcustom godock-docker-command "docker exec -i"
  "The command to run other commands in a docker container."
  :type 'string
  :group 'godock)

(defcustom godock-container-name ""
  "The docker container to use."
  :type 'string
  :safe t
  :group 'godock)

(defcustom godock-project-root nil
  "Base directory for the project. This is normally calculated but can be overridden by setting this explicitly."
  :type 'string
  :safe t
  :group 'godock)

(defvar godock--last-command nil)

(defun godock--project-root ()
  (if (bound-and-true-p godock-project-root)
      godock-project-root
    (godock--find-project-root)))

(defun godock--filesystem-root-p (directory)
  (string-equal directory (file-name-directory (directory-file-name directory))))

(defun godock--find-project-root (&optional directory)
  "Finds the root directory of the project by walking the directory tree until it finds a file that looks like it belongs in the directory root."
  (let ((directory (file-name-as-directory (or directory default-directory))))
    (cond ((godock--filesystem-root-p directory)
     (error "Could not determine the project root."))
    ((file-exists-p (expand-file-name ".git" directory)) directory)
    ((file-exists-p (expand-file-name "go.mod" directory)) directory)
    ((file-exists-p (expand-file-name "Makefile" directory)) directory)
    (t (godock--find-project-root (file-name-directory (directory-file-name directory)))))))

(defun godock--file-path ()
  (file-relative-name buffer-file-name (godock--project-root)))

(defun godock--run (command)
  (let ((full-command (godock--build-command command)))
    (godock--run-command full-command)
    (setq godock--last-command full-command)))

(defun godock--run-command (command)
  (let ((default-directory (godock--project-root)))
    (compile command)))

(defun godock--build-command (command)
  (if (string= "" godock-container-name)
      (error "Set godock-container-name before trying to run a command")
    (format "%s %s %s"
      godock-docker-command
      godock-container-name
      command)))

(defun godock-build ()
  (interactive)
  (godock--run "go build"))

(defun godock-test-file ()
  (interactive)
  (godock--run (format "go test %s" (godock--file-path))))

(defun godock-rerun ()
  (interactive)
  (if (bound-and-true-p godock--last-command)
      (godock--run-command godock--last-command)
    (error "Godock has not been run yet")))

(define-minor-mode godock
  "Run a command in a docker container")

(provide 'godock)
;;; godock.el ends here
