(use-package elixir-mode
  :hook (elixir-mode . lsp-deferred))

(use-package alchemist
  :after (elixir-mode))

(provide 'init-elixir)
