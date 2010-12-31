;;; less-mode.el --- major mode for editing Less files

;; Copyright (C) 2010 myfreeweb

;; Author: myfreeweb <me@myfreeweb.ru>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(require 'derived)
(require 'compile)

(defconst less-font-lock-keywords
  '(("@[^\s:;]+" . font-lock-constant-face)
    ("//.*$" . font-lock-comment-face)))

(defgroup less nil
  "Less mode"
  :prefix "less-"
  :group 'css)

(defcustom less-lessc-command "lessc --no-color"
  "Less compiler command"
  :group 'less)

(defcustom less-compile-at-save t
  "If not nil, Less buffers will be compiled on each save"
  :type 'boolean
  :group 'less)

(defcustom less-mode-hook nil
  "Hook run when entering Less mode"
  :type 'hook
  :group 'less)

(defun less-compile ()
  "Compiles the current buffer"
  (interactive)
  (compile (concat less-lessc-command " " buffer-file-name)))

(defun less-compile-maybe ()
  "Runs `less-compile' on if `less-compile-at-save' is not nil"
  (if less-compile-at-save
      (less-compile)))

(defun flymake-less-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "lessc" (list "--no-color" local-file))))

(when (featurep 'flymake)
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.less$" flymake-less-init))
  (add-to-list 'flymake-err-line-patterns
               '("! \\(.*\\): on line \\([0-9]+\\): \\(.*\\)"
                 nil 2 nil 3))
  (add-to-list 'flymake-err-line-patterns
               '("! \\(.*\\): \\(.*\\)"
                 nil nil nil 2)))

(define-derived-mode less-mode css-mode "Less"
  "Major mode for editing Less files, http://lesscss.org"
  (run-hooks 'css-mode-hook)
  (when (featurep 'flymake) (flymake-mode t))
  (font-lock-add-keywords nil less-font-lock-keywords)
  (add-hook 'after-save-hook 'less-compile-maybe nil t))

(provide 'less-mode)
;;; less-mode.el ends here
