;;;; File: whitespace.el
;;;; whitepace customizations

(unless (package-installed-p 'whitespace)
  (package-install 'whitespace))

(require 'whitespace)
(setq whitespace-style '(empty lines-tail tabs tab-mark trailing))
(global-whitespace-mode 1)
(add-hook 'before-save-hook 'whitespace-cleanup)
