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

(defconst scss-font-lock-keywords
  '(("@[^\s:;]+" . font-lock-constant-face)
    ("//.*$" . font-lock-comment-face)))

(define-derived-mode less-mode css-mode "Less"
  "Major mode for editing Less files, http://lesscss.org"
  (font-lock-add-keywords nil scss-font-lock-keywords))

(provide 'less-mode)
;;; less-mode.el ends here
