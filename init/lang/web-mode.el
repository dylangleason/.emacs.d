;;;; File: web-mode.el
;;;; web-mode customizations

(use-package web-mode
  :mode "\\.html?\\'"
  :hook (before-save . remove-tabs)
  :config
  (setq web-mode-css-indent-offset 4
        web-mode-code-indent-offset 4
        web-mode-markup-indent-offset 4
        web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'"))))
