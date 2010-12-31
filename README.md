# less-mode #
Major Emacs mode for editing [Less](http://lesscss.org) files.
Inspired by [scss-mode](https://github.com/antonj/scss-mode).

## Installation ##

    (require 'less-mode)
    (add-to-list 'auto-mode-alist '("\\.less$" . less-mode))

If you use [smart-compile](http://www.emacswiki.org/emacs/SmartCompile):

    (add-to-list 'smart-compile-alist '(less-mode . (less-compile)))

If you use [Flymake](http://www.emacswiki.org/emacs/FlyMake), it will work automatically.
