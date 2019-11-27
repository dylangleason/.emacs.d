(use-package go-mode
  :defines (gofmt-command flycheck-mode whitespace-style)
  :init
  (setq gofmt-command "goimports")
  :hook
  ((go-mode . (lambda ()
                (setq-local flycheck-mode t)
                (setq-local indent-tabs-mode t)
                (setq-local whitespace-style '(empty lines-tail trailing))))
   (before-save . gofmt-before-save)))

(use-package go-autocomplete
  :after (go-mode))

(use-package go-rename
  :after (go-mode))

(use-package flycheck-gometalinter
  :after (flycheck go-mode)
  :init
  (setq flycheck-gometalinter-fast t
        flycheck-gometalinter-vendor t
        flycheck-gometalinter-enable-linters '("golint"))
  :config
  (flycheck-gometalinter-setup))
