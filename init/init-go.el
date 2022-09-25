(use-package go-mode
  :defines (flycheck-mode
            whitespace-style
            lsp-deferred
            lsp-format-buffer
            lsp-organize-imports)
  :hook
  ((go-mode . (lambda ()
                (rainbow-delimiters-mode-enable)
                (flycheck-mode)
                (setq-local indent-tabs-mode t)
                (setq-local whitespace-style '(empty lines-tail trailing))
                (setq lsp-go-env '((GOFLAGS . "--tags=wireinject")))
                (yas-minor-mode)
                (lsp-deferred)))
   (before-save . lsp-format-buffer)
   (before-save . lsp-organize-imports)))

(use-package go-rename
  :after (go-mode))

(use-package dap-go
  :after (go-mode)
  :ensure nil)

(use-package gotest
  :after (go-mode))

(use-package flycheck-gometalinter
  :after (flycheck go-mode)
  :init
  (setq flycheck-gometalinter-fast t
        flycheck-gometalinter-vendor t
        flycheck-gometalinter-enable-linters '("golint"))
  :config
  (flycheck-gometalinter-setup))

(provide 'init-go)
