# less-mode #
Major Emacs mode for editing [http://lesscss.org](Less) files.

## Installation ##

    (require 'less-mode)
    (add-to-list 'auto-mode-alist '("\\.less$" . less-mode))

If you use [http://www.emacswiki.org/emacs/SmartCompile](smart-compile):

    (add-to-list 'smart-compile-alist '(less-mode . "lessc %f"))
