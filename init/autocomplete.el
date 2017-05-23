;;;; File : autocomplete.el
;;;; Conigure code autocompletion

(unless (package-installed-p 'auto-complete)
  (package-install 'auto-complete))

(require 'auto-complete-config)
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/ac-dict")
(ac-config-default)
