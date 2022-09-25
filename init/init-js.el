(use-package js-comint)

(use-package js-doc)

(use-package js2-mode
  :hook (js2-mode . lsp-deferred)
  :bind (:map js2-mode-map
              ("C-x C-e" . js-send-last-sexp)
              ("C-x M-x" . js-send-last-sexp-and-go)
              ("C-c C-r" . js-send-region)
              ("C-c C-b" . js-send-buffer-and-go)
              ("C-c b" . js-send-buffer)
              ("C-c l" . js-load-file-and-go)
              ("C-c i" . js-doc-insert-function-doc))
  :mode "\\.js\\'"
  :init
  (setq indent-tabs-mode nil))

(provide 'init-js)
