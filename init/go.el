;;;; File: go.el
;;;; go-mode configuration file.

(packages-require
 'go-mode
 'go-autocomplete
 'flycheck-gometalinter)

(defun load-gopath ()
  (when (display-graphic-p)
    (exec-path-from-shell-copy-env "GOPATH")))

(defun my-go-mode-hook ()
  (load-gopath)
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq flycheck-mode t)
  (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-gometalinter-setup))
  (setq flycheck-gometalinter-fast t)
  (setq flycheck-gometalinter-vendor t)
  (setq indent-tabs-mode t gofmt-command "goimports")
  (setq whitespace-style '(empty lines-tail trailing)))

(add-hook 'go-mode-hook 'my-go-mode-hook)