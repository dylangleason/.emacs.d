;;;; File: go.el
;;;; go-mode configuration file.

(require 'go-mode)

(defun my-go-mode-hook ()
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (define-key go-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region))

(add-hook 'go-mode-hook 'my-go-mode-hook)
