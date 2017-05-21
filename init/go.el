;;;; File: go.el
;;;; go-mode configuration file.

(require 'go-mode)
(require 'go-autocomplete)
(require 'flycheck-gometalinter)

(defun load-gopath ()
  (when (display-graphic-p)
    (exec-path-from-shell-copy-env "GOPATH")))

(defun my-go-mode-hook ()
  (load-gopath)
  (setq flycheck-mode t)
  (setq indent-tabs-mode t
        gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq whitespace-style '(empty lines-tail trailing)))

(add-hook 'go-mode-hook 'my-go-mode-hook)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-gometalinter-setup))

(setq flycheck-gometalinter-fast t)
(setq flycheck-gometalinter-vendor t)
