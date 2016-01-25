;;;; File: whitespace.el
;;;; whitepace customizations

(require 'whitespace)
(setq whitespace-style '(empty lines-tail tabs tab-mark trailing))
(global-whitespace-mode 1)
(add-hook 'before-save-hook 'whitespace-cleanup)
