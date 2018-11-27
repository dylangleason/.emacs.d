(use-package elixir-mode
  :demand
  :hook (elixir-mode . flycheck-mode))

(use-package alchemist
  :demand
  :after (elixir-mode))

(use-package flycheck-elixir
  :demand
  :after (elixir-mode))
