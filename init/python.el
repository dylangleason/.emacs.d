(use-package python
  :defines (flycheck-mode flycheck-python-pylint-executable)
  :hook (python-mode . flycheck-mode)
  :init
  (setq flycheck-python-pylint-executable "~/.pyenv/shims/python")
  :interpreter ("python" . python-mode)
  :mode ("\\.py\\'" . python-mode))

(use-package elpy
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))
