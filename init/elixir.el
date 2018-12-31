(use-package elixir-mode
  :hook (elixir-mode . flycheck-mode))

(use-package alchemist
  :after (elixir-mode))

(use-package flycheck-elixir
  :after (elixir-mode))
