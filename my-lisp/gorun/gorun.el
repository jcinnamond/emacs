;;; gorun.el --- run commands on docker

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

(defgroup gorun nil
  "Library for running a command in a docker container."
  :group 'languages)

(defcustom gorun-docker-command "docker exec -i"
  "The command to run other commands in a docker container."
  :type 'string
  :group 'gorun)

(defcustom gorun-container-name ""
  "The docker container to use."
  :type 'string
  :safe t
  :group 'gorun)

(defcustom gorun-project-root nil
  "Base directory for the project. This is normally calculated but can be overridden by setting this explicitly."
  :type 'string
  :safe t
  :group 'gorun)

(defvar gorun--last-command nil)

(defun gorun--project-root ()
  (if (bound-and-true-p gorun-project-root)
      gorun-project-root
    (gorun--find-project-root)))

(defun gorun--filesystem-root-p (directory)
  (string-equal directory (file-name-directory (directory-file-name directory))))

(defun gorun--find-project-root (&optional directory)
  "Finds the root directory of the project by walking the directory tree until it finds a file that looks like it belongs in the directory root."
  (let ((directory (file-name-as-directory (or directory default-directory))))
    (cond ((gorun--filesystem-root-p directory)
     (error "Could not determine the project root."))
    ((file-exists-p (expand-file-name ".git" directory)) directory)
    ((file-exists-p (expand-file-name "go.mod" directory)) directory)
    ((file-exists-p (expand-file-name "Makefile" directory)) directory)
    (t (gorun--find-project-root (file-name-directory (directory-file-name directory)))))))

(defun gorun--file-path ()
  (file-relative-name buffer-file-name (gorun--project-root)))

(defun gorun--run (command)
  (let ((full-command (gorun--build-command command)))
    (gorun--run-command full-command)
    (setq gorun--last-command full-command)))

(defun gorun--run-command (command)
  (let ((default-directory (gorun--project-root)))
    (compile command)))

(defun gorun--build-command (command)
  (if (string= "" gorun-container-name)
      command
    (format "%s %s %s"
      gorun-docker-command
      gorun-container-name
      command)))

(defun gorun-build ()
  (interactive)
  (gorun--run "go build"))

(defun gorun-test-file ()
  (interactive)
  (gorun--run (format "go test %s" (gorun--file-path))))

(defun gorun-test-single ()
  (interactive)
  (gorun--run (format "go test -run %s" (go--function-name))))

(defun gorun-test-all ()
  (interactive)
  (gorun--run (format "go test")))

(defun gorun-rerun ()
  (interactive)
  (if (bound-and-true-p gorun--last-command)
      (gorun--run-command gorun--last-command)
    (error "Godock has not been run yet")))

(define-minor-mode gorun
  "Run a command in a docker container")

(provide 'gorun)
;;; gorun.el ends here
