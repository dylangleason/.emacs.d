;;;; File: go.el
;;;; go-mode configuration file.

(defun my-go-mode-hook ()
  (setq flycheck-mode t)
  (setq indent-tabs-mode t gofmt-command "goimports")
  (setq whitespace-style '(empty lines-tail trailing)))

(use-package go-mode
  :ensure t
  :hook ((go-mode . my-go-mode-hook)
         (before-save . gofmt-before-save)))

(use-package go-autocomplete
  :ensure t
  :after (go-mode))

(use-package flycheck-gometalinter
  :ensure t
  :after (flycheck go-mode)
  :config
  (progn
    (flycheck-gometalinter-setup)
    (setq flycheck-gometalinter-fast t
          flycheck-gometalinter-vendor t
          flycheck-gometalinter-enable-linters '("golint"))))
