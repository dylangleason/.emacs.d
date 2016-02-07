;;;; File: web-mode.el
;;;; web-mode customizations

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(defun my-web-mode-hook ()
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
  (add-hook 'before-save-hook (lambda () (untabify (point-min) (point-max)))))

(add-hook 'web-mode-hook 'my-web-mode-hook)
