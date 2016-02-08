;;;; File: go.el
;;;; go-mode configuration file.

(require 'go-mode)

(defun load-gopath ()
  (when (display-graphic-p)
    (exec-path-from-shell-copy-env "GOPATH")))

(defun my-go-mode-hook ()
  (load-gopath)
  (setq indent-tabs-mode t
        gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save))

(add-hook 'go-mode-hook 'my-go-mode-hook)
