;;; monorepo.el --- commands for navigating and running commands in a
;;; monorepo

;; Copyright 2019 John Cinnamond

;; Author: John Cinnamond
;; Version: 1.0.0

;;; Commentary:
;;
;; Monorepos have a single git root so tend to be treated as a single
;; project by tools such as projectile. However they can also be
;; thought of as comprising a number of (partially) independent
;; projects - hereafter referred to as `services`.
;;
;; This minor mode adds commands for navigating both within a single
;; service and within the whole repo. It also adds functions for
;; running commands in either the current service, or the monorepo
;; root.

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

;; f.el provides helpers for working with files and directories
(require 'f)

;; (defgroup gorun nil
;;   "Library for running a command in a docker container."
;;   :group 'languages)

;; (defcustom gorun-docker-command "docker exec -i"
;;   "The command to run other commands in a docker container."
;;   :type 'string
;;   :group 'gorun)

;; (defvar gorun--last-command nil)

;; (defun gorun--find-project-root (&optional directory)
;;   "Finds the root directory of the project by walking the directory tree until it finds a file that looks like it belongs in the directory root."
;;   (let ((directory (file-name-as-directory (or directory default-directory))))
;;     (cond ((gorun--filesystem-root-p directory)
;;      (error "Could not determine the project root."))
;;     ((file-exists-p (expand-file-name ".git" directory)) directory)
;;     ((file-exists-p (expand-file-name "go.mod" directory)) directory)
;;     ((file-exists-p (expand-file-name "Makefile" directory)) directory)
;;     (t (gorun--find-project-root (file-name-directory (directory-file-name directory)))))))

;;;----------------------------------------------------------------------
;;; Helpers

(defmacro monorepo--memoize (name fn)
  "Returns name, or calculates and sets it from fn to avoid running multiple times"
  `(if (boundp (quote ,name))
       ,name
     (setq-local ,name ,fn)))

;;;;----------------------------------------------------------------------
;;; Working with the whole monorepo

(defvar monorepo--root-directory)

(defun monorepo/repo-root-directory ()
  "Returns the root directory for the monorepo"
  (monorepo--memoize monorepo--root-directory (monorepo--find-and-set-root-directory)))

(defun monorepo--find-and-set-root-directory (&optional directory)
  "Finds the root directory by looking for a .git directory"
  (let ((directory (monorepo--starting-directory directory)))
    (if (f-root-p directory)
        (error "Could not determine the monorepo root."))
    (if (monorepo--has-dot-git-p directory)
        (setq-local monorepo--root-directory directory)
      (monorepo--find-and-set-root-directory (f-parent directory)))))

(defun monorepo--starting-directory (&optional directory)
  "Returns the starting point used for looking for the repo root"
  (file-name-as-directory (or directory default-directory)))

(defun monorepo--has-dot-git-p (directory)
  "Checks if a directory contains a .git directory"
  (let ((git-dir (expand-file-name ".git" directory)))
    (and (file-exists-p git-dir)
         (file-directory-p git-dir))))

(defun monorepo/compile-in-repo (command)
  "Run a command in the repo root directory"
  (let ((default-directory (monorepo/repo-root-directory)))
    (compile command)))

;;;----------------------------------------------------------------------
;;; Working with the current service

(defvar monorepo--service-name)
(defvar monorepo--service-directory)

(defun monorepo/service-name ()
  "Returns the base directory for the current service."
  (monorepo--memoize monorepo--service-name (monorepo--find-service-name)))

(defun monorepo/service-directory ()
  "Returns the full path to the directory containing the service"
  (monorepo--memoize monorepo--service-directory
                     (f-join (monorepo/repo-root-directory) (monorepo/service-name))))

(defun monorepo--find-service-name ()
  "Calculate the name of the current service from the current path. This is assumed to be one level down from the repo root"
  (car (f-split (f-relative (f-this-file) (monorepo/repo-root-directory)))))

(defun monorepo/compile-in-service (command)
  "Run a command in the service directory"
  (let ((default-directory (monorepo/service-directory)))
    (compile command)))

;; monorepo.el ends here
