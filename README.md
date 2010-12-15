# less-mode #
Major Emacs mode for editing [http://lesscss.org](Less) files.
Inspired by [https://github.com/antonj/scss-mode](scss-mode).

## Installation ##

    (require 'less-mode)
    (add-to-list 'auto-mode-alist '("\\.less$" . less-mode))

If you use [http://www.emacswiki.org/emacs/SmartCompile](smart-compile):

    (add-to-list 'smart-compile-alist '(less-mode . (less-compile)))
