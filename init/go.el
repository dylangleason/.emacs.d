(defun my-go-mode-hook ()
  (setq flycheck-mode t
        indent-tabs-mode t
        gofmt-command "goimports"
        whitespace-style '(empty lines-tail trailing)))

(use-package go-mode
  :hook ((go-mode . my-go-mode-hook)
         (before-save . gofmt-before-save)))

(use-package go-autocomplete
  :after (go-mode))

(use-package go-rename
  :after (go-mode))

(use-package flycheck-gometalinter
  :after (flycheck go-mode)
  :config
  (progn
    (flycheck-gometalinter-setup)
    (setq flycheck-gometalinter-fast t
          flycheck-gometalinter-vendor t
          flycheck-gometalinter-enable-linters '("golint"))))
