;;;; File : autocomplete.el
;;;; Conigure code autocompletion

(require 'auto-complete-config)
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/ac-dict")
(ac-config-default)
